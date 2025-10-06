# LaTeX-templates

Reusable LaTeX **classes** and **styles** for papers, slides, teaching slides, referee reports, and problem sets.  
Designed for **Overleaf → Add file → From external URL** so every project pulls from a single source of truth.

---

## Repository layout

```
LaTeX-templates/
├─ README.md
├─ LICENSE
├─ styles/                      # .sty files (shared or style-specific)
│  ├─ shared.sty               # universal math/macros/packages used everywhere
│  ├─ bib-natbib.sty           # natbib config (semicolon, round, sectionbib)
│  ├─ beamerthemeCommon.sty    # beamer theme (colors/layout/section frames)
│  └─ teaching-math.sty        # teaching/pset extras (convergence, distro names, etc.)
├─ classes/                     # .cls files — one per template
│  ├─ slides.cls
│  ├─ teaching-slides.cls
│  ├─ draft.cls
│  ├─ referee-report.cls
│  └─ pset.cls
└─ templates/                   # (to be added later)
   ├─ slides/main.tex
   ├─ teaching-slides/main.tex
   ├─ draft/main.tex
   ├─ referee-report/main.tex
   └─ pset/main.tex
```

---

## What goes where

- **`styles/shared.sty` (universal)** — core math & helpers used everywhere:
  - Packages: `amsmath`, `amssymb`, `mathtools`, `amsthm`, `booktabs`, `graphicx`, `xcolor`, `microtype`.
  - Operators/macros: `\E`, `\Var`, `\Cov`, `\Prob`, `\argmin`, `\argmax`, independence symbol `\indep`, conveniences like `\Ybar`, `\betast`; paired delimiters (`\abs{}`, `\norm{}`) if desired.
  - **Do not** load `hyperref` here (beamer handles it); load it only in article-like classes.
- **`styles/bib-natbib.sty`** — natbib setup (e.g., `semicolon, round, sectionbib`), `\bibpunct`, citation commands. Load from `draft.cls` and `referee-report.cls`.
- **`styles/beamerthemeCommon.sty`** — beamer look-and-feel (theme choice, colors, fonts, item spacing, section frames, footers) for both `slides.cls` and `teaching-slides.cls`.
- **`styles/teaching-math.sty`** — teaching/pset extras you *don’t* want in articles: convergence arrows (`\covprob`, `\covdist`), i.i.d./independence shorthands (`\simiid`, `\simind`), distribution names (`\Bin`, `\Normal`, `\Poisson`, `\Uniform`, `\GammaDist`, `\ExpDist`), `\numberthis`, etc.
- **Classes** control context-specific stuff:
  - `slides.cls` — `\LoadClass{beamer}`, load `styles/shared.sty` + `styles/beamerthemeCommon.sty`; add slide extras (`tikz`, `pgfplots`, notes via `pgfpages`, etc.).
  - `teaching-slides.cls` — like `slides.cls`, plus teaching tweaks (larger frametitles, example blocks).
  - `draft.cls` — `\LoadClass{article}` (e.g., 11pt), margins via `geometry`, spacing via `setspace`, section formatting if desired; load `hyperref` + `styles/bib-natbib.sty`.
  - `referee-report.cls` — `article` with 11pt, 1in margins, tight lists (`enumitem`), `hyperref` + `styles/bib-natbib.sty`.
  - `pset.cls` — `article` (often 12pt), 1in margins; load `styles/shared.sty` **and** `styles/teaching-math.sty`; define theorem/remark/hint environments.

> If you use a paper-only environment (e.g., an *Executive Summary*), keep it inside `draft.cls` or a `styles/draft-extras.sty` that `draft.cls` loads.

---

## Using with Overleaf

1. In your Overleaf project, go to **Add file → From external URL**.
2. Add the **raw GitHub URLs** for the files that project needs. Examples (replace `<USER>` if needed):
   - Slides:
     - `https://raw.githubusercontent.com/louisheizlsperger/LaTeX-templates/main/classes/slides.cls`
     - `https://raw.githubusercontent.com/louisheizlsperger/LaTeX-templates/main/styles/shared.sty`
     - `https://raw.githubusercontent.com/louisheizlsperger/LaTeX-templates/main/styles/beamerthemeCommon.sty`
   - Teaching slides:
     - `classes/teaching-slides.cls`, `styles/shared.sty`, `styles/beamerthemeCommon.sty` (+ `styles/teaching-math.sty` if needed)
   - Draft/paper:
     - `classes/draft.cls`, `styles/shared.sty`, `styles/bib-natbib.sty`
   - Referee report:
     - `classes/referee-report.cls`, `styles/shared.sty`, `styles/bib-natbib.sty`
   - Problem set:
     - `classes/pset.cls`, `styles/shared.sty`, `styles/teaching-math.sty`
3. In `main.tex`, select a class, e.g.:
   ```tex
   \documentclass{slides} % or teaching-slides / draft / referee-report / pset
   ```
4. When you update the repo, in Overleaf’s file tree click the **link/chain icon → Refresh** next to each linked file to pull the latest version.

**Pin to versions:** For stability, link to a **tag or commit** raw URL instead of `main`. Update intentionally later.


