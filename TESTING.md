# Testing

Text-only mod: no assembly, no Defs, no patches, no settings.

## Out of game (rerun each audit)
`scripts/Check-DefInjected.ps1 -TransMod Mod -Targets <Lin 1.6 folder> -ExtraAssemblies <its DLL>`:
every key resolves to a real field of the target's Defs. 166 keys, 0 errors on 2026-09-29.

## In game (not run). Suite written: Tests/Pickle. Wording and rendering below stay a human read
1. Load Core + Lin's mod + this mod, French selected. Generate pawns with several traits, male and female.
2. Open the bio tab and trait tooltips: label, full description, the pawn's name in place, rarity colour.
3. Check the thoughts: the 12 social opinions and the memory, weapon and prosthesis moods.
4. Read `Player.log`: no key error from this mod. Repeat in English: the target's own text, unchanged.

Passes: one per language (`-Language French`, `-Language English`), map = Lin's mod. No optional mod, no declared incompatibility.

## Conditions for `tested`
No scenario left `@wip`; every conditional scenario has run; no manual test left to validate; `@review` captures opened.

## Evidence to keep
Per scenario, only the latest report for the revision now in the repository: `summary.md`, `junit.xml`,
`log-check.txt`, a few 1280 px JPEG captures. Reports stay on disk in `Tests/Pickle/Evidence/` (gitignored);
one line per run goes in `docs/runs/history.md`.
