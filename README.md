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
└─ templates/                   # minimal starters (optional)
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
     - `https://raw.githubusercontent.com/<USER>/LaTeX-templates/main/classes/slides.cls`
     - `https://raw.githubusercontent.com/<USER>/LaTeX-templates/main/styles/shared.sty`
     - `https://raw.githubusercontent.com/<USER>/LaTeX-templates/main/styles/beamerthemeCommon.sty`
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

---

## Local development

```bash
# Clone (HTTPS)
git clone https://github.com/<USER>/LaTeX-templates.git
cd LaTeX-templates

# Or clone (SSH) if you’ve set up keys
git clone git@github.com:<USER>/LaTeX-templates.git
cd LaTeX-templates

# Create folders and start adding files
mkdir -p styles classes templates/{slides,teaching-slides,draft,referee-report,pset}

# After adding content
git add .
git commit -m "Initial structure with shared/class/style files"
git push origin main
```

---

## Starters (suggested content)

- **`styles/shared.sty`**
  - ```tex
    \NeedsTeXFormat{LaTeX2e}
    \ProvidesPackage{shared}[2025/10/05 v0.1 Shared preamble]
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{lmodern}
    \RequirePackage{microtype}
    \RequirePackage{amsmath,amssymb,amsthm,mathtools}
    \RequirePackage{booktabs,graphicx,xcolor}
    % operators/macros
    \DeclareMathOperator{\E}{\mathbb{E}}
    \DeclareMathOperator{\Var}{Var}
    \DeclareMathOperator{\Cov}{Cov}
    \newcommand{\Prob}{\mathbb{P}}
    \DeclareMathOperator*{\argmin}{arg\,min}
    \DeclareMathOperator*{\argmax}{arg\,max}
    \newcommand{\indep}{\perp\!\!\!\perp}
    \newcommand{\Ybar}{\overline{Y}}
    \newcommand{\betast}{\beta^{\!*}}
    % paired delimiters (optional)
    \DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
    \DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
    \typeout{shared.sty v0.1 loaded}
    ```
- **`styles/bib-natbib.sty`**
  - ```tex
    \ProvidesPackage{bib-natbib}[2025/10/05 v0.1 natbib setup]
    \RequirePackage[semicolon,round,sectionbib]{natbib}
    % \bibpunct{(}{)}{;}{a}{,}{,}
    ```
- **`styles/beamerthemeCommon.sty`**
  - ```tex
    \ProvidesPackage{beamerthemeCommon}[2025/10/05 v0.1 Beamer theme]
    % \usetheme{Madrid} % or Metropolis if available
    \definecolor{Primary}{RGB}{27,77,137}
    \setbeamercolor{structure}{fg=Primary}
    \setbeamertemplate{navigation symbols}{}
    \setbeamertemplate{caption}[numbered]
    ```
- **`styles/teaching-math.sty`**
  - ```tex
    \ProvidesPackage{teaching-math}[2025/10/05 v0.1 Teaching math extras]
    % convergence and distribution helpers
    \newcommand{\covprob}{\xrightarrow{\mathbb{P}}}
    \newcommand{\covdist}{\xrightarrow{d}}
    \newcommand{\simiid}{\stackrel{\text{iid}}{\sim}}
    \newcommand{\simind}{\stackrel{\text{ind}}{\sim}}
    \newcommand{\Bin}{\mathrm{Bin}}
    \newcommand{\Normal}{\mathcal{N}}
    \newcommand{\Poisson}{\mathrm{Pois}}
    \newcommand{\Uniform}{\mathrm{Unif}}
    \newcommand{\GammaDist}{\mathrm{\Gamma}}
    \newcommand{\ExpDist}{\mathrm{Exp}}
    \newcommand{\numberthis}{\addtocounter{equation}{1}\tag{\theequation}}
    ```
- **Minimal classes** (examples)
  - `classes/slides.cls`
    ```tex
    \NeedsTeXFormat{LaTeX2e}
    \ProvidesClass{slides}[2025/10/05 v0.1 Slides]
    \LoadClass[aspectratio=169]{beamer}
    \RequirePackage{shared}
    \RequirePackage{beamerthemeCommon}
    % slide extras (optional):
    % \RequirePackage{tikz,pgfplots,pgfpages}
    ```
  - `classes/draft.cls`
    ```tex
    \NeedsTeXFormat{LaTeX2e}
    \ProvidesClass{draft}[2025/10/05 v0.1 Draft]
    \LoadClass[11pt]{article}
    \RequirePackage{shared}
    \RequirePackage[margin=1in]{geometry}
    \RequirePackage{setspace}
    \doublespacing
    \RequirePackage{hyperref}
    \RequirePackage{bib-natbib}
    ```

---

## Overleaf build notes

- `hyperref`: beamer loads it internally — keep it out of `styles/shared.sty`; load it in article-like classes.
- If you use `minted`, enable **-shell-escape** in the Overleaf project’s settings.
- Load `tikz/pgfplots` inside slide classes to keep `main.tex` files minimal.

---

## License

Choose a license (e.g., MIT) and put it in `LICENSE`.
