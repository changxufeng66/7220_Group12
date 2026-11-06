# 01 — Team, Roles and How We Decide

Seven people is enough that "everyone does a bit of everything" fails. Split by workstream,
name an owner for every area, and name a backup for every owner.

| | |
|---|---|
| **Team** | Group 12, `<7220 — Course Title>` |
| **Members** | 7 |
| **Weekly sync** | `<e.g. Tuesday 18:00 HKT, <place/channel>>` |
| **Minutes** | [`05-meetings/`](05-meetings/) |
| **Current work** | [`03-handover-log.md`](03-handover-log.md) |

---

## 1. Members

| # | Name | GitHub | Primary workstream | Backup for |
|---|------|--------|--------------------|------------|
| 1 | `<Name>` | `@<handle>` | Project lead | `<...>` |
| 2 | `<Name>` | `@<handle>` | `<...>` | `<...>` |
| 3 | `<Name>` | `@<handle>` | `<...>` | `<...>` |
| 4 | `<Name>` | `@<handle>` | `<...>` | `<...>` |
| 5 | `<Name>` | `@<handle>` | `<...>` | `<...>` |
| 6 | `<Name>` | `@<handle>` | `<...>` | `<...>` |
| 7 | `<Name>` | `@<handle>` | `<...>` | `<...>` |

> The "Backup for" column is not decoration. If someone is ill in the last week, the named
> backup is who picks the work up, using only the handover log.

## 2. Roles

| Role | Owns | Held by |
|---|---|---|
| **Project lead** | Schedule, supervisor communication, unblocking, final call on disputed decisions | `<Name>` |
| **Technical lead** | Architecture, code review standards, integration, "does it run from a clean clone" | `<Name>` |
| **Data lead** | Acquisition, cleaning, provenance, licensing, `data/README.md` | `<Name>` |
| **Evaluation lead** | Metrics, baselines, ablations, validity of reported numbers | `<Name>` |
| **Report lead** | Report structure, consistency of voice, figure quality, deadline for drafts | `<Name>` |
| **Presentation lead** | Deck, demo script, rehearsal, speaker allocation | `<Name>` |
| **Repository steward** | Repo hygiene, branch protection, release tags, `deliverables/` freezing | `<Name>` |

Roles can be held in combination, but **no member holds more than two**.

## 3. Ownership by area

| Area | Owner | Backup | Where it lives |
|---|---|---|---|
| Data pipeline | `<Name>` | `<Name>` | `src/pipeline/` |
| Modelling | `<Name>` | `<Name>` | `src/model/` |
| Evaluation | `<Name>` | `<Name>` | `src/eval/` |
| Report | `<Name>` | `<Name>` | `reports/` |
| Presentation | `<Name>` | `<Name>` | `presentations/` |
| Repository & releases | `<Name>` | `<Name>` | root, `scripts/` |

An area with no owner is a gap. If you notice one, raise it at the next sync and write the
name into this table — do not quietly absorb it.

## 4. Cadence

| What | When | Output |
|---|---|---|
| Weekly sync | `<day, time>` | Minutes in `05-meetings/`, decisions in `04-decision-log.md` |
| Async standup | In the group chat, `<daily/weekly>` | Blockers surfaced; nothing longer than three lines |
| Supervisor check-in | `<every N weeks, or on request>` | `reports/progress-update.md` sent `<N>` days before |
| Pre-deadline review | `<T-3 days>` | Every deliverable checked against `06-submission.md` |

Standup format — three lines, no more:

```
Done: …
Next: …
Blocked by: … (name the person, or write "nothing")
```

## 5. Decisions

- **Routine** (naming, file layout, minor tooling): whoever is doing the work decides.
- **Cross-cutting** (architecture, metric choice, scope change): discuss at the sync; the owner
  of the affected area proposes, the project lead confirms.
- **Deadlock**: the project lead decides, and the dissent is recorded in the decision log so it
  is visible later. Unanimity is not required; silence is not consent.
- **Every non-trivial decision gets an entry** in [`04-decision-log.md`](04-decision-log.md),
  including the option we rejected and why. The supervisor will ask.

## 6. Escalation

1. Ask the area owner directly, in the channel, with a link to the file or issue.
2. Still blocked after a day → project lead.
3. Still blocked, or it affects scope → supervisor, with a short written summary of the
   options and what the team recommends. Do not escalate a problem without a proposal.

## 7. If someone goes quiet

Agreed protocol, so nobody has to have an awkward conversation under deadline pressure:

- **48 hours** with no reply during an active task: the lead checks in privately.
- **A week**, with the task unmerged: the task is reassigned to the named backup, and the
  handover log explains what was recovered. No blame, no silent rewriting.
- Work already pushed stays attributed to its author. If someone returns, they pick up from
  the handover log like anyone else.

## 8. Fairness and evidence of contribution

- Contribution is tracked by the commit history and by `docs/contribution-summary.md`,
  generated with `scripts/contribution-report.cmd`.
- Commit counts are **not** a score. Design, review, debugging, writing and coordination all
  count; the report's Appendix A describes who did what in prose, and every member reviews it
  before submission.
- If the split is uneven in the final weeks, say so early — Appendix A must be honest, and the
  supervisor can read the history.
