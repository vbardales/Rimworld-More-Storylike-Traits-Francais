---
localization: complete
translation_en: not_applicable
translation_fr: complete
mod:          More Storylike Traits - Français (unofficial)
packageId:    nelim.morestoryliketraits.fr
repo:         Rimworld-More-Storylike-Traits-Renew
visibility:   public
detached:     yes
stage:        port
workflow_stage: dansMonoRepo
licence:      silent
licence_at:   2026-09-29; see ATTRIBUTION.md
upstream_mod_remotes: N/A
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - defect: no Pickle suite written and no written justification of scope (preTest -> done)
  - defect: GitHub repository is still named Rimworld-More-Storylike-Traits-Renew; the convention (Rimworld-Flavor-Text-Extended-Francais) gives Rimworld-More-Storylike-Traits-Francais (dansMonoRepo -> horsMonoRepo, name coherence)
  - unverified: in-game rendering, male and female pawns, colour tags, English fallback
  - unverified: Lin's reaction to the comment proposing this French text
settings_audit: not_applicable
updated:      2026-09-29, re-audit from step 1; repository pushed
---

# More Storylike Traits - Français (unofficial) — status

On 2026-09-29 the full port (*More Storylike Traits Renew*, then at `preTest`) was abandoned because
Lin's Continued mod (2941176778) already covers it, and this repository became its French
translation. The port is on the `for-lin` branch; its history and old status are in git.

- **Content:** 166 DefInjected keys, 53 traits and 31 thoughts, keyed on Lin's labels. `Check-DefInjected` against Lin's `1.6` folder and DLL: 0 errors.
- **Settings:** none, text only. **English:** not applicable, it comes from the target's Defs.
- **Dependencies:** `SevenColorType.Hyperionc` in `modDependencies` and `loadAfter`; a translation does nothing without it.
- **Images:** 128 x 128 icon kept; Preview 896 x 504, 453 KB, overlay bottom left, retitled *Français* (contrast min 4.92).
- **Not published:** no `PublishedFileId.txt`. `main` and `for-lin` pushed 2026-09-29.
- **Next transition:** write the Pickle suite (game-only checks: real pawn traits, French rendering, gender) or justify its scope in writing, then reaudit.

## Audit 2026-09-29 (from step 1 upward)

Retained state: `dansMonoRepo` (code `port`). Only the repository name fails; every later transition was checked and holds up to `preTest`.

| Transition | Result |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Standalone git, GitHub remote, pushed, STATUS, README, ATTRIBUTION, CHANGELOG present; licence `silent` matches the ` (unofficial)` suffix. **Fails:** repo name does not match the mod (defect in `remaining`). `upstream_mod_remotes: N/A`: Lin's mod ships no repository link. |
| -> ModIcon | 128 x 128 PNG, 12.7 KB, mascot readable at 32 px (looked at). Owner-made, untouched. |
| -> Preview | 896 x 504, 443 KB (< 1 MB), inspected: title, badge, overlay bottom left. |
| -> preOptions | English description, `(unofficial)` suffix, contrast min 4.92. |
| -> options | No assembly, no settings, no MainButtons def: `not_applicable`. |
| -> l10n | `Check-DefInjected` rerun: 166 keys, 0 errors. No Keyed strings, so no plural keys. English is the target's own Defs. |
| -> preTest | `modDependencies` and `loadAfter` = `SevenColorType.Hyperionc`, matches Lin's About.xml. No LoadFolders needed. |
| preTest -> done | Fails: no Pickle suite and no written scope justification. |

Not verified (needs the game): French rendering, gender pronouns, colour tags, English fallback.
