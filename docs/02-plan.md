# 02 — Plan, Milestones and Checkpoints

The plan exists to make one thing obvious: **when integration happens**. Groups that leave
integration to the last week fail on the integration, not on the idea.

| | |
|---|---|
| **Final submission** | `<YYYY-MM-DD>` 23:59 HKT |
| **Code freeze** | `<YYYY-MM-DD>` |
| **Report freeze** | `<YYYY-MM-DD>` |
| **Owner of this plan** | `<Name>` (project lead) |

---

## 1. Milestones

Dates are targets with a named exit criterion. A milestone that "sort of" happened has not
happened.

| ID | Milestone | Due | Exit criterion | Owner | Status |
|---|---|---|---|---|---|
| M0 | Kickoff | `<date>` | Brief drafted, roles assigned, repo set up, team able to clone and push | `<Name>` | 🟡 in progress |
| M1 | Proposal sign-off | `<date>` | Supervisor agrees scope in `00-brief.md`; risks reviewed | `<Name>` | ⚪ |
| M2 | Vertical slice | `<date>` | Something runs end to end on real data, badly; integration path proven | `<Name>` | ⚪ |
| M3 | Results complete | `<date>` | Final metrics, ablations and figures produced and reproducible | `<Name>` | ⚪ |
| M4 | Report draft complete | `<date>` | All sections written, figures final, references complete | `<Name>` | ⚪ |
| M5 | Submission | `<date>` | Checklist in [`06-submission.md`](06-submission.md) passes | `<Name>` | ⚪ |

**M2 is the milestone groups skip.** A vertical slice — ugly, partial, but end-to-end — is what
turns seven people's separate pieces into one project. Do not let it slip past the midpoint.

## 2. Phases

| Phase | Weeks | Focus | Lead |
|---|---|---|---|
| P1 Discovery | `<W1–W2>` | Literature, data access, supervisor alignment, brief | `<Name>` |
| P2 Foundations | `<W3–W5>` | Pipeline skeleton, data schema agreed, baseline running | `<Name>` |
| P3 Core build | `<W6–W9>` | Main method, evaluation harness, integration in `main` weekly | `<Name>` |
| P4 Consolidation | `<W10–W11>` | Ablations, error analysis, figures, report drafting | `<Name>` |
| P5 Delivery | `<W12>` | Polish, rehearsal, freeze, submission | `<Name>` |

## 3. Workstreams and dependencies

| Workstream | Depends on | Blocks | Owner |
|---|---|---|---|
| Data pipeline | Data access (P1) | Model, evaluation | `<Name>` |
| Model | Data schema (P2) | Evaluation, report results | `<Name>` |
| Evaluation | Model + metrics agreed | Report §6, figures | `<Name>` |
| Report | Results from evaluation | Submission | `<Name>` |
| Presentation | Report skeleton + demo | Submission | `<Name>` |
| Repo / releases | — | Everyone | `<Name>` |

**Critical path:** data access → schema → model → evaluation → results → report.
Everything else can absorb slippage; that chain cannot. Protect it.

## 4. Supervisor checkpoints

| When | What to send | Prepared by |
|---|---|---|
| `<date>` | Proposal: problem, objectives, plan, risks (2 pages) | `<Name>` |
| `<date>` | Progress update: what works, what does not, the next decision | `<Name>` |
| `<date>` | Draft report for comment (not a final copy) | `<Name>` |
| `<date>` | Final submission + confirmation of what was submitted | `<Name>` |

Use [`../reports/progress-update.md`](../reports/progress-update.md). Send it **before** the
meeting, not during it — the supervisor should arrive having read it.

## 5. Weekly rhythm

| Day | What happens |
|---|---|
| `<Mon>` | Lead updates `03-handover-log.md` and the milestone table above |
| `<Tue>` | Sync (30 min): blockers first, status second; minutes written same day |
| `<Wed–Thu>` | Heads-down work; PRs opened by Thursday evening |
| `<Fri>` | Reviews cleared; `main` updated; anything unfinished logged as carried over |
| `<Weekend>` | Optional; never the only time integration happens |

## 6. Buffer and contingency

- **One week of buffer** is built into P5. It is not spare capacity for new features.
- **Feature cut list**, agreed in advance: if P4 starts late, we drop `<feature>`, then
  `<feature>`. Deciding this in advance avoids a panicked argument in week 12.
- **If the main method underperforms**: the report presents it as an empirical finding with a
  baseline comparison. A well-analysed negative result is a valid project; a missing evaluation
  is not.

## 7. Status tracking

- Milestone status lives in the table in §1 — 🟢 done · 🟡 in progress · 🔴 at risk · ⚪ not started.
- Day-to-day work lives in [`03-handover-log.md`](03-handover-log.md) and in Issues.
- Anything 🔴 goes into the next sync's first agenda item, with a proposed recovery.
