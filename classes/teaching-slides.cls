\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{teaching-slides}[2025/10/05 v0.2 Teaching slides (beamer) class]

% Pass any unknown options through to beamer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% Base class
\LoadClass[aspectratio=169]{beamer}

% Shared macros and theme
\RequirePackage{shared}
\RequirePackage{beamerthemeCommon}

% Teaching-oriented tweaks
\setbeamerfont{frametitle}{series=\bfseries,size=\Large}
\setbeamerfont{title}{series=\bfseries,size=\Large}
\setbeamertemplate{blocks}[rounded][shadow=false]

% Optional classroom extras
% \RequirePackage{tikz}
% \RequirePackage{pgfplots}
% \pgfplotsset{compat=1.18}
% \RequirePackage{pgfpages} % notes mode
