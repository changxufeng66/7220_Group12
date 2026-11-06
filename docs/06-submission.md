# 06 — Getting It to the Supervisor

The project is not finished when the last commit lands. It is finished when the supervisor has
the right files, can open them, and can reproduce the result.

| | |
|---|---|
| **Submit to** | `<Professor Name>` `<email>` |
| **Deadline** | `<YYYY-MM-DD>` 23:59 HKT |
| **Submitted by** | `<Name>` (one person submits; everyone confirms) |

---

## 1. Choose the delivery route (decide by M4, not on the last day)

| Route | How | Good | Bad | Use when |
|---|---|---|---|---|
| **A. Repository access** | Settings → Collaborators → add supervisor with **Read** | Live code, full history, evidence of contribution | Requires a GitHub account; supervisor may not want access | Course expects code inspection |
| **B. Release with PDFs** | Tag + GitHub Release + PDFs attached | Works for anyone, archived, no account needed | No live code | **Default choice** |
| **C. Archive export** | Download ZIP from the tag, submit via Moodle/email | Fits a portal upload | History lost for the reader; can look like a dump | Portal requires a single file |

**Recommended:** **B + C**. Publish a Release so the exact submitted state is frozen and
inspectable, and upload the generated PDFs wherever the course expects them. Add **A** if the
course asks for the code to be reviewed.

> If the repository is private, route B's link will not open for the supervisor. Either invite
> them (route A) or attach the PDFs directly — do not send a link that 404s.

---

## 2. Freeze the submission

Do this **once**, and do not push to `main` afterwards without repeating it.

```powershell
git switch main
git pull
git status                    # must be clean
git tag -a v1.0-final -m "Final submission, <YYYY-MM-DD>"
git push origin v1.0-final
```

Then: GitHub → **Releases** → **Draft a new release** → choose `v1.0-final` → title
`Final Submission` → describe what is included → attach the PDFs from `deliverables/` → publish.

Copy the exported files into `deliverables/` with the naming convention in
[`../deliverables/README.md`](../deliverables/README.md) **before** tagging, so the tag contains
exactly what was handed over.

---

## 3. Pre-submission checklist

Nothing is submitted until every box is ticked by someone who is not the author of that item.

### Documents

- [ ] Report PDF opens, page numbers correct, headings numbered consistently
- [ ] Report has: abstract, introduction, related work, method, evaluation, discussion,
      limitations, conclusion, references, Appendix A (division of labour)
- [ ] Every figure has a caption, is referenced in the text, and is legible at 100% zoom
- [ ] Every table has units and a source
- [ ] References complete and consistently formatted; every in-text citation resolves
- [ ] Spell-check and one full read-through by someone who did not write that section
- [ ] Name, student IDs, course code and title correct on the cover
- [ ] Appendix C (AI-use declaration) matches the course policy
- [ ] Slides PDF exported; fonts embedded; no video files that will not play on the
      supervisor's machine

### Code and reproducibility

- [ ] Fresh clone + documented setup works on a machine that has never run it
- [ ] `src/README.md` gives the exact commands, expected runtime, and expected outputs
- [ ] The numbers in the report come from the code in this tag — rerun one and check
- [ ] No secrets, tokens, personal data, or supervisor's unpublished material in the repo
- [ ] No file over ~50 MB in the repository
- [ ] Dependencies pinned (`requirements.txt` / lockfile)
- [ ] Licence/attribution for third-party data or code is stated

### Repository

- [ ] `main` is clean; no stray branches with work that should have been merged
- [ ] `docs/03-handover-log.md` has no stale `in progress` rows
- [ ] `docs/contribution-summary.md` generated from the final state
- [ ] README reflects the project as it actually ended up — not the week-1 intention
- [ ] Semester, title, supervisor name, dates all correct in `README.md`

### Human

- [ ] Every member has read Appendix A and agrees it is accurate
- [ ] Every member can explain their own contribution for 2 minutes without notes
- [ ] One person has rehearsed the demo on the machine that will be used
- [ ] The submitter has the supervisor's email address right, and sends from a university
      account if the course requires it
- [ ] Submission confirmed in writing (email sent / portal receipt saved)

---

## 4. What the supervisor actually sees, in order

1. The email or portal entry — title, one-line summary, what is attached
2. `README.md` — is the project legible in 60 seconds?
3. The report PDF — does it match the README's claims?
4. `docs/02-plan.md` and `docs/03-handover-log.md` — is there evidence of process, or a
   last-minute scramble?
5. `src/` — does it run?

Write the README for step 2, not for yourselves.

---

## 5. Academic integrity

- The commit history, the handover log and Appendix A are the record of who did what. Keep them
  honest; they are also the team's protection if a contribution split is ever questioned.
- Disclose AI assistance exactly as the course requires — no more, no less. A vague declaration
  is worse than a specific one.
- Do not copy another group's code, figures or text, even "for structure". Cite anything you
  did not produce.
- If the course forbids posting coursework publicly, confirm before making the repository
  public, and take it private after the grade is released.

---

## 6. After submission

- [ ] Save the release URL and the submission receipt in the group chat.
- [ ] Do not push to `main` until the grade is returned (the tag is the record; move on to a
      branch if anything must change).
- [ ] If marks are returned with comments, store them in `docs/` — the next project will want
      them.
