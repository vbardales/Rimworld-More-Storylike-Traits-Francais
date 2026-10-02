# Run history

One line per run. Evidence itself stays on disk under `Tests/Pickle/Evidence/`, ignored by git.

- 2026-09-13 17b368a+local: WorkerTests 20/20, XML tests 8/8, XmlFields/DefRefs(Core)/DefInjected(548 keys) clean. Out of game.
- 2026-09-29 316476a: WorkerTests 20/20, XmlFields clean, DefRefs(Core) 84 defs clean, DefInjected 548 keys 0 errors. test_xml.py NOT rerun (no Python on this machine, only the Store stub). No in-game run, no Pickle run.
- 2026-09-29: Preview overlay moved to the bottom left (Art/preview.html), 896x504, 452370 bytes, contrast min 4.92 (badge), title 8.13. Rebuilt with NODE_PATH borrowed from AdaptiveStorageNeolithicRenew/node_modules.
- 2026-09-29 d72f234->: repo turned into the French translation of HYP Continued; Check-DefInjected 166 keys 0 errors against Lin 1.6; Preview rebuilt 896x504 453420 bytes. Out of game.
- 2026-09-29: Preview switched to the shared scripts/Render-Preview.cjs + Make-PreviewBadge.ps1 (Art/preview-copy.json, ModIcon-badge.png), 896x504, 470695 bytes, contrast min 4.92 (badge), text >= 7.21. Overlay is now top left with the icon badge bottom left.
- 2026-09-29, revision 3bc5f65: Pickle English pass (request 20260929-104121-372-a2e6, feature 01), 3/3 passed, exitReason passed, set sans-facultatifs. Player.log: only ALSA/FMOD audio noise (WSL) and the companion's own missing-downloadUrl warning. Evidence: Tests/Pickle/Evidence/english.
- 2026-09-29, revision 3bc5f65: Pickle French pass (request 20260929-104121-997-fa19, features 01+02), 4/4 passed (the dispatcher message said 3/3; summary.json says 4), exitReason passed. Same log content. The active language is not visible in Player.log, so the French pass is taken from the launcher's -Language French, not read back. Evidence: Tests/Pickle/Evidence/french.
- 2026-10-01: 0.1.0 prepublication from the game button: private Workshop item 3811294875 created, `About/PublishedFileId.txt` committed (776670e). `Mod/` = commit 195b1a3. Not a tested version.
- 2026-10-02 195b1a3: Check-DefInjected against Lin's 1.6 folder and DLL, 166 keys, 0 errors. Out of game. Pickle not replayed; the 2026-09-29 runs predate the French rewording of 195b1a3.
- 2026-10-02: Evidence minified, english and french 1.7 MB -> 3 KB each (kept summary.md/json, junit.xml, evidence-complete.txt, log-check.txt). Both runs were on 3bc5f65 and stay the only Pickle proof until the replay.
