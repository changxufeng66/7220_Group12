# Contributing

Seven people, one repository, one supervisor reading it. These rules exist so that work
survives handovers and so that the commit history is usable evidence of individual
contribution.

---

## 1. Language

- **Everything committed is in English**: code comments, documentation, commit messages,
  PR descriptions, issue titles. The supervisor reads this repository.
- Team chat, and conversation during review, can be in any language.

---

## 2. Branches

```
<type>/<area>-<your-name>
```

| Type | Use |
|---|---|
| `feat` | New functionality or a new section of the report |
| `fix` | Correcting something already on `main` |
| `docs` | Documentation, report text, figures |
| `exp` | Experiments that may never be merged |

Examples:

```
feat/modelling-alice
docs/report-evaluation-bob
fix/pipeline-null-handling-chen
```

Always branch from an up-to-date `main`:

```powershell
git switch main
git pull
git switch -c feat/modelling-alice
```

Never branch from someone else's unfinished branch — you will inherit their half-finished work.

---

## 3. Commits

```
<type>(<area>): <what changed>
```

- `type`: `feat` / `fix` / `docs` / `refactor` / `test` / `chore`
- `area`: the workstream — `pipeline`, `model`, `eval`, `report`, `slides`, `repo`
- Subject in the imperative mood, no full stop, under 72 characters

Good:

```
feat(pipeline): add deduplication step before tokenisation
fix(eval): report macro-F1 instead of micro-F1
docs(report): draft the limitations section
```

Bad — these make the history useless:

```
update
changes
final version
try again
```

One logical change per commit. If the subject needs "and", split the commit.

If a commit needs explanation, put it in the body: why you did it, what you tried first,
what is still wrong.

---

## 4. Pull requests

The PR template will prompt you. All four parts are mandatory:

1. **What changed** — one or two sentences
2. **Why** — the task or defect it addresses; link the issue
3. **How it was verified** — commands run, results checked, pages proofread
4. **What is left** — next step and who owns it

Rules:

- **One concern per PR.** A PR that fixes the pipeline *and* rewrites a report section cannot be reviewed properly; split it.
- **At least one review** from someone who did not write the code or text.
- Review within **24 hours** — someone is blocked on you otherwise.
- Merge with **Squash and merge**, then **delete the branch**.
- Never merge your own PR without a second pair of eyes, except for trivial typo fixes.

---

## 5. Definition of Done

A task is done when:

- [ ] It works from a clean clone following `src/README.md` — not just on your machine
- [ ] Relevant documentation or report text is updated in the same PR
- [ ] `docs/03-handover-log.md` has a row describing the final state
- [ ] CI/tests pass, or the PR explains why they do not apply
- [ ] Someone else has reviewed it

"Merged" and "done" are not the same thing. If a task leaves loose ends, it goes back in the
handover log as `carried over`, with the loose ends named.

---

## 6. Handover rules

Before you stop working on anything — end of day, end of week, going to sleep before a
deadline — add a row to [`docs/03-handover-log.md`](docs/03-handover-log.md) that answers:

- Where the work lives (branch, file, notebook)
- How to run or open it
- What is broken or unverified
- What the next concrete step is

Assume the next reader is tired, has not seen your screen, and has 20 minutes.

---

## 7. What must never be committed

| Never | Instead |
|---|---|
| Passwords, API keys, tokens | Environment variables; documented in `src/README.md` |
| Personal or confidential data | Aggregated/synthetic samples in `data/` |
| Files over ~50 MB | GitHub Release or shared drive; link from `data/README.md` |
| Supervisor's unpublished material | Keep it out of git unless they agree |
| Course materials that forbid redistribution | Cite them; do not copy them in |

If you commit a secret by accident, tell the project lead immediately. Removing it in a later
commit does **not** remove it from history, and the credential must be revoked.

---

## 8. Academic integrity

This repository is a record of the group's own work.

- **Cite every source** you use, in `references/references.bib`.
- **Do not copy** code or text from other groups, from previous years, or from the internet
  without attribution — including code that "we rewrote a bit".
- **Declare AI assistance** if the course requires it. Put the declaration in
  `reports/final-report.md` (Appendix C) and keep it accurate. Undisclosed use is treated as
  misconduct at HKU, and the commit history makes it visible.
- **Be able to explain your own contribution.** Each member should be able to walk the
  supervisor through what they wrote, why, and what they would do differently.

The commit history and `docs/03-handover-log.md` are the honest record of who did what. Do not
inflate them; do not let one member's work appear unattributed either.
