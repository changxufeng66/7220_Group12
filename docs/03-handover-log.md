# 03 — Handover Log

**The most important file in this repository.** Seven people, twelve weeks, one project: every
task outlives the person who started it. This log is how work survives a handover — and, at
the end, how the report's Appendix A can be written honestly.

Two rules:

1. **Claim before you start.** Add a row before writing code or text.
2. **Update before you stop.** Never leave a row saying `in progress` for something you walked
   away from.

---

## 1. Status vocabulary

Use only these five. Inventing new ones makes the file unreadable.

| Status | Meaning |
|---|---|
| `in progress` | Someone is actively working on it |
| `handover ready` | Paused mid-way; the next person can continue **from the description alone** |
| `blocked` | Waiting on something outside the author's control — name it in the next-step column |
| `carried over` | Reassigned to someone else, or pushed to a later milestone |
| `done` | Merged to `main`, reviewed, and covered by the definition of done |

---

## 2. The log

| Date | Who | Area | What changed / where it lives | Status | PR | Next step (owner) |
|---|---|---|---|---|---|---|
| `<YYYY-MM-DD>` | `<Name>` | repo | Set up repository structure, conventions, templates. Everything in `main` from here on. | done | — | Team: read `CONTRIBUTING.md` before your first PR (`<Name>`) |
| `<YYYY-MM-DD>` | `<Name>` | data | Schema draft in `src/pipeline/schema.md`; loader handles the CSV and the JSON export | handover ready | #`<n>` | Wire the dedup step into the loader; `src/pipeline/load.py:120` still has a hardcoded path (`<Name>`) |
| `<YYYY-MM-DD>` | `<Name>` | model | Baseline logistic regression, macro-F1 0.71 on dev | done | #`<n>` | Compare against the transformer baseline before model choice is frozen (`<Name>`) |
| `<YYYY-MM-DD>` | `<Name>` | report | §1–§3 drafted; §4 blocked on the final architecture | blocked | — | Waiting on decision `D-004`; draft §5 meanwhile (`<Name>`) |

> The first row is real. The others are examples of the level of detail expected — delete them
> once you have your own rows.

---

## 3. What a handover entry must contain

A tired reader with 20 minutes should be able to continue. That means:

- **Where the work lives** — branch name, file path, notebook, issue number.
- **How to run or open it** — the exact command, or the exact page.
- **What is broken or unverified** — not "mostly done", but "the dedup step drops 4% of rows
  and I have not checked whether that is correct".
- **The next concrete step** — an action, not a direction. "Compare against baseline X" beats
  "continue with modelling".

Bad:

```
| 2026-11-20 | Alice | model | worked on model | in progress | | |
```

Good:

```
| 2026-11-20 | Alice | model | Transformer fine-tune runs; best dev macro-F1 0.78 vs 0.71 baseline.
    Code in src/model/train.py, config in configs/transformer.yaml, run: python -m model.train --config configs/transformer.yaml
    (≈40 min on the shared GPU). Unverified: seed sensitivity — one run only. Next: 3-seed sweep, then freeze the model choice (Bob). | in progress | #23 | Let Bob start §6.3 skeleton; Alice finishes seeds by <date> |
```

---

## 4. Taking over someone else's work

1. Read their last row twice, then open the files it names.
2. Run it. If you cannot run it in 20 minutes, that is a handover defect — fix the instructions
   in the same row and say so.
3. Add **your** row: `taking over from <Name>`, what you understand the state to be.
4. If you disagree with their next step, say so in the row before doing something different.

Do not silently rewrite someone's work. If it needs replacing, open an issue, reference their
row, and explain the reason — that is also what the supervisor will want to know if asked.

---

## 5. Weekly hygiene (project lead, 5 minutes)

- Any row `in progress` older than a week with no PR? Ask, then either push it to
  `handover ready` or reassign it.
- Any PR merged without a row? Add the row on the author's behalf — the log is evidence, and
  gaps look like nobody did the work.
- At each milestone, do a read-through: the log should read as a short history of the project.

---

## 6. At submission

Run `scripts/contribution-report.cmd` to generate `docs/contribution-summary.md`, then:

- Use it to write **Appendix A (Division of Labour)** in the report in prose, not as a table of
  commit counts.
- Check that nobody's work is unattributed and that no row overstates what happened.
- Every member reads Appendix A before submission and confirms it. The supervisor may ask any
  member to explain their row.
