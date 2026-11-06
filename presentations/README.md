# Presentation

The deck is judged as part of the project. It is not a summary of the report read aloud.

| | |
|---|---|
| **Length** | `<N>` minutes + `<N>` minutes questions |
| **Slides** | `<10–12>` |
| **Format** | 16:9 PDF, fonts embedded, exported to `deliverables/` |
| **Owner** | `<Name>` |
| **Rehearsals** | `<date>`, `<date>`, full run on the real demo machine |

---

## 1. Slide plan

Adapt the count, keep the arc: problem → approach → evidence → what it means.

| # | Slide | Content | Speaker | Time |
|---|---|---|---|---|
| 1 | Title | Project, group, course, date | `<Name>` | 0:20 |
| 2 | The problem | One concrete situation, not an abstraction | `<Name>` | 1:00 |
| 3 | Why it is hard | What existing approaches miss (1 figure) | `<Name>` | 1:00 |
| 4 | What we built | One diagram, end to end | `<Name>` | 1:30 |
| 5 | How it works | The single most interesting component | `<Name>` | 1:30 |
| 6 | Evaluation setup | Data, metrics, baselines — one slide | `<Name>` | 1:00 |
| 7 | Results | Main table or chart, one headline number | `<Name>` | 1:30 |
| 8 | What surprised us | Ablation or error analysis | `<Name>` | 1:00 |
| 9 | Limitations | Honest, two bullets | `<Name>` | 0:40 |
| 10 | Conclusion | Contribution in one sentence + future work | `<Name>` | 0:40 |
| 11 | Demo / appendix | Optional live demo or backup slides | `<Name>` | — |

## 2. Rules that survive contact with a projector

- **One idea per slide.** If you need "and", it is two slides.
- **No slide over ~40 words.** The audience reads faster than you speak; compete with the slide
  and you lose.
- **Every number on a slide is traceable** to the report. If asked "where does that come from?",
  the answer is a section number.
- **Backup slides** after the conclusion: extra results, the pipeline detail, the metric
  definition. These absorb questions without derailing the main deck.
- **Demo or it did not happen** — but never demo live without a recorded fallback. Screen
  recording as slide 11 saves the presentation when the network dies.

## 3. Rehearsal checklist

- [ ] Full run with a timer, twice, on different days
- [ ] Every speaker says their part without reading from the slide
- [ ] Handover between speakers is a sentence, not a silence
- [ ] Questions: each member prepared for the two most likely questions in their area
- [ ] Exported PDF checked on a machine that is not yours
- [ ] Demo tested on the machine and network that will be used
- [ ] Backup: recording, screenshots, and a copy of the data locally

## 4. Files

| File | Purpose |
|---|---|
| `deck.pdf` | Export handed over (also copied to `deliverables/`) |
| `notes/` | Speaker notes, if kept separately |
| `demo-script.md` | Exact steps for the live demo, in order, with expected output |
