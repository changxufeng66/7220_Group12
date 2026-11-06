# Deliverables

Frozen artefacts — exactly what was handed to the supervisor. Nothing here is edited after
submission; the git tag fixes the repository state, and this directory fixes the files.

## 1. Naming

```
G12-7220-<what>-<YYYY-MM-DD>.<ext>
```

| Example | Contents |
|---|---|
| `G12-7220-final-report-2026-12-05.pdf` | The graded report |
| `G12-7220-slides-2026-12-05.pdf` | Presentation deck |
| `G12-7220-demo-recording-2026-12-05.mp4` | Backup recording of the demo (external link if > 50 MB) |

## 2. What goes here

- The exported report PDF, produced from `reports/final-report.md` at freeze time
- The exported slide deck
- Any form, cover sheet or declaration the course requires
- `SUBMISSION.md` — the record described in §4

Not here: source files, drafts, working notes. Those stay in `reports/` and `docs/`, so this
directory stays small enough to inspect in a minute.

## 3. Freeze procedure

```powershell
# 1. confirm the work is what you intend to submit
git switch main && git pull && git status

# 2. export the report and slides into this directory, with the naming above

# 3. commit the exports and tag
git add deliverables/
git commit -m "chore(deliverables): freeze final submission"
git tag -a v1.0-final -m "Final submission, <YYYY-MM-DD>"
git push origin main --tags
```

Then publish the Release (see [`../docs/06-submission.md`](../docs/06-submission.md) §2).

## 4. `SUBMISSION.md`

Fill this in at the moment of submission — it is the answer to "what exactly did we send, and
when".

```markdown
# Submission record

- Submitted: <YYYY-MM-DD HH:MM timezone>
- To: <Professor Name> <email>
- By: <Name>
- Method: email / Moodle / GitHub Release URL
- Tag: v1.0-final (<commit sha>)
- Files sent: <list>
- Receipt / confirmation: <screenshot filename or URL>
- Notes: <e.g. "report only; code available at the repository link">
```
