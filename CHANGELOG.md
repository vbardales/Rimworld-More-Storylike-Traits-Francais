# Changelog

All notable changes to this mod are recorded here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project uses
[semantic versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **53 traits and 31 thoughts** carried forward from HYP's More Storylike Traits, which supported
  RimWorld 1.1 to 1.3. Every `defName`, commonality, stat offset, skill gain, conflict list and
  tier colour is the original authors' and is unchanged, so a save made with the 1.3 mod keeps its
  traits.
- **Chinese, Simplified and Traditional**, the original authors' own text, shipped intact.
- **A Chinese label the original never had**: `HYPURThought12LovelyWayOfSpeaking` was missing from
  both Chinese files. Its name survived in a comment beside the def and is now injected.

### Changed

- **The English text was rewritten.** The original ships English in the defs, machine-translated
  over Chinese-forum in-jokes; where a reference could not cross into English it was replaced by
  one that does the same work. This was the bulk of the port.
- **The assembly was recompiled** against 1.6 and its file renamed from
  `HYP's MoreStorylikeTraits.dll` to `MoreStorylikeTraits.dll`. The C# namespace is unchanged —
  31 ThoughtDefs name it in XML.
- **DefInjected keys rebuilt as handles.** The 1.3 files address list elements by index almost
  everywhere; RimWorld builds these keys from the normalised English label. 382 keys, validated.
- **Language folders renamed** to `ChineseSimplified (简体中文)` and `ChineseTraditional (繁體中文)`,
  the form Core itself uses.
- **Collapsed to a single version.** The original ships 1.1, 1.2 and 1.3 folders with no
  `LoadFolders.xml`; only 1.3 was carried forward, to the root.

### Fixed

Everything here was already broken in the 1.3 mod; none of it was caused by the port.

- **`skillGains` was written in dictionary form and would have aborted 42 of the 53 traits.**
  `RimWorld.SkillGain` has a custom loader: it reads the *element name* as the skill and the
  element's *text* as the amount, so the only valid form is vanilla's `<Shooting>2</Shooting>`.
  The `<li><key>Shooting</key><value>2</value></li>` form the 1.3 mod used has never been valid
  in any version. It does not fail quietly either — the exception aborts the **whole TraitDef**,
  not just the `skillGains` block, so 42 traits would have vanished and the load would have taken
  the game down with it. In the Player.log it reads as a pair: `No RimWorld.SkillDef named li`
  followed by `ArgumentNullException: Parameter name: s`. All 68 entries rewritten, values
  unchanged and checked one by one against the source.
- **Six descriptions contradicted their own mechanics.** A `disallowedInspirations` list says what
  a pawn can never be inspired to do, so the meaning is what is *missing* from it. The 1.3 English
  read several backwards — *just one more turn* promised "more creative inspiration" when the list
  means creative inspiration is the only kind it can ever have. The Chinese was right throughout;
  the English now matches both.
- **`requireCapacityOfOther` tested the wrong pawn.** It read the capacity of the pawn doing the
  thinking rather than the pawn being thought about, a copy-paste from the line above that made
  the two fields synonyms. Dormant — no def sets either.
- **A def with no `triggerTraits` threw a `NullReferenceException`.** Dormant — every def sets one.
- **Gene-suppressed traits still counted.** `Trait.Suppressed` is Biotech-era and did not exist
  when the worker was written; a pawn whose trait is currently switched off by a gene no longer
  reads as a combat expert.
- **A duplicate conflict entry** removed: `HYPSSR07FieldSniper` listed `HYPUR03TheDealWithLucifer`
  twice.

### Notes

- **The commonalities are deliberately untouched.** 53 traits summing to 15.0 against a vanilla
  pool of 48.2 means about 24% of every trait rolled comes from this mod. That is what adding 53
  traits costs; no single trait here is as common as an ordinary vanilla one. See `README.md`.
- **All 53 TraitDefs passed the 1.6 field audit unchanged.** Nothing in `TraitDef`,
  `TraitDegreeData` or `ThoughtDef` that this mod uses moved between 1.3 and 1.6, and every
  vanilla `workerClass` it names still exists.
