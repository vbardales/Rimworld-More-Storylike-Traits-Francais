# More Storylike Traits 1.6 — attribution

## The original

**更多背景特质 HYP's More Storylike Traits** — [2012787971](https://steamcommunity.com/sharedfiles/filedetails/?id=2012787971)

- **Authors:** 七彩型七色 (Hyperion-c) and DarthCY. DarthCY contributed the 1.3 update, which
  decompiled and repaired the assembly after the social effects stopped working.
- **Posted** 3 March 2020, **last updated** 26 September 2021.
- **Supported versions:** 1.1, 1.2, 1.3. Dead since.
- **Content:** 53 TraitDefs and 31 ThoughtDefs, in six colour-coded rarity tiers of the authors'
  own design, plus a 90-line assembly. No patches, no overrides of any game def.

The `About.xml` description credits two other authors, and both belong in the record even though
neither is a dependency here:

- **魔王萨摩耶**, for *RareTraits* ([2008359600](https://steamcommunity.com/sharedfiles/filedetails/?id=2008359600))
  — the authors say the colour-coding and tier scheme were his idea, "and the code as well".
- the author of **MorePracticalTraits** ([1568700181](https://steamcommunity.com/sharedfiles/filedetails/?id=1568700181)),
  named as the inspiration for the whole mod. The original authors linked it themselves, saying
  they hesitated to in case it looked like riding on his popularity, and did it anyway out of
  gratitude.

## Licence: none declared

Checked on 2026-09-05, in the four places that matter:

1. **A licence file in the mod** — the subscribed copy at
   `steamapps/workshop/content/294100/2012787971` was read in full. 90 files, no LICENSE, no
   COPYING, no readme of any kind. The only loose file is `更新日志.txt`, a changelog.
2. **`About.xml`** — the description was read in full, in the original Chinese. It is a design
   essay, a tier table, a compatibility note and a to-do list. There is no licence in it.
3. **A linked repository** — the description links two Workshop items and nothing else. No
   GitHub, no Gitee.
4. **The Steam page** — the item's own description is the same text as `About.xml`.

The description holds **no licence and no refusal**. It was searched for refusals as much as for
permissions — 禁止, 转载, 请勿, 不得, 未经允许 — because a refusal never presents itself as a
licence, and looking only for permission can only ever find permission. Nothing.

Dead since 2021 and silent on redistribution: this continuation follows the usual RimWorld
Workshop practice for that case — original authorship preserved in `<author>`, and a takedown on
request.

## What was changed, and what was not

**Not changed.** Every `defName`, every commonality, every stat offset, every skill gain, every
`conflictingTraits` and `disallowedInspirations` list, and the tier colours. The C# namespace is
still `MoreStorylikeTraits`, because 31 ThoughtDefs name `MoreStorylikeTraits.MSTModExtension` in
XML and a rename would silently unset the field. A save from the 1.3 mod keeps its traits.

**Changed.**

- **The English was rewritten.** The original ships English in the defs themselves, and it is
  machine translation over Chinese-forum in-jokes: "Take Screen Brother", "Teacher Rao's secret
  Dict", a description that stops to explain its own pun in a parenthesis. Rewriting it was the
  bulk of this port. Where a reference could not survive the crossing it was replaced by one that
  does the same work — the point of a trait like this is that it describes a specific person, and
  a literal pass turns fifty-three specific people into fifty-three interchangeable ones.
- **`skillGains` was rewritten into the form the loader actually accepts.** The 1.3 mod writes
  `<li><key>Shooting</key><value>2</value></li>`, which has never been valid: `RimWorld.SkillGain`
  has a custom loader that reads the element *name* as the skill and its *text* as the amount, so
  vanilla's `<Shooting>2</Shooting>` is the only form there is. The exception aborts the entire
  `TraitDef`, so 42 of the 53 traits would have failed to load. 68 entries, values unchanged.
- **Six English descriptions contradicted their own mechanics** and now match them. The
  `disallowedInspirations` lists say what a pawn can *never* be inspired to do, so the reading is
  what is missing from the list; the 1.3 English read several of them the other way round. The
  Chinese was right in every case. *Just one more turn* is the clearest: its English promised
  "more creative inspiration", when the list means creative inspiration is the only kind it can
  ever have.
- **The assembly was recompiled** against 1.6 and its file renamed from
  `HYP's MoreStorylikeTraits.dll` to `MoreStorylikeTraits.dll`. An apostrophe in a DLL filename is
  a needless hazard, and the filename plays no part in type resolution.
- **Two bugs in `ThoughtWorker_MSTSpecial`** are fixed. `requireCapacityOfOther` tested the
  capacity of the thinking pawn rather than the pawn being thought about — a copy-paste from the
  line above it, which made the two fields synonyms. And a def with no `triggerTraits` threw a
  `NullReferenceException`. Neither ever fired: no def in the mod sets a capacity, and every def
  sets a trait list. They are fixed because the fields should mean what they say.
- **One Biotech-era correction.** The worker read `allTraits` without checking `Suppressed`, which
  did not exist when it was written. A pawn whose trait is currently switched off by a gene no
  longer reads as a combat expert.
- **`HYPURThought12LovelyWayOfSpeaking` had no Chinese**, in either script — a gap in the
  original. Its Chinese name survived in a comment beside the def, and that is what is now
  injected: 奇怪但又可爱的说话方式.
- **The DefInjected keys were rebuilt.** The 1.3 files address list elements by index
  (`stages.0.label`) almost everywhere, and by handle in one file. RimWorld builds these keys from
  the normalised English label. All 382 keys are now handles, checked by
  `scripts/Check-DefInjected.ps1`.
- **The language folders were renamed** to `ChineseSimplified (简体中文)` and
  `ChineseTraditional (繁體中文)`, the form Core itself uses. The bare names the original used are
  a legacy alias and still resolve.
- **The three version folders were collapsed into one.** The original carries 1.1, 1.2 and 1.3
  side by side without a `LoadFolders.xml`; only 1.3 was carried forward, to the root.
- **One duplicate was removed**: `HYPSSR07FieldSniper` listed `HYPUR03TheDealWithLucifer` twice in
  `conflictingTraits`.

**Deliberately not changed: the commonalities.** Fifty-three traits summing to 15.0 sit beside a
vanilla pool summing to 48.2, so about 24% of every trait rolled comes from this mod. That is a
consequence of the count, not of any trait being over-weighted — no trait here is as common as an
ordinary vanilla one. Rebalancing it would make this a different mod, and that different mod
already exists; see below.

## Relationship to More Storylike Traits - Body and Mind

The same source, treated the other way. That mod keeps 19 of the 53, rewrites them to vanilla stat
ceilings, drops the tier system and adds twelve Biotech genes. This one keeps all 53, the tiers,
and the authors' numbers. They use different `defName` prefixes, so the game will load both, and a
colony that does will meet two versions of the same person. Run one or the other.

## Adoption

> If I do not answer within a reasonable time after being contacted, anyone may freely update this
> or any other of my mods, including publishing a continuation of it. All credit must be
> preserved.
