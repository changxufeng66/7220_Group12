# Reference Projects and Prior Art

What already exists, what is worth borrowing, and what must be built by us.

> **Why this file exists.** IDAT7215 awards 40% for *quality and quantity of implementation* and
> states that work must be our own: any open-source code must be clearly identified, part by
> part. So references are for **architecture and ideas** — never for pasted code. Every source
> below is cited in `references/references.bib` and appears in the report's reference list.

---

## 1. Shortlist

| # | Project | Stack | Why it matters to us | Verdict |
|---|---|---|---|---|
| R1 | [iamksen / Pet-Recommendation-System](https://github.com/iamksen/Pet-Recommendation-System) | CLIPS (4 files, ~43 KB) | **Closest match in the world**: a rule-based expert system that recommends a pet from user preferences. Same task, same reasoning pattern. | **Primary reference** — reason from its design, do not port its text |
| R2 | [Kuzon1952 / pet-expert-system-bangladesh](https://github.com/Kuzon1952/pet-expert-system-bangladesh) | CLIPS, MIT | Binary decision tree, 4 levels, 15 nodes → 16 recommendations. Shows how small a *complete* knowledge base can be, and how to document it. | Secondary — good KB-documentation model |
| R3 | [fk2871564 / Pet-Care-Expert-System](https://github.com/fk2871564-FahadKhan/Pet-Care-Expert-System) | **Python**, single module | Rule-based, 20+ rules, **certainty factors**, and an explanation of each diagnosis. The Python-shaped version of what we need. | Secondary — CF + explanation pattern |
| R4 | [qjwmelody / Pet-Dog-Recommendation-Expert-System](https://github.com/qjwmelody/Pet-Dog-Recommendation-Expert-System) | MATLAB, course project | Course-project framing of the same problem; useful for how the *report* was structured (intro → KB → results). | Context only — not technically reusable |
| R5 | [sprmorn / DesktopPet-Miao](https://github.com/sprmorn/DesktopPet-Miao) | Python | Transparent, frameless, always-on-top desktop pet with sprite animation — the frontend half of our project. | Frontend reference |
| R6 | [IvenKooLab / desktop-pet](https://github.com/IvenKooLab/desktop-pet) | Python, cross-platform | Same idea, different platform handling; useful for the mac/Windows differences. | Frontend reference |
| R7 | [Experta](https://experta.readthedocs.io/) · [clipspy](https://clipspy.readthedocs.io/) | Python bindings | Mature inference engines we could call instead of writing our own. | **Decision needed** — see §5 |

**R1 is the one to read first.** It answers the question "what does a pet-recommendation expert
system actually look like when it is finished", and it does so in about 300 lines of rules.

---

## 2. How R1 works (the pattern worth copying)

R1 has three kinds of working-memory facts and three families of rules.

**Facts**

```clips
(state question)                          ; the controller: start → question → suggest → terminated
(asked budget)                            ; has this question been asked already?
(preference (property budget) (symbolValue m))   ; the user's answer, as a fact
(pet (name parrot) (budget s) (space m) (time l) (family b) (clade p) (lifespan vl) (color g))
```

**Rule families**, repeated once per attribute (budget, space, time, family, clade, lifespan, colour):

| Family | Fires when | Does |
|---|---|---|
| `Get-<Attr>` | `(state question)` and not `(asked <attr>)` | Prints the question, reads the answer, asserts `(preference …)` and `(asked <attr>)` |
| `process-<Attr>` | a `(preference …)` fact exists | **Retracts every `(pet …)` fact whose attribute contradicts the preference** |
| `check-after-<Attr>` | the attribute has been processed | Asserts `(check-remaining)`, sets a "checked" marker |

**Control**

- `salience` orders the questions (budget 92 → space 80 → time 68 → family 57 → clade 51 → lifespan 45 → colour 39 → `out-of-questions` 6).
- The candidate set is literally *all remaining `(pet …)` facts*. Each answer deletes the
  non-matching ones. When one candidate remains (`one-option-or-less`, salience 98), it suggests it.
- Rejection is handled by retracting the suggested `pet` fact and returning to `(state question)` —
  so the system can offer an alternative without restarting.
- "Don't know" (`dn`) is a first-class answer: it simply skips the filtering rule, which is why
  the knowledge base does not need a rule for every possible combination.

**Why this matters for the report.** This is a textbook forward-chaining system with conflict
resolution (salience), a monotonic working memory, and a re-entrant control loop. Naming those
three ideas explicitly in §2.3 — and pointing at this reference — is a much stronger report than
"we used a lot of if-statements".

---

## 3. What we should implement ourselves (and why it earns marks)

The marking scheme rewards *our* implementation. A defensible split:

| Layer | Ours | Third-party | Why |
|---|---|---|---|
| Knowledge base (animal/breed attributes, user traits, rules) | ✅ 100% | — | This is the domain contribution; it is what makes it an expert system rather than a form |
| Inference engine (forward chaining, salience, agenda) | ✅ | — | ~200 lines. Writing it is the difference between "used a library" and "built an expert system" |
| Explanation facility ("why this pet", "why ask this") | ✅ | — | `Why` / `How` trace of fired rules; strongest single demo feature |
| Certainty factors / weighted scoring | ✅ | — | Partial matches matter: "short on space but otherwise ideal" should still be recommendable |
| Desktop pet window (transparency, animation, drag) | ✅ glue only | PyQt6 / Tkinter | Frameworks are fine; declare them |
| Expert-system library (Experta / clipspy) | ⚠️ | optional | See §5 |

Everything borrowed gets a line in **Appendix: third-party code**, as the guideline requires.

---

## 4. Python sketch of the engine

Not the final design — a shape to argue about in week 1.

```python
# engine.py — ~150 lines, ours
@dataclass
class Rule:
    name: str
    salience: int
    when: Callable[[WorkingMemory], bool]
    then: Callable[[WorkingMemory], None]

class Engine:
    def __init__(self, rules, trace=False): ...
    def run(self, wm):
        while True:
            agenda = [r for r in self.rules if r.when(wm) and r.name not in wm.fired]
            if not agenda:
                break
            rule = max(agenda, key=lambda r: r.salience)   # conflict resolution
            rule.then(wm)
            wm.fired.add(rule.name)
            if self.trace:
                wm.trace.append((rule.name, copy(wm.facts)))  # explanation facility
```

```python
# knowledge_base.yaml — ours, editable without touching code
questions:
  - id: budget
    text: "What is your monthly pet budget?"
    options: {low: "< HK$300", medium: "HK$300-800", high: "> HK$800"}
rules:
  - id: budget_filter
    salience: 87
    when: "preference.budget in ('low','medium','high')"
    then: "keep(candidate.budget == preference.budget)"
```

Keeping the knowledge base in data (YAML/JSON) rather than in `if` chains is the single design
choice that makes the system look like an expert system to an examiner, and it makes the
"manipulate results via tuning parameters" discussion in §3 of the report possible.

---

## 5. Decision to make: our engine or a library?

| | Write our own engine | Use Experta / clipspy |
|---|---|---|
| Marks under "quality of implementation" | Safer — the reasoning is visibly ours | Defensible only if we also add a substantial layer on top |
| Time to first working demo | Slower (~2–3 days) | Very fast |
| Risk | Engine bugs late in the schedule | Reader may ask "what exactly did you build?" |
| Recommendation | **Write it.** Wrap it in a thin `kb.py` so the rules stay separate. | Use only as a cross-check of our output on the same inputs |

If we do use one, the report must say exactly which modules it covers — that is the difference
between using a library and being accused of presenting one.

---

## 6. Desktop pet (frontend) notes

- Windows: a frameless, `WA_TranslucentBackground` window (PyQt6) or `-transparentcolor`
  (Tkinter) plus a sprite/GIF loop; always-on-top; draggable; tray icon to quit.
- The pet must be **driven by the expert system**, not decorative: it reacts to the dialogue
  state (asking, thinking, recommending). That coupling is the project's novelty and should be
  the first thing in the demo.
- Both R5 and R6 are Python and small enough to read in an hour. Take the windowing technique,
  not the artwork.

---

## 7. Sources for the reference list (IEEE)

```bibtex
@misc{petreco2016,
  author       = {{Ksenia}},
  title        = {{Pet Recommendation System: A CLIPS Expert System}},
  howpublished = {\url{https://github.com/iamksen/Pet-Recommendation-System}},
  year         = {2016},
  note         = {Accessed: 2026-11-10}
}

@misc{clips,
  author       = {{NASA Johnson Space Center}},
  title        = {{CLIPS: A Tool for Building Expert Systems}},
  howpublished = {\url{https://www.clipsrules.net/}},
  note         = {Accessed: 2026-11-10}
}

@book{giarratano2005,
  author    = {Giarratano, Joseph C. and Riley, Gary D.},
  title     = {Expert Systems: Principles and Programming},
  edition   = {4th},
  publisher = {Thomson Course Technology},
  year      = {2005}
}

@online{experta,
  author       = {{Nekmo}},
  title        = {{Experta: Expert Systems for Python}},
  howpublished = {\url{https://experta.readthedocs.io/}},
  note         = {Accessed: 2026-11-10}
}
```

Anything we actually rely on goes in `references/references.bib`; this list is a starting point,
not a substitute for reading them.
