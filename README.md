# Group 12 — Pet Recommendation Expert System with a Desktop Pet Companion

Group project for **IDAT7215 Computer Programming for Product Development and Applications**,
The University of Hong Kong, 2026/27 Semester 1.
Team of seven · Instructor: **`<Professor Name>`**

| | |
|---|---|
| **Topic** | Course topic 2 — *write a Python script to develop an expert system* |
| **Status** | 🟡 Week 1 — brief being frozen, engine skeleton in progress |
| **Report due** | **30 November 2026, 17:00** (Moodle + Turnitin, group leader only) |
| **Presentation** | **19–26 November 2026** · 15 min talk + 5 min Q&A, all members present |
| **Report length** | 2,000–4,000 words (+10% tolerance, then a 10% mark penalty) |
| **Graded deliverables** | [`deliverables/`](deliverables/) · code + readme, zipped |

> **The constraint that shapes everything:** 40% of the mark is *quality and quantity of
> implementation*, and the guideline requires us to state exactly which parts are open-source and
> which are ours. [`docs/reference-projects.md`](docs/reference-projects.md) records how the
> reference projects are used — as architecture, never as pasted code.

---

## 1. What we are building

**Problem.** Choosing a pet is a decision people routinely get wrong: the animal's adult size,
activity needs, lifespan, noise, and cost have to match a household's space, budget and daily
routine, and most advice online is generic or written for a different country's climate and
housing. A short structured consultation with an expert is what actually prevents mismatches —
and that expertise, in a form a user can run on their own desktop, does not exist.

**What we deliver.** A Python expert system that interviews the user, reasons over a knowledge
base of animal and breed traits, and returns ranked recommendations **with a justification for
each** — wrapped in a desktop-pet companion that reacts to the consultation in real time, so the
dialogue feels like talking to a small character rather than filling in a form.

**Why this team.** Seven people across data, front-end, rule design, evaluation and writing,
working in one repository with a documented division of labour.`

> Keep this section under 150 words. If you cannot state the problem in three sentences,
> the scope is not settled yet — that is what `docs/00-brief.md` is for.

---

## 2. Team and ownership

| # | Name | GitHub | Primary workstream | Also covers |
|---|------|--------|--------------------|-------------|
| 1 | `<Name>` | `@<handle>` | Project lead / coordination | `<...>` |
| 2 | `<Name>` | `@<handle>` | `<e.g. Data pipeline>` | `<...>` |
| 3 | `<Name>` | `@<handle>` | `<e.g. Modelling>` | `<...>` |
| 4 | `<Name>` | `@<handle>` | `<e.g. Backend / integration>` | `<...>` |
| 5 | `<Name>` | `@<handle>` | `<e.g. Evaluation>` | `<...>` |
| 6 | `<Name>` | `@<handle>` | `<e.g. Report>` | `<...>` |
| 7 | `<Name>` | `@<handle>` | `<e.g. Presentation / demo>` | `<...>` |

Roles, decision rules and escalation are in [`docs/01-team.md`](docs/01-team.md).
Who is working on what, right now, is in [`docs/03-handover-log.md`](docs/03-handover-log.md).

---

## 3. Repository map

```
7220_Group12/
├─ README.md                 ← this file: what the project is, how to join in
├─ CONTRIBUTING.md           ← branch, commit, PR and review rules
├─ docs/                     ← project documentation (the "paper trail")
│  ├─ 00-brief.md            scope, objectives, deliverables, assessment mapping
│  ├─ 01-team.md             members, roles, ownership matrix, cadence
│  ├─ 02-plan.md             milestones, dependencies, supervisor checkpoints
│  ├─ 03-handover-log.md     who touched what, and what the next person must do
│  ├─ 04-decision-log.md     decisions we made and why (ADR-light)
│  ├─ 05-meetings/           dated minutes, one file per meeting
│  ├─ 06-submission.md       how this reaches the supervisor, and the pre-submit checklist
│  └─ reference-projects.md  prior art: what exists, what we borrow, what we build
├─ reports/
│  ├─ final-report.md        the graded report (skeleton — fill it in)
│  ├─ progress-update.md     template for supervisor check-ins
│  └─ figures/               figures + their sources
├─ presentations/            slide deck plan and exports
├─ src/                      source code
├─ data/                     small, shareable data only (see data/README.md)
├─ deliverables/             frozen artefacts actually handed over
├─ references/               bibliography
└─ scripts/                  contribution-report generator
```

---

## 4. New member: five-minute setup

```powershell
git config --global user.name  "<Your Name>"
git config --global user.email "<email tied to your GitHub account>"

