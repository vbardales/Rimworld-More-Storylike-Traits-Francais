---
localization: partial
translation_en: not_applicable
translation_fr: partial
mod:          More Storylike Traits - Français (unofficial)
packageId:    nelim.morestoryliketraits.fr
repo:         Rimworld-More-Storylike-Traits-Francais
visibility:   public
detached:     yes
stage:        showcase
workflow_stage: options
licence:      silent
licence_at:   2026-09-29; see ATTRIBUTION.md
upstream_mod_remotes: N/A
dependencies: declared
showcase:     complete
tested_on:
workshop:     3811294875 (private; 0.1.0 prepublication, 2026-10-01; no public version)
remaining:
  - defect: 10 trait and thought labels are masculine-only nouns (porteur, héritier, bâtisseur, viking...) and carry no PAWN_gender switch; flagged in FRENCH_REVIEW.md. Unverified lead: a label may take a switch, or TraitDegreeData may offer a female label field (not found in Core or Lin's Defs; not checked in the game code)
  - unverified: French review by Virginie (FRENCH_REVIEW.md, revision 195b1a3; 6 texts reworded, 10 labels flagged)
  - unverified: in-game rendering, male and female pawns, colour tags, English fallback (the wording read in TESTING.md "In game" is a manual test; for `tested` it must be automated or declared not applicable)
  - unverified: Pickle passes replayed on the final French text (the 2026-09-29 runs predate commit 195b1a3)
  - unverified: the active language of the French pass (Player.log does not show it; launcher asked -Language French)
  - unverified: Lin's reply to the comment (posted by the owner 2026-09-29)
settings_audit: not_applicable
updated:      2026-10-02, audit against AUDIT.md of 2026-10-02; 0.1.0 prepublication recorded
---

# More Storylike Traits - Français (unofficial) — status

On 2026-09-29 the full port (*More Storylike Traits Renew*, then at `preTest`) was abandoned because
Lin's Continued mod (2941176778) already covers it, and this repository became its French
translation. The port is on the `for-lin` branch; its history and old status are in git.

- **Content:** 166 DefInjected keys, 53 traits and 31 thoughts, keyed on Lin's labels. `Check-DefInjected` against Lin's `1.6` folder and DLL: 0 errors (rerun 2026-10-02).
- **Settings:** none, text only. **English:** not applicable, it comes from the target's Defs.
- **Dependencies:** `SevenColorType.Hyperionc` in `modDependencies` and `loadAfter`; a translation does nothing without it.
- **Images:** 128 x 128 icon kept; Preview 896 x 504, 471 KB, rendered by the shared `scripts/Render-Preview.cjs` (text top left, icon badge bottom left), retitled *Français* (contrast min 4.92).
- **Workshop:** item 3811294875 exists, private, created by the 0.1.0 prepublication on 2026-10-01 (`About/PublishedFileId.txt`, committed 776670e). `Mod/` of that upload = commit `195b1a3`. Not a tested version; the owner switches it to public herself.
- **Not tested.** Next transitions: options -> l10n (fix the masculine-only labels, then Virginie's French review), then done -> tested.

## Audit 2026-10-02 (AUDIT.md of 2026-10-02, from step 1 upward)

Revision audited: `195b1a3` plus the `PublishedFileId.txt` commit; working tree otherwise clean. Retained state: **`options`** (`stage: showcase`). The earlier front matter said `stage: preTest`, `workflow_stage: l10n` while the text below claimed `done`: replaced (see "Replaced decisions").

| Transition | Result |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Standalone git, remote `origin` (GitHub), STATUS/README/ATTRIBUTION/CHANGELOG present; licence `silent` matches the ` (unofficial)` suffix. `upstream_mod_remotes: N/A` rechecked 2026-10-02: Lin's `About.xml` and description link only to Steam pages; `gh search repos "Storylike Traits"` and `gh search code SevenColorType.Hyperionc` find nothing of Lin or Hyperion-c (only this repository and the owner's other mod). Steam page not readable (HTTP 429). No origin repository: no PR to prepare, so no BACKLOG.md. At audit start `main` was 5 commits ahead of `origin`; pushed the same day. |
| -> ModIcon | 128 x 128 PNG, 13 026 bytes, owner-made, untouched. Not regenerated. |
| -> Preview | 896 x 504, 470 695 bytes (< 1 MB), unchanged since the 2026-09-29 inspection. |
| -> preOptions | English description, `(unofficial)` suffix, contrast min 4.92 (recorded 2026-09-29). |
| -> options | No assembly, no settings, no MainButtons def: `not_applicable`. No French text depends on a player choice, since the French uses no pawn switch at all (see l10n). Holds. |
| -> l10n | **Fails.** (1) Rule of 2026-09-30: a French text that agrees in the masculine only with no switch is a defect; ten labels are masculine-only nouns (listed in `remaining`). (2) `translation_fr` cannot be `complete` before Virginie's review; `FRENCH_REVIEW.md` regenerated 2026-10-02 (header now `# French review - <name>`, revision 195b1a3). Checks that pass: `Check-DefInjected` 166 keys, 0 errors; no Keyed folder, so no plural keys; no `pion`/`colon` in the French; no switch anywhere, so no two-segment switch. |
| -> preTest | `modDependencies` and `loadAfter` = `SevenColorType.Hyperionc`, matches Lin's `About.xml` read 2026-10-02. No LoadFolders needed. Holds (cited, not the retained state). |
| preTest -> done | Pickle suite written and justified (`Tests/Pickle/README.md`). No unit tests: text-only mod. Holds. Not the retained state, since an earlier transition fails. |
| done -> tested | Not reached. See "Conditions for tested" in TESTING.md. |
| tested -> prepublished | The 0.1.0 prepublication happened without moving the state (AUDIT.md: it is an act, `prepublished` is a state). |

New conditions for `tested` (AUDIT.md 2026-10-02), status today: no scenario `@wip` (none exists); conditional scenarios (`@requires`) none exist, no optional mod and no incompatibility declared; manual tests: the "In game" list of TESTING.md is still manual, so **not met**; `@review` captures: none written yet.

Test evidence minified 2026-10-02: `Tests/Pickle/Evidence/{english,french}` went from 1.7 MB each to 3 KB (kept: `summary.md`, `summary.json`, `junit.xml`, `evidence-complete.txt`, `log-check.txt`). No `.dds` and no evidence was ever committed (checked on all branches and in history); `*.dds`, `*.ico` and `Tests/Pickle/Evidence/` are in `.gitignore`. `Mod/desktop.ini` exists on disk (the Explorer folder-icon convention of AUDIT.md), is ignored by git and is absent from CI checkouts.

## Replaced decisions

Replaced on 2026-10-02, kept for history:

- "State moved from `preTest` to `done`" (2026-09-29, `preTest -> done` fixed by the Pickle suite): the transition itself holds, but the retained state is lower because `options -> l10n` fails under the rules of 2026-09-30.
- "`translation_fr` stays `partial`" (2026-09-30) said `partial` while the field read `unchecked`; it is `partial` now, set deliberately.

## Earlier audit 2026-09-29 (from step 1 upward)

Retained state was `dansMonoRepo` until the repo was renamed to `Rimworld-More-Storylike-Traits-Francais` (2026-09-29). Pickle played 2026-09-29 on 3bc5f65: English 3/3, French 4/4, `exitReason: passed`, nothing from this mod in the logs (only the companion's own warning). Detail in `docs/runs/history.md`. The tree has changed since: the French files were reworded in 195b1a3, so those runs no longer cover the shipped text.

## Translation audit 2026-09-30 (updated 2026-10-02)

Rule read: TRANSLATIONS.md section 3, French gender agreement and systematic French review. The French lives in `Mod/Languages/French (Français)/DefInjected/{TraitDef,ThoughtDef}/*.xml` (7 files, 166 keys; no Keyed, no grammar file). Every text was read in `FRENCH_REVIEW.md`, generated by `_tools/Generate-FrenchReview.ps1` from the shipped XML and the target's Defs (Original = English = Lin's text). The shared `scripts/Make-FrenchReview.ps1` is not used: it reads `Languages/French` (this folder is `French (Français)`) and the English side from `Mod/Defs` (this mod has none, the Defs are Lin's).

- The French uses no `{PAWN_gender ...}` switch and no `{PAWN_pronoun}`: only `{PAWN_nameDef}`, repeated. That keeps most texts free of agreement.
- Five masculine-only agreements found by reading and reworded to remove them: Era_has_changed (Élevé), Unspeakable_horror (un fidèle), A_virtuous_and_artistic_artist (aimé), The_ultimate_bricklayer (l'ultime porteur), thought label "déjà croisé quelque part" (now "ce visage me dit quelque chose").
- Not fixed: ten labels that are masculine-only nouns. A label has no pawn switch here; flagged `?` for the review.
- Review by Virginie: not done. A session never marks its own French as reviewed.
