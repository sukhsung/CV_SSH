\LoadClass[11pt]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[
    letterpaper,
    height=8.5in,      % height of the text block
    width=7.1in,       % width of the text block
    top=120pt,        % distance of the text block from the top of the page
    headheight=96pt, % height for the header block
    headsep=20pt,    % distance from the header block to the text block
    %showframe,       % show the main blocks
    heightrounded,   % ensure an integer number of lines
]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\sbt}{\,\begin{picture}(-1,1)(-1,-3)\circle*{3}\end{picture}\ }
\newcommand{\upAst}{$^*$}
\newcommand{\upDag}{$^\dagger$}
\newcommand{\upDdag}{$^\ddagger$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Header & Fotter Related
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{datetime}
\RequirePackage{lastpage}
\pagestyle{fancy}
\fancyhf{} % clear all fields
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{
    {\Huge\bfseries\scshape \myName}\\
    \vspace{0.2cm}
    {\small \myAddress}
}

\fancyhead[R]{\small{\monthname{} \the\year\\\myNumber\\\myEmail\\\myWebsite}}
\fancyfoot[C]{\small Pg. \thepage{} of \pageref{LastPage}   }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Setting Font
%\RequirePackage{times}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\renewcommand\familydefault{\sfdefault}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Setting Section Title
\RequirePackage{titlesec}
\definecolor{classicblue}{RGB}{15, 76, 129}

\titleformat{\section}
    {\normalsize\bfseries\scshape}{\thesection}{1em}{}[{\color{classicblue}\titlerule[2pt]}]
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Setting Section Entries
\RequirePackage[backend=biber,maxnames=99,giveninits=true]{biblatex}
\RequirePackage{setspace}
\RequirePackage{hanging}
    
\singlespacing
\setlength\parindent{20pt}

\newenvironment{entry}
  {\list{}{
     \itemindent=-.5cm
     \leftmargin=1.2cm
     \rightmargin=0cm
     \topsep=0pt
     \partopsep=0pt
   }\item\relax\par\vspace{0.5em}}
  {\endlist}

\DeclareFieldFormat{pages}{#1}
\DeclareCiteCommand{\subEntry}{}{%
  \setunit{\addspace}%
  \printnames[given-family]{author}%
  \printfield{title}
  \printfield{journaltitle}
  (\printfield{year})
}{}{}
\DeclareCiteCommand{\pubEntry}{}{%
  \setunit{\addspace}%
  \printnames[given-family]{author}%
  \printfield{title}
  \printfield{journaltitle}
  \mkbibbold{\printfield{volume}},%
  \iffieldundef{number}{}{\mkbibemph{\printfield{number}},}
  \mkbibemph{\printfield{pages}},
  (\printfield{year})
}{}{}
\DeclareCiteCommand{\confEntry}{}{%
  \setunit{\addspace}%
  \printnames[given-family]{author}%
  \printfield{title}
  \printfield{journaltitle}
  (\printfield{year})
  \printfield{note}%
}{}{}

\newcommand\insubmission[2]{%
    \begin{entry}
        #2\subEntry{#1}
    \end{entry}
}
\newcommand\publication[2]{%
    \begin{entry}
        #2\pubEntry{#1}
    \end{entry}
}

\newcommand\abstracts[2]{%
    \begin{entry}
        #2\pubEntry{#1}
    \end{entry}
}
\newcommand\conference[2]{%
    \begin{entry}
        #2\confEntry{#1}
    \end{entry}
}

