# 02 — Plan for the Three Weeks That Actually Remain

There is no semester left. From **10 November 2026** the group has **20 days**, and the
presentation falls *before* the report is due. The plan below is built around that inversion:
the demo must be finished and rehearsed before the writing is finished.

| | |
|---|---|
| **Today** | 10 November 2026 |
| **Presentation window** | 19–26 November 2026 (15 min + 5 min Q&A; exact slot unknown) |
| **Report due** | 30 November 2026, 17:00 — Moodle + Turnitin, group leader only |
| **Internal freeze (deck + demo)** | 18 November 2026, 23:59 |
| **Internal freeze (report + zip)** | 29 November 2026, 23:59 |
| **Owner of this plan** | `<Name>` (project lead) |

**Why the deck freezes first.** If our slot is 19 November, a deck finished on the 18th is the
only schedule that survives. Anything still moving after the 18th gets cut, not polished.

---

## 1. Schedule

| Dates | Focus | Must be true by the end | Lead |
|---|---|---|---|
| **10–12 Nov** (Tue–Thu) | Freeze scope, design the knowledge base, engine skeleton | Attribute schema agreed; 5 rules running end to end with a stub UI; deck outline | `<Name>` |
| **13–16 Nov** (Fri–Mon) | Build: full knowledge base, ranking, explanation, desktop pet | ~80 animal/breed entries × 7 attributes; ranked top-3 with justification; pet window alive and draggable; first integrated demo | `<Name>` |
| **17–18 Nov** (Tue–Wed) | Evaluation, figures, deck, rehearsal | 20-profile test set scored; charts exported; deck final; two timed rehearsals; demo recorded as backup | `<Name>` |
| **19–26 Nov** (Thu–Thu) | **Presentations.** No new features. | Slot delivered; report §1–§3 drafted by the members not presenting that day | `<Name>` |
| **27–29 Nov** (Fri–Sun) | Report, contributions, submission packaging | §1–§4 complete; 7 individual reports (300–600 words each); IEEE references; clean-clone test passes; code zip + readme | `<Name>` |
| **30 Nov** (Mon) | Buffer + upload | Internal deadline 12:00; uploaded 17:00 | `<Name>` |

**Slide the work, not the date.** If 13–16 Nov slips, the 17–18 Nov rehearsal still happens — we
present what exists, not what was planned.

---

## 2. Milestones

| ID | Milestone | Due | Exit criterion | Owner |
|---|---|---|---|---|
| M1 | Scope frozen | 12 Nov | Brief signed off internally; KB schema documented in `docs/` | `<Name>` |
| M2 | Vertical slice | 14 Nov | One question → inference → recommendation → desktop pet reaction, end to end, ugly | `<Name>` |
| M3 | Feature complete | 16 Nov | All must-have features implemented; nothing new added after this date | `<Name>` |
| M4 | Demo frozen | 18 Nov | Deck final, demo rehearsed twice, recording as fallback | `<Name>` |
| M5 | Report frozen | 29 Nov | Word count inside 2,000–4,000, references complete, individual reports collected | `<Name>` |
| M6 | Submitted | 30 Nov 17:00 | Moodle + Turnitin receipt saved in `docs/` | `<Name>` |

**M2 is the milestone teams skip.** A vertical slice — one path, working, end to end — is what
proves the integration; everything after it is widening, not inventing.

---

## 3. Workstreams (seven people)

| # | Workstream | Deliverable | Owner | Backup |
|---|---|---|---|---|
| 1 | Lead / integration | Schedule, daily 10-minute standup, merge duty, submission | `<Name>` | `<Name>` |
| 2 | Knowledge base / domain | Animal & breed attribute table with citations; rule set; question wording | `<Name>` | `<Name>` |
| 3 | Inference engine | Forward chaining, salience, trace, explanation facility | `<Name>` | `<Name>` |
| 4 | Desktop pet (front-end) | Transparent always-on-top window, sprite states, dialogue coupling | `<Name>` | `<Name>` |
| 5 | Evaluation & figures | 20-profile test set, agreement metric, ablation, charts | `<Name>` | `<Name>` |
| 6 | Report | Structure, §1–§4 drafting, IEEE references, word count | `<Name>` | `<Name>` |
| 7 | Presentation & demo | Deck, script, timing, rehearsal, backup recording | `<Name>` | `<Name>` |

Two people per workstream by design: whoever is blocked on the other can hand over without a
conversation. The handover log is what makes that work.

---

## 4. Critical path

```
KB schema (10–12) → engine + rules (12–15) → integration with pet UI (15–16)
      → demo script + rehearsal (17–18) → presentation (19–26)
      → report §3 results (27–29) → submission (30)
```

Everything else can absorb a day of slip. **This chain cannot.** Report §1–§2 can be written in
parallel from 13 Nov because they do not depend on results — that is the only slack available.

---

## 5. If we are running late

Decided in advance, so nobody argues at midnight:

1. Cut the **second animal family** (e.g. keep cats/dogs, drop exotics) — the KB is the slowest
   thing to build and the least visible in a demo.
2. Cut **certainty-factor weighting** — keep binary rules, mention the limitation.
3. Cut **live sprite animation** — keep a static pet with two expressions.
4. Never cut: the explanation facility, the evaluation table, the demo recording.

The last three cost marks under §3 of the report ("analysis of experimental results"), which is
30% of the project. Cutting the KB breadth costs nothing if the report says why it was cut.
