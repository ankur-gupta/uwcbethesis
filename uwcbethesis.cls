%%
%% UW CBE Thesis: uwcbethesis.cls
%% Written by Ankur Gupta, Sep 1, 2013
%% Departament of Chemical and Biological Engineering
%% University of Wisconsin-Madison
%% Copyright (c) Ankur Gupta, 2014
%%
%% License: GPL v3. See LICENSE.
%%

%% Default Option Settings:
% 11pt, oneside, letterpaper, openright, titlepage
% not draft, not fleqn, not leqno

% Options not (yet?) implemented:
% landscape, onecolumn/twocolumn

%% Options disabled:
% notitlepage

%% Option details:
% With oneside: openany/openright options are meaningless. Only useful only with twoside.


% ---------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uwcbethesis}[2013/09/01 UW CBE Thesis]  %% Date format: YYYY/MM/DD. This has to be maintained.
\typeout{Document Class 'uwcbethesis' v0.1 <01 Sep 2013>}
% ---------------------------------------



% ---------------------------------------
%% Definitions/Shortcuts
% I don't want to write the word report repeatedly. Maybe I want to change it to book.
\newcommand{\baseclass}{report}
% ---------------------------------------



% ---------------------------------------
%% Process Options
% Font size
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{11pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}


% Oneside or twoside: twoside has different margins on odd and even numbered pages
\DeclareOption{oneside}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{twoside}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}


% Paper size
\DeclareOption{a4paper}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{letterpaper}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}


% New page after the document title or not?
\DeclareOption{titlepage}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
} % Just so you don't get a warning when titlepage is used.

% Chapter beginnings: openright or openany
\DeclareOption{openright}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{openany}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}


% Draft or not?
\DeclareOption{draft}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Formulas left aligned (fleqn) or centered
\DeclareOption{fleqn}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Numbering of formulas on left (leqno) instead of right
\DeclareOption{leqno}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
% ---------------------------------------



% ---------------------------------------
%% Unknown option?
\DeclareOption*{
    \ClassWarning{uwcbethesis}{You have used an unknown option '\CurrentOption'}
}

%% Default Options
\ExecuteOptions{11pt}
\ExecuteOptions{oneside}
\ExecuteOptions{letterpaper}
\ExecuteOptions{titlepage}
\ExecuteOptions{openright}

%% Process given options
\ProcessOptions\relax

%% Load class : report
\LoadClass{\baseclass}
% ---------------------------------------



%%%%%%%%%%%%%% Here comes the style stuff %%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------
%% Colors
\RequirePackage[dvipsnames]{xcolor}
\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
%-----------------------------------------------------------------------------


%-----------------------------------------------------------------------------
%% Set margins using geometry package
% UW requires at least 1in margins on all sides
\RequirePackage[pdftex,left=1.75in,right=1.25in,top=1.25in,bottom=1.25in]{geometry}
%-----------------------------------------------------------------------------


%-----------------------------------------------------------------------------
%% Set page numbers to suit UW requirements
\RequirePackage{fancyhdr}

% Redefine plain: UW wants all page numbers to be at the top right hand corner.
% exactly one inch from the top and right paper edge
\fancypagestyle{plain}{
    \fancyhf{} % clear all header and footer fields
    \fancyheadoffset[LE,RO]{0.25in} % = right(passed to geometry) - 1in
    \fancyhead[LE,RO]{\thepage} % Put page number on leftside(even) and rightside(odd)
    \renewcommand{\headrulewidth}{0pt} % I don't want a line
}
\pagestyle{plain} % I need either empty or plain. So I can put this here as default.
%-----------------------------------------------------------------------------


%-----------------------------------------------------------------------------
%% Load palatino fonts for text and pazo for math (with true small caps and old style figures)
\RequirePackage[sc,osf]{mathpazo}
\linespread{1.05}
\usepackage[T1]{fontenc} % provides many things (eg: good searching text on PDF)
%-----------------------------------------------------------------------------


%-----------------------------------------------------------------------------
%% Repeatedly used commands: \spacedallcaps, \spacedlowsmallcaps
% Soul: provides letterspacing and other things
\RequirePackage{soul}

