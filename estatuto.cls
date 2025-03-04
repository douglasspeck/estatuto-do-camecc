%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Template de Estatuto
% Produzido por Douglas Speck
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{estatuto}[Template de Estatutos do CAMECC]

\renewcommand{\@title}{} % Título do documento

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definições de layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\paperwidth}{210mm} % Largura do papel A4
\setlength{\paperheight}{297mm} % Altura do papel A4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tipografia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc} % Formatação de acentos
\RequirePackage[rm,light]{roboto}
\usepackage[T1]{fontenc}

% Tamanhos de fonte
\renewcommand{\normalsize}{\fontsize{12}{14}\selectfont} % Fonte padrão
\newcommand{\small}{\fontsize{10}{12}\selectfont} % Fonte pequena
\newcommand{\medium}{\fontsize{18}{24}\selectfont} % Fonte pequena
\newcommand{\large}{\fontsize{24}{30}\selectfont} % Fonte grande
\newcommand{\Large}{\fontsize{40}{48}\selectfont} % Fonte maior
\newcommand{\huge}{\fontsize{180}{200}\selectfont} % Fonte enorme

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

% Paleta de cores
\definecolor{preto}{RGB}{30, 30, 30}
\definecolor{base}{RGB}{250, 245, 245}
\definecolor{vermelho}{RGB}{199, 24, 24}
\definecolor{cinza}{RGB}{138, 128, 128}
\definecolor{cinzaescuro}{RGB}{72, 72, 72}

\pagecolor{base} % Cor base (fundo das páginas)
\color{preto}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imagens
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{graphicx}
\graphicspath{{img/}} % Caminho para as imagens

\RequirePackage{transparent} % Imagens semi-transparentes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Criação de Variáveis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\nomedaentidade}{}
\newcommand{\adata}{}
\newcommand{\entidade}[1]{\renewcommand{\nomedaentidade}{#1}}
\newcommand{\data}[1]{\renewcommand{\adata}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alinhamento da página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\oddsidemargin}{-1in} % Remove a margem padrão para páginas ímpares
\setlength{\evensidemargin}{-1in} % Remove a margem padrão para páginas pares
\setlength{\topmargin}{\dimexpr 10mm - 1in \relax} % Margem superior
\setlength{\textwidth}{170mm} % Largura do texto
\setlength{\textheight}{245mm} % Altura do texto
\setlength{\hoffset}{20mm} % Margem horizontal
\setlength{\headsep}{17mm}
\setlength{\footskip}{15mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contadores para os
% comandos personalizados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{tit}
\setcounter{tit}{1}

\newcounter{chap}
\setcounter{chap}{1}

\newcounter{sec}
\setcounter{sec}{1}

\newcounter{art}
\setcounter{art}{1}

\newcounter{paragrafo}
\setcounter{paragrafo}{1}

\newcounter{inciso}
\setcounter{inciso}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comandos específicos para estatuto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\titulo}[1]{
    \vspace{20pt}
    \begin{center}
        {\bfseries\uppercase{Título} \Roman{tit} - \uppercase{#1}}
    \end{center}
    \stepcounter{tit}
}

\newcommand{\capitulo}[1]{
    \vspace{20pt}
    \noindent{\bfseries\uppercase{Capítulo} \Roman{chap}: \uppercase{#1}}
    \stepcounter{chap}
    \setcounter{sec}{1}
}

\newcommand{\secao}[1]{
    \vspace{20pt}
    \noindent\textbf{Seção \Roman{sec}: #1}
    \stepcounter{sec}
}

\newcommand{\artigo}{
    \vspace{1em}\noindent
    \ifnum\value{art} < 10
        \textbf{Art. \arabic{art}º:}
    \else
        \textbf{Art. \arabic{art}:}
    \fi
    \stepcounter{art}
    \setcounter{inciso}{1}
    \setcounter{paragrafo}{1}
}

\newcommand{\paragrafo}{
    \vspace{0.5em}
    \noindent\textsection\,\arabic{paragrafo}º
    \stepcounter{paragrafo}
}

\newcommand{\inciso}{
    \vspace{0.5em}
    \noindent\Roman{inciso} \---
    \stepcounter{inciso}
}

\newcommand{\paragrafounico}{
    \vspace{0.5em}
    \noindent\textbf{Parágrafo único.} \ignorespaces
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hifenização de palavras específicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hyphenation{CAMECC}
\hyphenation{IMECC}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cabeçalho e Rodapé
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thepage}{{\fontfamily{Roboto-TOsF}\selectfont\bfseries\color{vermelho}\arabic{page}}}

\makeatletter
\def\ps@camecc{
    \def\@oddfoot{\hfil\thepage\hfil} % Número centralizado no rodapé
    \def\@evenfoot{\@oddfoot} % Mesmo formato para páginas pares
    \def\@oddhead{\hfil\includegraphics[height=8mm]{logo-camecc.png}\hfil} % Logo no cabeçalho
    \def\@evenhead{\@oddhead} % Mesmo formato para páginas pares
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Capa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{
    \pagestyle{empty}
    \,
    \vfill\noindent
    \includegraphics[height=1.5cm]{logo-imecc.png}\hspace{0.5cm}
    \includegraphics[height=1.5cm]{logo-unicamp.eps}\vspace{0.75cm}\\
    {\fontfamily{Roboto-TOsF}\selectfont
        {\Large \bfseries \noindent Estatuto do}\vspace{1em}\\
        \parbox{10cm}{\raggedright \large \nomedaentidade}\vspace{0.5em}\\
        {\medium \textit \adata}
    }
    \newpage
    \setcounter{page}{1}
    \pagestyle{camecc}
}

\AddToHookNext{shipout/foreground}{
    \put(-20,-850){{\transparent{0.1} \includegraphics[height=1.2\textheight]{resistencia.png}}}
    {\transparent{0.05}
        \put(290,-220){\fontfamily{Roboto-TOsF}\selectfont\bfseries\huge ES}
        \put(290,-390){\fontfamily{Roboto-TOsF}\selectfont\bfseries\huge TA}
        \put(290,-560){\fontfamily{Roboto-TOsF}\selectfont\bfseries\huge TU}
        \put(290,-730){\fontfamily{Roboto-TOsF}\selectfont\bfseries\huge TO}
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim da classe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput