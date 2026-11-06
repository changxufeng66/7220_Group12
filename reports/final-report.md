# Final Report — `<Project Title>`

<!--
HOW TO USE THIS FILE
- This is the working master. Write here; export to PDF only at freeze time (docs/06-submission.md §2).
- Every section below carries a note in this comment style saying what belongs in it. Delete the
  notes as you fill the section.
- Target length: <N> pages excluding references and appendices — confirm with the course handout.
- One author per section, named in the section heading comment. A section without an owner does
  not get written.
- Voice: third person plural ("we"), past tense for what was done, present tense for what is true.
- Do not leave "TBD" in a submitted draft. If something is unknown, say what is unknown.
-->

**Group 12** · `<7220 — Course Title>` · The University of Hong Kong
**Supervisor:** `<Professor Name>` · `<Semester, Year>`
**Members:** `<Name (ID)>, <Name (ID)>, …` — seven members, see Appendix A

---

## Abstract

<!-- 150–250 words. Problem, approach, headline result, significance. Written LAST.
     No citations, no undefined abbreviations, no "this report will discuss". -->

`<...>`

**Keywords:** `<...>`, `<...>`, `<...>`

---

## 1. Introduction

<!-- Owner: <Name>
     1.1 Context — why anyone outside the course should care (2–3 paragraphs, cited)
     1.2 Problem — the specific gap, stated sharply
     1.3 Contributions — 3–4 bullets: what is new here, in claim form
     1.4 Report structure — one short paragraph -->

### 1.1 Context

`<...>`

### 1.2 Problem statement

`<...>`

### 1.3 Contributions

- `<We build ...>`
- `<We evaluate ... and find ...>`
- `<We release ...>`

### 1.4 Structure of this report

`<§2 reviews ..., §3 defines ..., §4 describes ..., §5 ..., §6 reports ..., §7 discusses ...>`

---

## 2. Background and Related Work

<!-- Owner: <Name>
     Group prior work by approach, not by paper. End each group with what it does not solve.
     This section earns the right to your method. 1.5–3 pages. -->

### 2.1 `<Theme A>`

`<...>`

### 2.2 `<Theme B>`

`<...>`

### 2.3 Gap this project addresses

`<Two or three sentences connecting 2.1–2.2 to §1.2. This is the hinge of the report.>`

---

## 3. Problem Definition and Requirements

<!-- Owner: <Name>
     Formalise the task: inputs, outputs, constraints, success metrics. A reader should be able
     to reimplement the evaluation from this section alone. -->

### 3.1 Task definition

`<...>`

### 3.2 Data

| Property | Value |
|---|---|
| Source | `<...>` |
| Size | `<rows / instances>` |
| Licence | `<...>` |
| Preprocessing | `<...>` |
| Splits | `<train / dev / test sizes>` |

### 3.3 Evaluation metrics

`<Define each metric and say why it is the right one for this task. State the protocol:
how many runs, what is averaged, what counts as a tie.>`

### 3.4 Requirements

| ID | Requirement | Priority | Met? |
|---|---|---|---|
| R1 | `<...>` | must | `<✅/❌>` |
| R2 | `<...>` | should | `<...>` |

---

## 4. Method and System Design

<!-- Owner: <Name>
     The core of the report. Fig 1 (system overview) belongs here and is referenced in §4.1.
     Cite docs/04-decision-log.md entries where a choice was contested. -->

### 4.1 Overview

`<Figure 1: block diagram. Then one paragraph describing the pipeline end to end.>`

### 4.2 `<Component 1>`

`<...>`

### 4.3 `<Component 2>`

`<...>`

### 4.4 Design decisions and trade-offs

`<Bullet list, each with the alternative rejected and why. Cross-reference the decision log.>`

---

## 5. Implementation

<!-- Owner: <Name>
     Only what a reader needs to reproduce: stack, structure, environment, runtime, and the
     non-obvious difficulties that cost time. Do not paste code. -->

| | |
|---|---|
| Language / stack | `<...>` |
| Repository layout | `src/` — see `src/README.md` |
| Environment | `<Python 3.x, package list in requirements.txt>` |
| Hardware | `<...>` |
| Runtime | `<full pipeline: ~N min>` |

**Difficulties worth recording:** `<e.g. the export format changed mid-project; the library
version pinned for X reason>`

---

## 6. Evaluation

<!-- Owner: <Name>
     Results first, interpretation in §7. Every number here must come from the tagged code.
     Include what did not work — that is a result. -->

### 6.1 Experimental setup

`<Baselines, hyperparameters, hardware, number of runs, how variance is reported.>`

### 6.2 Main results

| Method | `<Metric 1>` | `<Metric 2>` | Notes |
|---|---|---|---|
| Baseline | `<...>` | `<...>` | `<...>` |
| `<Ours>` | `<...>` | `<...>` | `<...>` |

`<One paragraph: what the table shows, and what it does not.>`

### 6.3 Ablation

`<Which components matter. If an ablation was impossible, say why — that is a limitation for §7.>`

### 6.4 Error analysis

`<Where the method fails, with two or three concrete examples. This section is usually what
distinguishes a good report from an average one.>`

### 6.5 Threats to validity

`<Data leakage? Small sample? Single seed? Annotator bias? Be specific and brief.>`

---

## 7. Discussion and Limitations

<!-- Owner: <Name> -->

### 7.1 What the results mean

`<...>`

### 7.2 Limitations

- `<...>`
- `<...>`

### 7.3 What we would do differently

`<Honest, specific, one paragraph. Supervisors value this.>`

---

## 8. Conclusion and Future Work

<!-- Owner: <Name>
     Restate the contribution and the evidence for it. No new claims, no new citations. -->

`<...>`

---

## References

<!-- Managed via references/references.bib. Cite in text as [1], [2] … or author-year,
     whichever the course prefers. Every entry here must be cited in the text. -->

---

## Appendix A — Division of Labour

<!-- Owner: <Name>, reviewed by every member.
     Prose, not a commit-count table. For each member: workstream, what they built or wrote,
     what they reviewed, what they struggled with. Generated data lives in
     docs/contribution-summary.md — summarise it, do not paste it. -->

| Member | Role | Contribution |
|---|---|---|
| `<Name>` | `<role>` | `<...>` |
| `<Name>` | `<role>` | `<...>` |

`<One or two paragraphs on how the team worked: cadence, how conflicts were resolved, what the
handover log shows about continuity.>`

## Appendix B — Reproducibility

```bash
<exact commands from a clean clone>
```

Expected output: `<...>`. Runtime: `<...>` on `<hardware>`.

## Appendix C — AI-Use Declaration

`<Follow the course policy exactly. State: which tools, for which parts of the work (e.g.
language editing, code scaffolding, literature search), and what was verified by the team.
If the course requires no declaration, write "Not required by course policy.">`
