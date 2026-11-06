# Source Code

Everything needed to reproduce the results in the report. The test of this directory: someone
who has never seen the project can clone, follow this file, and get the same numbers.

| | |
|---|---|
| **Language / stack** | `<Python 3.11 / Node 20 / …>` |
| **Entry point** | `<e.g. python -m model.train --config configs/transformer.yaml>` |
| **Full run time** | `<e.g. ~45 min on one GPU>` |
| **Outputs** | `<e.g. results/metrics.csv, reports/figures/fig07-*.pdf>` |
| **Owner** | `<Name>` (technical lead) |

---

## 1. Layout

```
src/
├─ README.md            ← this file
├─ pipeline/            data loading, cleaning, feature building
├─ model/               training, inference
├─ eval/                metrics, ablations, figure generation
└─ configs/             one YAML per experiment; no magic numbers in code
```

Keep new modules inside the workstream directories. If a file is used by two workstreams, it
belongs in a shared module with an owner named in `docs/01-team.md`.

## 2. Setup

```powershell
git clone https://github.com/changxufeng66/7220_Group12.git
cd 7220_Group12/src

python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

Environment variables (never commit real values):

```
DATA_DIR=<path to the raw data, outside this repository>
```

Document each variable here as it is introduced. A missing variable must fail loudly with a
message that says what to set — not a `KeyError` forty lines later.

## 3. Reproduce the reported results

```powershell
# 1. data preparation — writes to $DATA_DIR/processed
python -m pipeline.build --config configs/base.yaml

# 2. training
python -m model.train --config configs/transformer.yaml

# 3. evaluation + figures
python -m eval.report --config configs/transformer.yaml
```

Expected: `<metrics.csv with the numbers in report §6.2>`, `<figures in reports/figures/>`.

If these commands do not work from a clean clone, that is a bug of the same severity as a wrong
number — open an issue and fix `README` in the same PR.

## 4. Conventions

- **Config over code.** Experiment settings live in `configs/`; a reviewer must be able to see
  what produced a result without reading the diff.
- **No notebooks as the only implementation.** A notebook may explore; anything the report
  depends on is a module with a command to run it.
- **Deterministic where possible.** Set seeds, log them, and state the variance in the report.
- **Sort out data paths early.** Absolute personal paths in code (`C:\Users\...`) are the single
  most common reason a "reproducible" project is not.
- **Comments explain why.** The code already says what.
- **No secrets, ever.** Read them from the environment; add the pattern to `.gitignore`.

## 5. Tests

```powershell
pytest -q
```

A small suite is enough, but it must cover the parts the report's claims rest on: metric
definitions, the split logic, and the data schema. A test that checks a number was printed is
not a test.

## 6. Data

Raw data is **not** in this repository — see [`../data/README.md`](../data/README.md) for
location, licence and provenance.
