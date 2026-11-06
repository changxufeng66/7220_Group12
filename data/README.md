# Data

Raw data does not belong in git. This directory holds only what is small enough, and safe
enough, to be shared: schema files, small samples, and the record of where the real data lives.

## 1. Policy

| Rule | Why |
|---|---|
| No raw data over ~10 MB in the repository | Repository size; and git never forgets |
| No personal, identifiable or confidential data | Irreversible once pushed; unethical and possibly unlawful |
| No data whose licence forbids redistribution | The repository may be public |
| Every dataset has a provenance row in §2 | A reviewer must be able to obtain it |
| Large files → shared drive / GitHub Release, linked here | See `docs/06-submission.md` §3 |

If you need to commit a sample, it must be **synthetic or irreversibly anonymised**, and its
README entry must say which.

## 2. Provenance

| Dataset | Source | Licence / permission | Location | Size | Owner |
|---|---|---|---|---|---|
| `<name>` | `<URL or "provided by supervisor">` | `<...>` | `<path outside repo, or link>` | `<...>` | `<Name>` |
| `<name>` | `<...>` | `<...>` | `<...>` | `<...>` | `<Name>` |

## 3. Structure

```
data/
├─ README.md            ← this file
├─ schema.md            ← field definitions, types, allowed values
└─ samples/             ← ≤ 100 rows, synthetic or anonymised, for tests only
```

`samples/` exists so that tests and the pipeline can run without the real dataset. Keep it
small and keep it obviously fake.
