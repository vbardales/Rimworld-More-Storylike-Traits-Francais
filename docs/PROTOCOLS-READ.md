# Protocols read

Read on 2026-09-29 by the mod session. Version = last commit touching the file, plus a content hash prefix.
Protocol documents live in the `Rimworld-protocols` repository (git dir `../rimworld-protocols.git`);
tool documents live in their own repositories. Re-read a file only when its hash changes.

## Useful (read in full)

| File | Version | Used for |
| --- | --- | --- |
| AGENTS.md | 50de695 2026-09-28, 6cee468a7521 | workflow gates, evidence rules |
| AUDIT.md | 83d1e19 2026-09-28 (modified, uncommitted), 160ea1fe9db4 | the audit itself, stage codes, session title |
| PUBLISHING.md | 50de695 2026-09-28, 513f110ae0b6 | licence suffix, description rules, upstream PR rule |
| TRANSLATIONS.md | f5c2d9d 2026-09-25, 298f74d226da | l10n gate, plural rule (no counted text here) |
| MOD_SETTINGS.md | b83933b 2026-09-23, 404916bc99a7 | settings gate (not applicable here) |
| Rimworld-Ticket-Dispatcher/docs/WELCOME.md | 77ca9d7 2026-09-27, 08b440a03f74 | Pickle queue, doc-tracking duty, no `.ico`/`desktop.ini` in Mod/ |

## Not read this pass, with the trigger that makes them useful

| File | Version | Read when |
| --- | --- | --- |
| STYLE_RIMWORLD.md | 50de695 2026-09-28, 2c6db32396ae | before touching the icon or the Preview (an older version was read 2026-09-11) |
| WORKSHOP_COMMENTS.md | 50de695 2026-09-28, 122a3c44cfd1 | before drafting thank-you comments (prepublished) |
| PickleTools/Authoring/README.md | 8d3ca6d 2026-09-26, e620df7e25d2 | before writing the Pickle suite |
| PickleTools/docs/steps.md | da7c3b0 2026-09-28, df2b37a6aff2 | before writing any step |
| PickleTools/README.md, Headless/README.md | c771bef, ed4e73a | before a Pickle pass |
| Rimworld-Ticket-Dispatcher/docs/SUBMIT.md | d07b2b8 2026-09-26, eaca3969c7eb | before submitting a Pickle run |
| Rimworld-Release-Admin/docs/OPERATIONS.md | 3c03f51 2026-09-26, 23fcf6423000 | before any CI publication |

## Useless for this mod

| File | Why |
| --- | --- |
| scripts/SEARCHING.md | corpus search across Workshop mods; this mod has no such need, and grep on the corpus is forbidden |

## Not applicable here (do not exist)

PUBLICATION.md, BACKLOG.md, NOTES.md, BUGS.md, LICENSE (source is silent, none invented), Tests/Pickle/.
