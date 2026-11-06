# 04 — Decision Log

Decisions that were expensive, contested, or hard to reverse. One entry each, written when the
decision is made — not reconstructed at report time.

**Why this file exists:** the supervisor will ask "why did you do it this way?" in the viva.
"Because we decided it in week 6 and wrote down why" is a good answer. "I think someone tried
that once" is not. Report §4 can cite entries directly.

---

## 1. Index

| ID | Date | Decision | Status | Owner | Linked |
|---|---|---|---|---|---|
| D-001 | `<YYYY-MM-DD>` | Project scope reduced to `<...>` | accepted | `<Name>` | `00-brief.md` §4 |
| D-002 | `<YYYY-MM-DD>` | `<...>` | accepted / superseded / rejected | `<Name>` | — |

---

## 2. Template

Copy this block for each entry, newest at the bottom of the file.

```markdown
## D-00N — <short title in the imperative or noun form>

- **Date:** <YYYY-MM-DD>
- **Decided by:** <names>
- **Status:** proposed / accepted / superseded by D-00M / rejected

**Context.**
What forced a decision now. Two or three sentences: the constraint, the deadline, the missing
information.

**Options considered.**

1. **<Option A>** — <what it involves>. Good: <...>. Bad: <...>.
2. **<Option B>** — <...>. Good: <...>. Bad: <...>.
3. **<Option C (do nothing / defer)>** — <...>.

**Decision.**
We chose **<Option X>** because <the deciding reason, in one or two sentences>.

**Consequences.**
- <What becomes easier.>
- <What becomes harder, and who pays for it.>
- <What we would have to redo if this proves wrong, and how expensive that would be.>
```

---

## 3. What deserves an entry

| Usually yes | Usually no |
|---|---|
| Choice of method / model / architecture | File naming, formatting |
| Metric and evaluation protocol | Which library function to call |
| Dataset and its licence implications | Minor refactors |
| Scope change, dropped feature | Routine dependency bumps |
| Division of a shared component between two owners | Anything reversible in ten minutes |
| Anything the supervisor disagreed with | — |

---

## 4. Example entry (delete once you have your own)

## D-000 — Evaluate on the held-out split only, not on the public leaderboard

- **Date:** `<YYYY-MM-DD>`
- **Decided by:** `<Name>`, `<Name>`
- **Status:** accepted

**Context.**
The public leaderboard is available and would let us report a higher headline number, but we
cannot see how it is computed and the course rubric rewards methodology, not leaderboard rank.

**Options considered.**

1. **Public leaderboard** — higher number, no visibility into the split. Good: flattering.
   Bad: unreproducible, and we cannot run ablations against it.
2. **Held-out split we control** — lower number, full control. Good: ablations, error analysis,
   honest limitations. Bad: our number looks weaker next to published results.
3. **Both** — report on our split, mention the leaderboard in a footnote.

**Decision.**
We chose **Option 2**, with the leaderboard mentioned as external context only, because every
evaluation claim in the report must be one we can reproduce during the demo.

**Consequences.**
- Ablations become possible — this unlocks §6.3 of the report.
- Our headline number will look lower than published ones; §2 and §7 must explain why the
  comparison is not like-for-like.
- If the supervisor insists on the leaderboard number, adding it later is one script run.
