\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{draft}[2025/10/05 v0.2 Draft article class]

% Pass unknown options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Base class
\LoadClass[11pt]{article}

% Shared macros
\RequirePackage{shared}

% Page layout and spacing
\RequirePackage[margin=1in]{geometry}
\RequirePackage{setspace}
\doublespacing

% Hyperlinks and references
\RequirePackage[hidelinks]{hyperref}
% Cleveref after hyperref if you use it
\RequirePackage[noabbrev,nameinlink]{cleveref}

% Bibliography (natbib)
\RequirePackage{bib-natbib}

% Equations numbered by section (optional)
\numberwithin{equation}{section}