\sodef\allcapsspacing{\upshape}{0.15em}{0.65em}{0.6em} %define new spacing
\DeclareRobustCommand{\spacedallcaps}[1]{\MakeTextUppercase{\allcapsspacing{#1}}}

\sodef\lowsmallcapsspacing{\scshape}{0.075em}{0.5em}{0.6em} %define new spacing
\DeclareRobustCommand{\spacedlowsmallcaps}[1]{\MakeTextLowercase{\textsc{\lowsmallcapsspacing{#1}}}}%\protect
%-----------------------------------------------------------------------------



%-----------------------------------------------------------------------------
%% Layout of Chapter, (sub*)Section, Paragraph, Description headings
%% This part is copied from classicthesis with very minor modifications

% % Set font for the beautiful chapter number
\newfont{\chapterNumberFont}{eurb10 scaled 7000}

% Titlesec: provides the fancy layout of chapter, section etc. headings
\RequirePackage{titlesec}

% Textcase: provides \MakeTextLowercase
\RequirePackage{textcase}

% Chapter formatting
\titleformat{\chapter}%command
[display]%shape
{\relax}%format
{\raggedleft\textcolor{darkgray}{\chapterNumberFont\thechapter} \\ }%label (for chapter number)
{0pt}%sep
{\titlerule\vspace*{.9\baselineskip}\raggedright\spacedallcaps}%before-code; last command can take the title text as argument
[\vspace*{.8\baselineskip}\titlerule]%after-code
% Chapter spacing
{\titlespacing*{\chapter}%command
{0pt}%left
{1\baselineskip}%before-sep
{1.2\baselineskip}}%after-sep


% Section formatting
\titleformat{\section}%command
{\relax}%format
{\textsc{\MakeTextLowercase{\thesection}}}%label (for section number)
{1em}%sep
{\spacedlowsmallcaps}%before-code; last command can take title text as argument
% Section spacing
\titlespacing*{\section}%command
{0pt}%left
{0.85\baselineskip}%before-sep
{0.75\baselineskip}%after-sep

% Subsection formatting
\titleformat{\subsection}%command
{\relax}%format
{\textsc{\MakeTextLowercase{\thesubsection}}}%label (for subsection number)
{1em}%sep
{\normalsize\itshape}%before-code; last command can take title text as argument
% Subsection spacing
\titlespacing*{\subsection}%command
{0pt}%left
{0.75\baselineskip}%before-sep
{0.65\baselineskip}%after-sep

% Subsubsection formatting
\titleformat{\subsubsection}%command
{\relax}%format
{\textsc{\MakeTextLowercase{\thesubsubsection}}}%label (for subsubsection number)
{1em}%sep
{\normalsize\itshape}%before-code; last command can take title text as argument

% Paragraph formatting
\titleformat{\paragraph}%command
[runin]%shape
{\normalfont\normalsize}%format
{\theparagraph}%label (for paragraph number)
{0pt}%sep
{\spacedlowsmallcaps}%before-code; last command can take title text as argument
% Paragraph spacing
\titlespacing*{\paragraph}%command
{0pt}%left
{0.55\baselineskip}%before-sep
{0.55\baselineskip}%after-sep
%-----------------------------------------------------------------------------



%-----------------------------------------------------------------------------
%% Prettier table of contents, list of figure, list of tables
%% Use tocloft package
\RequirePackage[titles]{tocloft} % titles: doesn't seem to work

% Define and set the amount of space you want between maintext and bibliography
\newlength{\beforebibskip}
\setlength{\beforebibskip}{1em}

% Change Chapter font title
\renewcommand{\cftchapfont}{\normalfont}
% Indent Chapters and everything below
% a little to match with other entries like abstract etc.
% \cftsetindents{chapter}{4em}{\cftchapnumwidth}
% \cftsetindents{section}{2em}{\cftsecnumwidth}
% \cftsetindents{subsection}{2em}{\cftsubsecnumwidth}
% \cftsetindents{subsubsection}{2em}{\cftsubsubsecnumwidth}

% But since [titles]tocloft and titlesec don't play nice,
% I need to this. (From Andre Miede)
\let\oldchap=\chapter
\renewcommand*{\chapter}{\secdef{\Chap}{\ChapS}}
\newcommand\ChapS[1]{\oldchap*{#1}}
\newcommand\Chap[2][]{
    \ifpdf\oldchap[\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}]{#2}
    \else\oldchap[\spacedlowsmallcaps{#1}]{#2}
    \fi
}
% Command for other entries eg: bibliography, abstract, list of figures etc
\newcommand{\tocEntry}[1]{
    \ifpdf\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}
    \else{#1}
    \fi
}

% Remove indents for list of figures and tables
\cftsetindents{figure}{0em}{\cftfignumwidth}
\cftsetindents{table}{0em}{\cfttabnumwidth}
%-----------------------------------------------------------------------------



%% Last command in a .cls file
\endinput