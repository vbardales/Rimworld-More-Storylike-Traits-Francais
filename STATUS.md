---
localization: complete
translation_en: not_applicable
translation_fr: complete
mod:          More Storylike Traits - Français (unofficial)
packageId:    nelim.morestoryliketraits.fr
repo:         Rimworld-More-Storylike-Traits-Renew
visibility:   public
detached:     yes
stage:        preTest
workflow_stage: preTest
licence:      silent
licence_at:   2026-09-29; see ATTRIBUTION.md
upstream_mod_remotes: N/A
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - defect: no Pickle suite written and no written justification of scope (preTest -> done)
  - defect: GitHub repository is still named Rimworld-More-Storylike-Traits-Renew, while the mod is now a translation
  - unverified: in-game rendering, male and female pawns, colour tags, English fallback
  - unverified: Lin's reaction to the comment proposing this French text
settings_audit: not_applicable
updated:      2026-09-29, repo turned into the French translation
---

# More Storylike Traits - Français (unofficial) — status

On 2026-09-29 the full port (*More Storylike Traits Renew*, then at `preTest`) was abandoned because
Lin's Continued mod (2941176778) already covers it, and this repository became its French
translation. The port is on the `for-lin` branch; its history and old status are in git.

- **Content:** 166 DefInjected keys, 53 traits and 31 thoughts, keyed on Lin's labels. `Check-DefInjected` against Lin's `1.6` folder and DLL: 0 errors.
- **Settings:** none, text only. **English:** not applicable, it comes from the target's Defs.
- **Dependencies:** `SevenColorType.Hyperionc` in `modDependencies` and `loadAfter`; a translation does nothing without it.
- **Images:** 128 x 128 icon kept; Preview 896 x 504, 453 KB, overlay bottom left, retitled *Français* (contrast min 4.92).
- **Not published:** no `PublishedFileId.txt`, nothing pushed since the change.
- **Next transition:** write the Pickle suite (game-only checks: real pawn traits, French rendering, gender) or justify its scope in writing, then reaudit.
