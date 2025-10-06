\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}[2025/10/05 v0.2 Slides (beamer) class]

% Pass any unknown options through to beamer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% Base class
\LoadClass[aspectratio=169]{beamer}

% Shared macros and theme
\RequirePackage{shared}
\RequirePackage{beamerthemeCommon}

% Optional slide extras (uncomment as needed)
% \RequirePackage{tikz}
% \RequirePackage{pgfplots}
% \pgfplotsset{compat=1.18}
% \RequirePackage{pgfpages} % notes / handouts

% Keep captions numbered
\setbeamertemplate{caption}[numbered]
