"""Static content regressions; engine reflection checks run separately (see README)."""
import re,unittest,xml.etree.ElementTree as ET
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
MOD=ROOT/'Mod'
def language(name):
    result={}
    for f in (MOD/'Languages'/name/'DefInjected').rglob('*.xml'):
        for node in ET.parse(f).getroot():
            if node.tag in result: raise AssertionError(f'Duplicate {name} key: {node.tag}')
            result[node.tag]=node.text or ''
    return result
class ContentTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.en=language('English'); cls.fr=language('French'); cls.expected={}; cls.defs=[]
        for f in (MOD/'Defs').rglob('*.xml'):
            for d in ET.parse(f).getroot():
                name=d.findtext('defName')
                if not name: continue
                cls.defs.append(d)
                for group in ('degreeDatas','stages'):
                    container=d.find(group)
                    if container is None: continue
                    counts={}
                    for i,item in enumerate(container):
                        handle=re.sub('[^A-Za-z0-9_]','',item.findtext('label','').replace(' ','_')) or str(i)
                        n=counts.get(handle,0);counts[handle]=n+1
                        if n:handle+='-'+str(n)
                        for field in ('label','description','labelMale','labelFemale'):
                            e=item.find(field)
                            if e is not None:cls.expected[f'{name}.{group}.{handle}.{field}']=e.text or ''
    def test_xml_well_formed_and_unique_def_names(self):
        for f in MOD.rglob('*.xml'): ET.parse(f)
        names=[d.findtext('defName') for d in self.defs]
        self.assertEqual(len(names),len(set(names)))
    def test_complete_french_coverage_and_no_extra_keys(self):
        self.assertSetEqual(set(self.expected),set(self.fr))
    def test_english_overrides_target_owned_nonempty_fields(self):
        self.assertLessEqual(set(self.en),set(self.expected))
        for text in list(self.expected.values())+list(self.en.values()):self.assertTrue(text.strip())
    def test_french_nonempty_no_placeholders_or_english_fallback(self):
        for key,text in self.fr.items():
            self.assertTrue(text.strip(),key)
            self.assertNotRegex(text,r'\b(?:TODO|TBD|TRANSLATE)\b|\uFFFD',key)
            self.assertNotEqual(text,self.expected[key],key)
    def test_named_arguments_preserved_with_valid_pawn_accessors(self):
        # All English descriptions use one NamedArgument, PAWN. French may choose a
        # different accessor for this same pawn to avoid English possessive grammar.
        for key,text in self.fr.items():
            src=re.findall(r'\{([^{}]+)\}',self.expected[key]);dst=re.findall(r'\{([^{}]+)\}',text)
            self.assertSetEqual({t.split('_')[0] for t in src},{t.split('_')[0] for t in dst},key)
            for token in dst:self.assertIn(token,{'PAWN_nameDef','PAWN_pronoun','PAWN_objective','PAWN_possessive'},key)
            self.assertEqual(text.count('{'),len(dst),key);self.assertEqual(text.count('}'),len(dst),key)
    def test_rarity_markup_matches_english(self):
        for key,text in self.fr.items():
            expected=self.en.get(key,self.expected[key])
            self.assertEqual(re.findall(r'<[^>]+>',text),re.findall(r'<[^>]+>',expected),key)
    def test_skill_gain_custom_loader_shape(self):
        for d in self.defs:
            for gains in d.findall('.//skillGains'):
                for gain in gains:
                    self.assertNotEqual(gain.tag,'li')
                    self.assertEqual(len(gain),0)
                    int(gain.text)
    def test_no_accidental_settings_page_or_shortcut(self):
        self.assertFalse(list(MOD.rglob('MainButtonDefs')))
        for d in self.defs:self.assertNotEqual(d.tag,'MainButtonDef')
        for f in (ROOT/'Source').glob('*.cs'):
            code=f.read_text(encoding='utf-8-sig')
            self.assertNotRegex(code,r'class\s+\w+\s*:\s*(?:Verse\.)?Mod(?:Settings)?\b')
            self.assertNotRegex(code,r'override\s+.*\b(?:SettingsCategory|DoSettingsWindowContents)\s*\(')
if __name__=='__main__':unittest.main(verbosity=2)
