# 00 — Project Brief

> This is the page the supervisor should be able to read instead of a proposal. Fill it in
> during week 1 and get sign-off before writing code. Everything else in the repository
> follows from what is written here.

| | |
|---|---|
| **Course** | `<7220 — Course Title>` |
| **Institution** | The University of Hong Kong |
| **Supervisor** | `<Professor Name>` (`<email>`) |
| **Team** | Group 12 — seven members |
| **Project title** | `<Project Title>` |
| **Term** | `<Semester, Year>` |
| **Final submission** | `<YYYY-MM-DD>` 23:59 HKT |
| **Brief version** | v0.1 (draft) · last updated `<YYYY-MM-DD>` by `<Name>` |

---

## 1. Context

`<Three to five sentences of setting. What does the world look like before our project exists?
Who has the problem? What do they do today instead? Cite two or three sources from
references/ so the framing is grounded rather than asserted.>`

## 2. Problem statement

`<One paragraph, then one sentence in bold. The bold sentence is what the report's introduction
will quote and what the supervisor will judge the project against.>`

**In one sentence:** `<...>`

## 3. Objectives

Each objective must be something we can either demonstrate or measure at the end. Avoid verbs
like "explore" or "improve" on their own.

| # | Objective | How we will know it is met |
|---|---|---|
| O1 | `<e.g. Build an end-to-end pipeline that ingests X and produces Y>` | `<runs on the full dataset within N minutes; outputs validated against a hand-checked sample>` |
| O2 | `<e.g. Achieve macro-F1 ≥ 0.80 on the held-out split>` | `<evaluation script reports it reproducibly>` |
| O3 | `<e.g. Quantify the effect of A versus B>` | `<ablation table in §6.3 of the report>` |
| O4 | `<e.g. Package the result so a non-expert can use it>` | `<documented CLI + demo walkthrough>` |

**Non-objectives** (deliberately out of scope, so nobody assumes otherwise):

- `<...>`
- `<...>`

## 4. Scope

| In scope | Out of scope |
|---|---|
| `<...>` | `<...>` |
| `<...>` | `<...>` |
| `<...>` | `<...>` |

> Changes to this table after M1 need the supervisor's agreement — record it in
> [`04-decision-log.md`](04-decision-log.md).

## 5. Deliverables and how they are assessed

Map each artefact to the assessment criteria in the course handout. If the handout is vague,
ask the supervisor and write down the answer here.

| Deliverable | Format | Where it lives | Assessment weight / criterion |
|---|---|---|---|
| Final report | PDF, `<N>` pages | `deliverables/` | `<e.g. 40% — problem framing, method, evaluation>` |
| Presentation | PDF slides, `<N>` min | `deliverables/` | `<e.g. 20% — clarity, defence>` |
| Code / demo | Reproducible repository | `src/` | `<e.g. 30% — correctness, reproducibility>` |
| Individual contribution | Appendix A of the report | `docs/contribution-summary.md` | `<e.g. 10% — evidence of contribution>` |

`<Deliberate ambiguity? e.g. "report length counted excluding references" — confirm with the
supervisor and note the answer where the team will see it.>`

## 6. Constraints and assumptions

| Constraint | Impact on the plan |
|---|---|
| `<Deadline: all deliverables due <date>>` | `<code freeze on <date>; report freeze two days earlier>` |
| `<Seven people, part-time, other courses>` | `<≈N hours/person/week; no task may depend on one person for more than a week>` |
| `<Compute: e.g. one GPU node, no cloud budget>` | `<experiments must fit in a single overnight run>` |
| `<Data: e.g. restricted licence, cannot be redistributed>` | `<raw data stays outside git; only derived samples in data/>` |
| `<Course rules on AI assistance>` | `<declared in Appendix C>` |

**Assumptions we are relying on** (if one breaks, the plan needs revisiting):

- `<...>`
- `<...>`

## 7. Risks

| Risk | Likelihood | Impact | Mitigation | Owner |
|---|---|---|---|---|
| Data access delayed | `<H/M/L>` | `<...>` | `<fallback dataset identified by <date>>` | `<Name>` |
| One member drops out | `<M>` | `<...>` | `<every area has a named backup>` | `<Name>` |
| Scope creeps past M1 | `<H>` | `<...>` | `<non-objectives list above; supervisor sign-off for changes>` | `<Name>` |
| Results weaker than hoped | `<M>` | `<...>` | `<report negative results as a finding; agree the fallback story by M3>` | `<Name>` |
| Integration week collides with other deadlines | `<H>` | `<...>` | `<integration starts at M2, not at the end>` | `<Name>` |

## 8. Success criteria

- **Must have** — `<without these the project fails its own objectives>`
- **Should have** — `<what a good grade requires>`
- **Nice to have** — `<only if time remains; name it explicitly so it is not smuggled in as scope>`

## 9. Open questions for the supervisor

Track these here until answered, then move the answer into the relevant section and strike
the question out.

- [ ] `<Question>` → **Answer:** `<...>` `<date>`
- [ ] `<Question>`
