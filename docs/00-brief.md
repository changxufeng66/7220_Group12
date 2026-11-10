# 00 — Project Brief

> The page the instructor can read instead of a proposal, and the page we write the report from.
> Frozen at M1 (12 November 2026); changes after that go in [`04-decision-log.md`](04-decision-log.md).

| | |
|---|---|
| **Course** | IDAT7215 Computer Programming for Product Development and Applications |
| **Institution** | The University of Hong Kong · 2026/27 Semester 1 |
| **Instructor** | `<Professor Name>` (`<email>`) |
| **Team** | Group 12 — seven members · `<class>` |
| **Project title** | Pet Recommendation Expert System with a Desktop Pet Companion |
| **Course topic** | Topic 2 — *write a Python script to develop an expert system* (25% of the subject mark) |
| **Report due** | 30 November 2026, 17:00 · presentation 19–26 November 2026 |
| **Brief version** | v0.2 · 10 November 2026 |

---

## 1. Context

Pet ownership in Hong Kong is rising while living space shrinks, and the mismatch is structural:
the traits that make an animal suitable — adult size, exercise demand, noise, grooming, lifespan,
monthly cost — are fixed at the point of purchase, whereas the household's space, budget and
daily routine are not. Advice available to a prospective owner is either generic ("dogs need
walks"), written for houses with gardens, or supplied by a seller with an interest in the sale.
The result is predictable: animals acquired on appearance rather than fit, and surrendered when
the mismatch becomes expensive.

An expert system is a natural fit because the underlying knowledge is *rule-shaped*: if the
household is out for eleven hours a day, a high-energy herding breed is unsuitable regardless of
how the animal looks. That reasoning is well-structured, explainable, and stable enough to encode.

## 2. Problem statement

Prospective owners cannot evaluate the fit between an animal's fixed traits and their own living
conditions, and no accessible tool reasons over both sides of that comparison and explains its
answer.

**In one sentence:** we build an expert system that turns a short structured interview about
space, budget, time, household and preferences into a ranked, justified shortlist of pets — and
delivers it through a desktop companion that makes the consultation feel like a conversation.

## 3. Objectives

Each objective is demonstrated or measured at the end, in the report or the demo.

| # | Objective | How we will know it is met |
|---|---|---|
| O1 | Encode a knowledge base of ≥ 60 animals/breeds across 7 decision attributes (space, budget, time, household, noise, lifespan, experience) | `src/kb/animals.yaml` passes schema validation; every attribute value carries a source in `references.bib` |
| O2 | Implement a forward-chaining inference engine that resolves the consultation in ≤ 10 questions and returns a ranked top-3 | Engine trace shows rule firings; a 20-profile test set produces a ranked list for every profile |
| O3 | Provide an explanation facility: *why* a question is asked and *why* a pet was recommended | Both explanations appear in the UI and in the engine's trace log for every test profile |
| O4 | Couple the consultation to a desktop-pet companion with ≥ 4 reactive states (idle, asking, thinking, recommending) | Live demo: the pet changes state as the dialogue advances; recording kept as fallback |
| O5 | Evaluate agreement between system ranking and expert judgement on the 20-profile test set, plus one ablation (weighted vs binary matching) | Table in report §3 with agreement rate and the ablation delta; figures exported to `reports/figures/` |

**Non-objectives** (explicitly out of scope, so nobody assumes otherwise):

- Veterinary or health diagnosis of any kind
- Real-time price, availability or adoption-listing data from external services
- Multi-user accounts, cloud sync, or a web-hosted version
- Non-English interface (the course assesses the Python implementation, not localisation)

## 4. Scope

| In scope | Out of scope |
|---|---|
| Local desktop application, Python, single user | Server deployment, accounts, database |
| Cats and dogs in depth, plus 3–4 other small-pet groups if time permits | Every species, or exhaustive breed coverage |
| Rule-based reasoning with explainable traces | Machine-learned model as the primary recommender |
| Desktop pet reacting to dialogue state | Custom illustration, voice, or animated cinematic |
| 20-profile evaluation against expert-coded labels | User study with real adopters (no ethics approval time) |

## 5. Deliverables and how they are assessed

Marks follow the guideline's four criteria — the mapping below is what we optimise for.

| Course criterion | Weight | What it means for us | Where it lives |
|---|---|---|---|
| Completeness | 20% | The three layers work together: KB → engine → pet UI, one runnable flow | `src/`, demo |
| Quality and quantity of implementation | **40%** | Our own engine, KB and explanation facility; third-party code declared line by line | `src/`, Appendix (third-party) |
| Report quality: presentation, result analysis, visualisation | **30%** | 2,000–4,000 words, IEEE references, results table, ablation, figures | `reports/final-report.md` |
| Oral presentation | 10% | 15 min + 5 min Q&A, every member present | `presentations/` |

| Artefact | Format | Location |
|---|---|---|
| Written report | PDF, A4, Times New Roman 12, single spacing, 2,000–4,000 words | `deliverables/` |
| Presentation | PDF slides, 15 minutes | `deliverables/` |
| Source code + readme | Zip; must reproduce the demo from a clean clone | `deliverables/` |

**Word limit is a hard ranking constraint:** 2,000–4,000 words excluding appendices, charts,
tables, references and individual contributions. Over +10% loses 10% of the awarded mark. Budget
roughly: §1 Introduction 500 · §2 Description 1,200 · §3 Results 1,000 · §4 Conclusion 300.

## 6. Constraints and assumptions

| Constraint | Impact on the plan |
|---|---|
| Report due 30 Nov 17:00; presentation 19–26 Nov | Demo and deck frozen 18 Nov; report written 27–29 Nov (see `02-plan.md`) |
| 40% for implementation; open-source parts must be identified | Write the inference engine ourselves; declare PyQt/Tkinter and any library use |
| Seven members, each with 300–600 word individual contribution reports | Work must be separable and attributable; handover log is the evidence |
| Python only | No JS/Electron front-end; desktop pet in PyQt6 or Tkinter |
| No external data services | KB is curated and cited by hand, not scraped at runtime |

**Assumptions** (if one breaks, the plan needs revisiting):

- Everyone can run Python 3.11+ locally on Windows or macOS
- The presentation slot is known by 15 Nov; if not, we prepare for the earliest date (19 Nov)
- `git` access and a GitHub account are available to all seven members

## 7. Risks

| Risk | Likelihood | Impact | Mitigation | Owner |
|---|---|---|---|---|
| KB curation takes longer than the build | High | High | Freeze the attribute schema on 12 Nov; breadth is the declared cut list | `<Name>` |
| Desktop pet eats time that the engine needs | Medium | High | Pet is a 200-line window, not a product; static sprite acceptable | `<Name>` |
| Presentation slot lands on 19 Nov | Medium | High | Deck and demo frozen 18 Nov regardless | `<Name>` |
| Evaluation set never gets built | Medium | High | 20 profiles written on 16 Nov, before results exist | `<Name>` |
| Report written by two people, reads like two reports | Medium | Medium | Report lead owns one voice; every section reviewed by a non-author | `<Name>` |
| A member becomes unavailable in week 3 | Low | High | Every workstream has a named backup (see `01-team.md`) | `<Name>` |

## 8. Success criteria

- **Must have** — a runnable consultation that ends in a ranked, explained recommendation, with the
  desktop pet reacting; report inside the word limit with correct IEEE references.
- **Should have** — 20-profile evaluation table; ablation; explanation for every question.
- **Nice to have** — four pet expressions; a second animal family; exportable recommendation card.

## 9. Open questions for the instructor

- [ ] Is a rule-based expert system with a hand-written inference engine acceptable as "an expert system", or is an established shell (CLIPS/Experta) expected? → **Answer:** `<...>`
- [ ] Does the 2,000–4,000 word count include figure captions and tables? (Assumed excluded.)
- [ ] Is a GitHub repository link acceptable as the code submission alongside the zip?
