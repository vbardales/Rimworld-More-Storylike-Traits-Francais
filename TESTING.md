# Testing

Text-only mod: no assembly, no Defs, no patches, no settings.

## Out of game (rerun each audit)
`scripts/Check-DefInjected.ps1 -TransMod Mod -Targets <Lin 1.6 folder> -ExtraAssemblies <its DLL>`:
every key resolves to a real field of the target's Defs. 166 keys, 0 errors on 2026-10-02 (Lin's folder:
`C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2941176778\1.6`).

## In game (not run). Suite written: Tests/Pickle. Wording and rendering below are still a manual read
1. Load Core + Lin's mod + this mod, French selected. Generate pawns with several traits, male and female.
2. Open the bio tab and trait tooltips: label, full description, the pawn's name in place, rarity colour.
3. Check the thoughts: the 12 social opinions and the memory, weapon and prosthesis moods.
4. Read `Player.log`: no key error from this mod. Repeat in English: the target's own text, unchanged.

Item 4 is covered by the Pickle log checks. Items 1-3 are manual and block `tested` until each is either
automated (a `@review` capture scenario using `InspectTabs` and `ColonistRace` from PickleTools, whose captures
a person then opens) or declared not applicable with its reason. The wording itself is Virginie's French review
(`FRENCH_REVIEW.md`), not a game test.

Passes: one per language (`-Language French`, `-Language English`), map = Lin's mod. No optional mod, no declared
incompatibility, so no further pass. Order of passes (AUDIT.md, 2026-10-02): anything never played or red first,
as small tickets; the full non-regression passes of both languages last, together, on the final revision. Both
passes are non-regression only once green on the current logic: the French text changed in 195b1a3, so both are
due again.

## Conditions for `tested` (AUDIT.md, 2026-10-02)
- No scenario left `@wip` (none today).
- Every conditional scenario has run: each `@requires:<packageId>` had its pass, with the report read. None exists here.
- No manual test left to validate: each is automated and green, or listed not applicable with its reason (see above).
- `@review` captures opened and looked at (none written yet).
- Both Pickle passes green on the final French text, `exitReason` read before the figures.

## Not applicable, with the reason
- Behaviour of the target's traits and thoughts (skills, moods, opinions): the mod changes text only; "we do not test
  what the mod does not modify".
- Language switch, dependency warning, load order calculation: the engine's job, not the mod's.

## Evidence to keep
Reports stay on disk in `Tests/Pickle/Evidence/` (gitignored, never in git). Per scenario, only the latest report for
the revision now in the repository, minified: `summary.md`, `summary.json`, `junit.xml`, `evidence-complete.txt`,
`log-check.txt` (the WARN/ERROR lines naming this mod, cut from `Player.log`), and the `@review` captures as 1280 px
JPEG once they exist. Delete `Player.log`, `report.html`, `messages.ndjson` and anything older once the newer
report is in place; never delete a report a `STATUS.md` field still cites. One line per run goes in
`docs/runs/history.md`. Launcher archives (`pickle-reports-archive/`): keep only this mod's own run, then delete it.
