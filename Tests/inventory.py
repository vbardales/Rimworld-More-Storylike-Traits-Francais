import json,re,xml.etree.ElementTree as ET
from pathlib import Path
root=Path(__file__).resolve().parents[1]
entries=[]
for file in sorted((root/'Mod/Defs').rglob('*.xml')):
    for d in ET.parse(file).getroot():
        if not isinstance(d.tag,str): continue
        name=d.findtext('defName')
        if not name: continue
        for group in ('degreeDatas','stages'):
            container=d.find(group)
            if container is None: continue
            used={}
            for i,item in enumerate(container):
                label=item.findtext('label','')
                handle=re.sub(r'[^A-Za-z0-9_]','',label.replace(' ','_')) or str(i)
                n=used.get(handle,0);used[handle]=n+1
                if n: handle+='-'+str(n)
                for field in ('label','description','labelFemale','labelMale'):
                    node=item.find(field)
                    if node is not None:
                        entries.append(dict(key=f'{name}.{group}.{handle}.{field}',type=d.tag,file=file.name,text=node.text or ''))
(root/'.build').mkdir(exist_ok=True)
(root/'.build/text-inventory.json').write_text(json.dumps(entries,ensure_ascii=False,indent=2),encoding='utf8')
for i,e in enumerate(entries): print(f'{i}\t{e["text"]}')