git clone https://github.com/changxufeng66/7220_Group12.git
cd 7220_Group12
git switch -c docs/team-<yourname>          # never work directly on main
```

Read [`CONTRIBUTING.md`](CONTRIBUTING.md), then open
[`docs/03-handover-log.md`](docs/03-handover-log.md) to see what is unclaimed.

> If the clone prompts for credentials, choose **Sign in with your browser**.

---

## 5. How we work — four rules

1. **`main` is always presentable.** Everything arrives by pull request, reviewed by one other
   person. A supervisor may open this repository at any time; `main` should never be broken.
2. **Claim before you build.** Add a row to [`docs/03-handover-log.md`](docs/03-handover-log.md)
   before starting, and update it when you stop. Two people on one task is the most expensive
   mistake available to a group of seven.
3. **Write so the next person can continue without asking you.** Every handover states what is
   done, what is not, and where it breaks.
4. **Documentation is in English.** The supervisor reads it. Commit messages and PRs: English.
   Team chat can be in any language.

---

## 6. Where the graded deliverables live

| Deliverable | Location | Owner | Status |
|---|---|---|---|
| Final report (PDF) | `deliverables/` ← built from [`reports/final-report.md`](reports/final-report.md) | `<Name>` | ⚪ not started |
| Presentation (PDF) | `deliverables/` ← built from [`presentations/`](presentations/) | `<Name>` | ⚪ not started |
| Working demo / code | `src/` | `<Name>` | ⚪ not started |
| Division of labour | Appendix A of the report, generated by `scripts/contribution-report.cmd` | `<Name>` | ⚪ not started |

The pre-submission checklist is in [`docs/06-submission.md`](docs/06-submission.md).
Do not hand anything over before that checklist passes.

---

## 7. Timeline

Milestones, dependencies and supervisor checkpoints: [`docs/02-plan.md`](docs/02-plan.md).

| Milestone | Due | Exit criterion |
|---|---|---|
| M0 Kickoff | `<date>` | Brief agreed, roles assigned, repo set up |
| M1 Proposal | `<date>` | Supervisor signs off on scope |
| M2 Midpoint | `<date>` | Core pipeline runs end to end on real data |
| M3 Report draft | `<date>` | Full draft, all sections present, figures finalised |
| M4 Submission | `<date>` | Checklist in `docs/06-submission.md` passes |

---

## 8. Documentation index

| If you need to know… | Read |
|---|---|
| What we are building and why | [`docs/00-brief.md`](docs/00-brief.md) |
| Who is responsible for what | [`docs/01-team.md`](docs/01-team.md) |
| When things are due | [`docs/02-plan.md`](docs/02-plan.md) |
| What is in progress right now | [`docs/03-handover-log.md`](docs/03-handover-log.md) |
| Why we chose X over Y | [`docs/04-decision-log.md`](docs/04-decision-log.md) |
| What was said in the last meeting | [`docs/05-meetings/`](docs/05-meetings/) |
| How to branch, commit and review | [`CONTRIBUTING.md`](CONTRIBUTING.md) |
| What prior art exists and what we borrow | [`docs/reference-projects.md`](docs/reference-projects.md) |
| How to submit to the supervisor | [`docs/06-submission.md`](docs/06-submission.md) |
