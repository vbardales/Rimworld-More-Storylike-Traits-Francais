# Testing

## Passes needed
1. Without optional mods (default staging). This mod has no hard dependency and no `loadAfter` other than Core.
2. With optional mods: none declared, so this pass is the same as the first. Justified, not skipped.
3. One pass per declared incompatibility: the README/About warn against running beside *More Storylike Traits - Body and Mind*. No `incompatibleWith` is declared; if one is added, a pass mounting that mod is required.
4. One pass per language (`-Language English`, `-Language French`).

## Out of game (rerun each audit)
`dotnet run --project Tests/WorkerTests.csproj -c Release`, `python Tests/test_xml.py`, and the shared checkers listed in `Tests/README.md`.

## In game
Manual scenarios are in `TEST_SCENARIOS.md`. Status: NOT RUN. A Pickle suite does not exist yet.

## Conditions for `tested`
- no scenario left `@wip`;
- every conditional scenario (`@requires:`) has run, with its report read;
- no manual test left to validate: each `TEST_SCENARIOS.md` item is automated and green, or listed non-applicable with its reason;
- `@review` captures opened and looked at.

## Evidence to keep
Per scenario, only the latest report for the revision now in the repository: `summary.md`, `junit.xml`, `log-check.txt`, and a few 1280 px JPEG captures. Drop `report.html`, `messages.ndjson`, `Player.log`, `summary.json`. Reports stay on disk in `Tests/Pickle/Evidence/` (gitignored); one line per run goes in `docs/runs/history.md`. Never delete a report a `STATUS.md` field points to.
