# More Storylike Traits Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

Fifty-three traits that are people rather than statistics, and thirty-one thoughts that go with
them. Brought forward from
[HYP's More Storylike Traits](https://steamcommunity.com/sharedfiles/filedetails/?id=2012787971),
which stopped at RimWorld 1.3.

Every `defName`, commonality and stat is the original authors' and is unchanged. What this port
did was recompile a 90-line assembly, fix two dormant bugs in it, rebuild the translation keys —
and rewrite the English, which was the actual work. See [ATTRIBUTION.md](ATTRIBUTION.md) for the
full list of what moved and what did not, and for the licence position.

## Layout

```
MoreStorylikeTraitsRenew/
  Mod/                                        <- published folder; the RimWorld junction points here
    About/About.xml
    Assemblies/MoreStorylikeTraits.dll        <- built from Source/, 5 KB
    Defs/
      TraitDefs/                              <- 53 traits: R+SR / SSR+UR / W+N, one file each
      ThoughtDefs/                            <- 31 thoughts
    Languages/
      English/DefInjected/TraitDef/           <- tier colours only; the words live in the defs
      ChineseSimplified (简体中文)/
      ChineseTraditional (繁體中文)/            <- the original authors' own text, intact
  Source/                                     <- never published
  Art/                                        <- never published; full-resolution image sources
  ATTRIBUTION.md  CHANGELOG.md  README.md
```

## Building

```bash
dotnet build -c Release Source/MoreStorylikeTraits.csproj
```

References come from NuGet (`Krafs.Rimworld.Ref`), so no RimWorld install is needed to compile.
The output lands in `Mod/Assemblies/`; intermediates go to `.build/` at the repository root, kept
out of the published folder by `Source/Directory.Build.props` — the Workshop uploader sends the
mod folder as-is, with no way to exclude anything.

## Notes for anyone editing this

- **The namespace is load-bearing.** Thirty-one ThoughtDefs contain
  `<li Class="MoreStorylikeTraits.MSTModExtension">`. Renaming the namespace, or the fields on
  that class, breaks them **silently**: RimWorld logs one line about an unknown element and
  carries on with the field unset. The assembly *file* was renamed and that is safe — filenames
  play no part in type resolution.

- **The tier colour is not in the labels, and that is deliberate.** RimWorld builds a DefInjected
  key from the normalised English label, keeping only `[A-Za-z0-9_]`. Move `<color=#33ff00>` into
  a `<label>` and the key for *screen photographer* becomes
  `color33ff00screen_photographercolor`, which every future translator then has to type. The
  colour is applied per language instead, as the original did it. The price is that a language
  this mod does not ship falls back to a plain, uncoloured English label.

- **DefInjected keys are handles, not indices.** `stages.0.label` is only correct when the element
  has no label at all — the fallback that a fully CJK label also lands in. Everything here has an
  English label, so everything is addressed by handle: `stages.knows_how_to_fight.label`. A wrong
  key raises no error, it is simply ignored. Regenerate with the script in
  `scripts/Check-DefInjected.ps1`'s sibling logic, or validate with the script itself.

- **`skillGains` takes the skill as the element name, and neither validator can check it.**
  `<Shooting>2</Shooting>`, never `<li><key>Shooting</key><value>2</value></li>`.
  `RimWorld.SkillGain` has a `LoadDataFromXmlCustom`, so it has no `key` or `value` field for
  `Check-XmlFields.ps1` to reflect over, and `Check-DefRefs.ps1` does not follow references a
  custom loader produces. Both scripts pass a file full of the broken form. What makes it worth a
  note rather than a shrug is the blast radius: the exception aborts the **whole `TraitDef`**, not
  the `skillGains` block, so 42 traits disappear and the load dies. The Player.log says
  `No RimWorld.SkillDef named li` and then `ArgumentNullException: Parameter name: s`. Read those
  two lines as one symptom.

- **Read a `disallowedInspirations` list by what is missing from it.** The entries are what the
  pawn can never be inspired to do; the one or two vanilla inspirations *absent* from the list are
  the only ones it can ever get. Six of the 1.3 English descriptions read this backwards. Vanilla's
  full set is `Inspired_Creativity`, `Inspired_Trade`, `Inspired_Recruitment`, `Inspired_Taming`,
  `Inspired_Surgery`, `Frenzy_Work`, `Frenzy_Go`, `Frenzy_Shoot`.

- **There is no vanilla hook for carrying a melee weapon.** `ThoughtWorker_IsCarryingRangedWeapon`
  has no counterpart, so the tai chi inheritor and the viking can only be made *unhappy* about a
  rifle, never happy about a blade. The original authors left a note about this in the 1.3 file,
  in Chinese, and it is still true in 1.6.

- **Validate before shipping**: `scripts/Check-XmlFields.ps1` for element names against 1.6's real
  fields, `scripts/Check-DefRefs.ps1` for def references, `scripts/Check-DefInjected.ps1` for
  translation keys. `Check-XmlFields.ps1` will report 36 lines against
  `sameFactionOnly` / `triggerTraits` / `validWithDisfigured` — those are fields on this mod's own
  `MSTModExtension`, which the script cannot resolve because it only loads `Assembly-CSharp.dll`.
  Everything else must be clean.

## What this does to the trait pool

Fifty-three traits with a total commonality of **15.0**, against a vanilla pool that sums to
**48.2** across 51 drawable TraitDefs. So roughly **24% of every trait rolled comes from this
mod**, and most generated pawns will carry at least one.

That is a consequence of the count, not of any trait being greedy — the most common trait here is
0.63 against vanilla's usual 1.0, and the rarest is 0.02:

| Tier | Colour | Traits | Commonality each |
| --- | --- | --- | --- |
| R | green `#33ff00` | 15 | 0.63 |
| SR | blue `#66ccff` | 13 | 0.21 |
| SSR | purple `#cc33cc` | 15 | 0.05 – 0.10 |
| UR | red `#FF3030` | 5 | 0.02 – 0.10 |
| W | grey `#969696` | 2 | 0.21 |
| N | uncoloured | 3 | 0.21 – 0.31 |

The numbers are left alone on purpose: this is a faithful port, and halving them would produce a
different mod. That different mod exists —
[More Storylike Traits - Body and Mind](../StorylikeBodyAndMind) takes 19 of these traits and holds
every one to a vanilla ceiling. **Run one or the other, not both**: the `defName` prefixes differ,
so RimWorld will happily load both and hand a colony two versions of the same person.
