# Protocols read

Re-read a file only when its hash changes. Version = SHA-256 prefix (12 hex) and modification time of the file
as read; the monorepo `git log` is too slow to query on this machine, so no commit id is recorded this time.
Last pass: 2026-10-02, mod session, audit against `AUDIT.md`. First pass: 2026-09-29.

## Useful, read

| File | Hash, mtime | Read | Used for |
| --- | --- | --- | --- |
| AUDIT.md | 4982872340E3, 2026-10-02 19:34 | in full, 2026-10-02 | the audit, stage codes, new `tested` conditions, session title, 0.1.0 prepublication rule |
| AGENTS.md | 7A236F03CA15, 2026-09-29 09:11 | in full (system prompt), 2026-10-02 | evidence rules (keep latest per scenario, trim `docs/runs`) |
| TRANSLATIONS.md | E381086A5271, 2026-10-02 09:51 | in full, 2026-10-02 | gender switch (three segments), `colon`, Virginie's review, `FRENCH_REVIEW.md` format |
| PUBLISHING.md | 30A1C36885ED, 2026-10-02 15:56 | sections "Départ", "Dépôt", "Au moment d'envoyer", "Juste après", "À chaque mise à jour", "Publier par la CI" | repo rules, `PublishedFileId.txt` commit, upstream PR rule, CI path. Not read: description, packageId, images, licence, mentions, animal-mod rules, topics |
| PickleTools/README.md | 40E44A5D2C12, 2026-10-01 17:41 | in full, 2026-10-02 | tool table: `InspectTabs`, `ColonistRace`, `LoadAudit` are the candidates for automating the manual in-game reads |

## Read earlier, unchanged since (not reread)

| File | Hash | Read | Used for |
| --- | --- | --- | --- |
| MOD_SETTINGS.md | 404916BC99A7 | 2026-09-29 | settings gate (not applicable here) |
| Rimworld-Ticket-Dispatcher/docs/WELCOME.md | 08B440A03F74 | 2026-09-29; the `desktop.ini`/`.ico` paragraph reread 2026-10-02 | Pickle queue, no Explorer artefacts in `Mod/` |
| Rimworld-Ticket-Dispatcher/docs/SUBMIT.md | EACA3969C7EB | not read; hash only | before submitting a Pickle run |
| Rimworld-Release-Admin/docs/OPERATIONS.md | 23FCF6423000 | not read; hash only | before any CI publication |

## Changed since the last read, not read this pass, with the trigger

| File | Hash now | Read when |
| --- | --- | --- |
| STYLE_RIMWORLD.md | 5A054CF3A04B | before touching the icon or the Preview |
| WORKSHOP_COMMENTS.md | 164D7EE78E21 | before drafting thank-you comments (at publication) |
| PickleTools/Authoring/README.md | 349E596B4AF7 | before writing the `@review` capture scenario |
| PickleTools/docs/steps.md | 6225BEA7ADC7 | before writing or using any step |
| PickleTools/Headless/README.md | 2310BB974F68 | before the next Pickle pass |

## Useless for this mod

| File | Why |
| --- | --- |
| scripts/SEARCHING.md | corpus search across Workshop mods; no need here, and grep on the corpus is forbidden |

## Do not exist in this repository (the monorepo ones are not the mod's)

BACKLOG.md (no origin repository, so no PR to track), NOTES.md, BUGS.md, LICENSE (the source is silent, none invented).
