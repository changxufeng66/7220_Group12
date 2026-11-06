# References

Bibliography for the report. Managed as BibTeX so that the reference list is generated, not
hand-typed — hand-typed lists contain errors, and errors in references are the easiest marks
to lose.

## Workflow

1. Add the entry to [`references.bib`](references.bib) (export from Google Scholar / IEEE /
   ACM "Cite → BibTeX", then tidy it).
2. Cite it in `reports/final-report.md` as `[@key]` (Pandoc) or `\cite{key}` (LaTeX).
3. Every entry in the `.bib` file must be cited in the text. Every citation must resolve.

## Rules

- **Primary sources.** Cite the paper, not a blog post about the paper. If you must cite a blog,
  say why in a footnote.
- **Version and access date** for software, datasets and web pages: `@misc` with `note = {Accessed: YYYY-MM-DD}`.
- **Consistent style** — pick one (APA / IEEE / ACM) per the course handout and keep it.
- **No padding.** Ten sources you read beat forty you skimmed; a supervisor can tell which is which.

## Suggested split

| Area | Expect |
|---|---|
| Problem framing | 3–5 sources establishing the gap exists |
| Method | 4–8 sources the method builds on |
| Baselines / metrics | 3–4 sources defining what you compare against |
| Data | 1–2 sources plus your own provenance entries in `../data/README.md` |
