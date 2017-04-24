%%
%%  This is file `SBU-Thesis.cls',
%%	by: Arash Dargahi Nobari, arash@dargahi.org
%%  http://arashdargahi.com
%%	Ver 0.1, Apr 2017

%% Original Copyright of AUT-Thesis

%%  This is file `AUT-Thesis.cls',
%%  It is a modification  of Tabriz_thesis of Vahid Damanafshan,
%%	by: Mahmood Amintoosi, m.amintoosi@gmail.com
%%  http://profsite.sttu.ac.ir/mamintoosi
%%	Ver 0.1, Jan 2012

%%  The original file was xepersian-thesis.cls by Vafa Khalighi
%%   __________________________________
%%   Copyright © 2011-2012 Vahid Damanafshan
%%  
%%   http://damanafshan.tk      
%%   http://forum.parsilatex.com
%% 
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SBU-Thesis}
              [4/14/2017 v0.1
 Persian thesis document class in XeLaTeX for Shahid Beheshti University projects/theses/dissertations]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,12pt]{book}


\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}

\newcommand{\firstsupervisor}[1]{\def\@firstsupervisor{#1}}
\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\firstadvisor}[1]{\def\@firstadvisor{#1}}
\newcommand{\secondadvisor}[1]{\def\@secondadvisor{#1}}
\def\name#1{\gdef\@name{#1}}
\def\surname#1{\gdef\@surname{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\fa-abstract#1{\gdef\@fa-abstract{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\subject#1{\gdef\@subject{#1}}


%nkhComment
\def\reportVersion#1{\gdef\@reportVersion{#1}}
\def\field#1{\gdef\@field{#1}}
\def\department#1{\gdef\@department{#1}}
\def\projectLabel#1{\gdef\@projectLabel{#1}}
\def\studentID#1{\gdef\@studentID{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\latintitle#1{\gdef\@latintitle{#1}}
\def\latinauthor#1{\gdef\@latinauthor{#1}}
\def\latindegree#1{\gdef\@latindegree{#1}}
\def\latinfaculty#1{\gdef\@latinfaculty{#1}}
\def\latinthesisdate#1{\gdef\@latinthesisdate{#1}}
\def\latinsubject#1{\gdef\@latinsubject{#1}}
\def\latinfield#1{\gdef\@latinfield{#1}}
\def\firstlatinsupervisor#1{\gdef\@firstlatinsupervisor{#1}}
\def\secondlatinsupervisor#1{\gdef\@secondlatinsupervisor{#1}}
\def\firstlatinadvisor#1{\gdef\@firstlatinadvisor{#1}}
\def\secondlatinadvisor#1{\gdef\@secondlatinadvisor{#1}}
\def\latinname#1{\gdef\@latinname{#1}}
\def\latinsurname#1{\gdef\@latinsurname{#1}}
\def\en-abstract#1{\gdef\@en-abstract{#1}}
\def\latinkeywords#1{\gdef\@latinkeywords{#1}}
\def\latinuniversity#1{\gdef\@latinuniversity{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%پایان‌نامه ارشد
\newif\if@mscthesis
\@mscthesisfalse
\DeclareOption{msc}{\@mscthesistrue}

%%%سمینار ارشد
\newif\if@mscthesisReport
\@mscthesisReportfalse
\DeclareOption{mscS}{\@mscthesisReporttrue}

\ProcessOptions

\ifx\@projectLabel\undefined%
{
\if@mscthesis
{\projectLabel{پایان‌نامه کارشناسی ارشد}}
\else
  \if@mscthesisReport
   {\projectLabel{گزارش سمینار کارشناسی ارشد }}
  \else
{\projectLabel{رساله}}
\fi\fi
}\fi

\ifx\@degree\undefined%
{
\if@mscthesis
\degree{کارشناسی ارشد}
\else
\if@mscthesisReport
\degree{کارشناسی ارشد}
\else
\degree{دکتری}
\fi\fi
}



%%%%%%%%%%%%%%%%%% صفحه اول پایان‌نامه
\newcommand{\firstPage}{
	\begin{titlepage}
		%\topmargin=-30pt
		\vspace{-10mm}
		\centerline{{\includegraphics[width=4cm]{logo}}}
		\vspace{7mm}
		%nkhComment: University name may be included in logo
		\ifx\@university\undefined%
		\relax
		\else
		\centerline{\large \bf \@university} 
		\fi
		{\large\bfseries\@faculty\space}
		\vskip 1cm
		%nkhComment: in case the title is too large
		\linespread{1.2}
		{\huge \titlefont \@title \par}
		\vskip 15mm
		\if@mscthesis 
		{\large\bfseries{\@projectLabel\ \ \@subject}
			\ifx\@field\undefined%
			\relax
			\else
			\\گرایش \@field
			\fi
		}
		\else
		\if@mscthesisReport 
		{\large\bfseries{\@projectLabel\ \ \@subject}
			\ifx\@field\undefined%
			\relax
			\else
			\\گرایش \@field
			\fi
		}
		\else
		{\large\bfseries \@projectLabel\ \ \writtenfor
			\@degree{} 
		}
		{\large\bfseries{در رشته \@subject}}
		\vskip .2cm
		\centerline{\large \bfseries%
			گرایش \@field}
		\fi\fi	
		\par
		\vskip 10mm
		{\bfseries\by}\par
		{\Large\bfseries{\large\bfseries \@name\ \ \@surname}}
		\par
		\vskip 10mm
		\large
		{
			\ifx\@firstsupervisor\undefined%
			\ifx\@secondsupervisor\undefined%
			\else
			\fi
			\else
			\ifx\@secondsupervisor\undefined%
			استاد راهنما
			{\Large\bfseries\par
				\@firstsupervisor}
			\else
			\large
			اساتید راهنما
			\par
			{\Large\bfseries \@firstsupervisor{} و \@secondsupervisor}
			\fi\fi}
		\par\large
		{\ifx\@firstadvisor\undefined%
			\ifx\@secondadvisor\undefined%
			\else\fi
			\else
			\ifx\@secondadvisor\undefined%
			استاد مشاور
			{\Large\bfseries\par
				\@firstadvisor}
			\else
			
			\large
			استادان مشاور
			\par
			{\Large\bfseries\@firstadvisor{} و \@secondadvisor}
			\fi\fi}
		
		\par
		\vskip 6mm
		%\vfill
		{\large \@thesisdate}
		%\vfill
	\end{titlepage}%
} % end of firstPage



\def\titlepage{\newpage\centering
	\thispagestyle{empty}
	\parindent 0pt \parskip 10pt plus 1fil minus 1fil
	\def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}
%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%% صفحه چکیده
\newcommand\abstractPage
{
	\newpage
	\thispagestyle{plain}
	\vskip 15mm
	{\noindent\bfseries \hfil \large چکیده}
	\vspace{5mm}
	\par
	\noindent
	\@fa-abstract
	\vspace{8mm}
	\par
	\noindent
	\ifdefined\@keywords
	{
		\textbf{واژگان کلیدی:} 
		\@keywords
	}
	\fi
	\newpage
}
%%%%%%%%%%%%%%%%%%%%%%%


\pagenumbering{adadi}
\let\ol@chapter\@chapter
\def\@chapter{%
	\ifnum\c@chapter=0 \pagenumbering{arabic}\setcounter{page}{1}\fi
	\ol@chapter}


%nkhComment
\def\version{نسخه‌ی }
\def\report{گزارش}
\def\onvan{عنوان}
\def\writtenfor{برای دریافت درجه }
\def\by{نگارش}
\def\latinby{By:}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


\newcommand{\cchapter}[1]
{
	\chapter[#1]{\centering #1}
	\thispagestyle{empty} % حذف شماره صفحه
	\pagebreak
}




%%%%%%Commands

%تنظیم حاشیه صفحات
\usepackage[top=35mm, bottom=30mm, left=25mm, right=30mm]{geometry}

\usepackage{titlesec} % ایجاد فاصله بین عناوین و خط مطلب بعدی

\usepackage {indentfirst}
\usepackage{multirow}
% در ورژن جدید زی‌پرشین برای تایپ متن‌های ریاضی، این سه بسته، حتماً باید فراخوانی شود
\usepackage{amsthm,amssymb,amsmath}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%تنطیمات خط بالایی صفحه
\usepackage{fancyhdr}
\pagestyle{fancy}


\lhead{}
% Length to control the \fancyheadoffset and the calculation of \headline
% simultaneously
\newlength\FHoffset
\setlength\FHoffset{0cm} %بیشتر بودن خط بالا از حاشیه کناری صفحه

\addtolength\headwidth{2\FHoffset}

\fancyheadoffset{\FHoffset}

% these lengths will control the headrule trimming to the left and right 
\newlength\FHleft
\newlength\FHright

% here the trimmings are controlled by the user
\setlength\FHleft{1cm}
\setlength\FHright{0cm}

\lhead{\thepage} % نمایش شماره صفحه در سمت راست هدر
\cfoot{} % نمایش ندادن شماره صفحه در پایین صفحه

% The new definition of headrule that will take into acount the trimming(s)
\newbox\FHline
\setbox\FHline=\hbox{\hsize=\paperwidth%
	\hspace*{\FHleft}%
	\rule{\dimexpr\headwidth-\FHleft-\FHright\relax}{\headrulewidth}\hspace*{\FHright}%
}

\linespread{1.3} % تنظیم فاصله خطوط به 1.5

%\renewcommand\headrule{\vskip-0.2\baselineskip\copy\FHline}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage[perpage]{footmisc} %شروع شماره زیرنویس ها از ۱ در هر صفحه

\setlength{\skip\footins}{1cm} %تنظیم فاصله متن تا خط زیرنویس


\usepackage{graphicx}
\usepackage{xepersian}

%\usepackage{persian-bib}



\settextfont[Scale=1]{IRMitra}
\setlatintextfont[Scale=1]{IRMitra}
\defpersianfont\titlefont[Scale=0.857]{IRTitr}



% دستوری برای تغییر نام کلمه «کتاب‌نامه» به «مراجع»
\renewcommand{\bibname}{مراجع}
%\renewcommand{\bibname}{\normalsize \begin{center} مراجع \end{center}}
% دستوری برای تعریف واژه‌نامه انگلیسی به فارسی
\newcommand\persiangloss[2]{#1\dotfill\lr{#2}\\}
% دستوری برای تعریف واژه‌نامه فارسی به انگلیسی 
\newcommand\englishgloss[2]{#2\dotfill\lr{#1}\\}







%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% 
%% Special thanks to Vafa Khalighi for xepersian package.
%%
%% End of file `SBU-Thesis.cls'.
