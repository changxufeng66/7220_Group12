# Figures

Figures for the report and the slides. One figure, one file, one source.

## Rules

1. **Vector first.** Export PDF or SVG. PNG only for raster sources (screenshots, photos), at
   ≥ 300 dpi and never wider than the report's text block.
2. **Name for the figure, not the date.** `fig03-ablation-macro-f1.pdf`, not `figure_final_v2.pdf`.
   Report numbering (`Figure 3`) is applied in the report, not in the filename.
3. **Keep the source.** The script or notebook that produced the figure lives next to it
   (`fig03-ablation-macro-f1.py`), so a reviewer can regenerate it. A figure nobody can
   reproduce is a liability at viva time.
4. **No screenshots of tables, plots of data you cannot explain, or default matplotlib styling.**
   Axis labels, units, legend, and a readable font size (≥ 8 pt at final size).
5. **Colour-blind safe.** Do not encode meaning in red vs green alone.

## Naming

```
fig<NN>-<short-slug>.<ext>       e.g. fig01-system-overview.pdf
```

`NN` matches the order the figure appears in the report.

## Index

| Figure | File | Used in | Produced by |
|---|---|---|---|
| `<1>` | `fig01-<slug>.pdf` | report §4.1, slides 6 | `fig01-<slug>.py` |
| `<2>` | `fig02-<slug>.pdf` | report §6.2 | `<notebook>` |
