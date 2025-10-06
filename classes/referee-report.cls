\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{referee-report}[2025/10/05 v0.2 Referee report class]

% Pass unknown options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Base class
\LoadClass[11pt]{article}

% Shared macros
\RequirePackage{shared}

% Layout
\RequirePackage[margin=1in]{geometry}
\RequirePackage{enumitem}
\setlist{noitemsep,topsep=0.5\baselineskip}

% Hyperlinks and references
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}

% Bibliography (natbib)
\RequirePackage{bib-natbib}

% Optional: slightly tighter line spacing without full double
% \RequirePackage{setspace}
% \onehalfspacing

% A simple comment environment with automatic numbering
\newcounter{refc}
\newenvironment{refcomment}{%
  \par\refstepcounter{refc}\noindent\textbf{Comment~\therefc.}\ }{\par}
