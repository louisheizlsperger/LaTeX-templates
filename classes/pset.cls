\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pset}[2025/10/05 v0.2 Problem set class]

% Pass unknown options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Base class
\LoadClass[12pt]{article}

% Shared macros
\RequirePackage{shared}

% Page layout
\RequirePackage[margin=1in]{geometry}
\RequirePackage{enumitem}

% Hyperlinks (useful for cross-references)
\RequirePackage[hidelinks]{hyperref}

% Equations numbered by section (optional)
\numberwithin{equation}{section}

% Question/Solution helpers
\newcounter{question}
\newcommand{\question}[1][]{%
  \refstepcounter{question}%
  \par\medskip\noindent\textbf{Question \thequestion.##1}\par\smallskip}

\newenvironment{solution}{%
  \par\smallskip\noindent\textit{Solution.}\ }{\par\medskip}
