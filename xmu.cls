\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xmu}[2025-05-07 XMU Undergraduates Thesis Template]

\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\LoadClass{ctexbook}

%%%%%%%% 宏包 %%%%%%%%

% 页面尺寸
\RequirePackage[a4paper,top=2.54cm,bottom=2.54cm,left=3.17cm,right=3.17cm,head=1.5cm,foot=1.75cm]{geometry}
% 自定义页眉页脚
\RequirePackage{fancyhdr}
% 自定义章节标题
\RequirePackage{titlesec}
\RequirePackage{titletoc}
% 首行缩进
\RequirePackage{indentfirst}
% 插图
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage{subcaption}
% 列表
\RequirePackage{enumitem}
% 表格
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{ltablex} % 跨页表格
% \RequirePackage{rotating} % 旋转表格
\RequirePackage{threeparttable} % 三线表
% 数学公式
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathptmx}
\RequirePackage{bm}
% 绘图
% \RequirePackage{pgfplots}
% 算法
\RequirePackage[linesnumbered, ruled, longend, lined]{algorithm2e}
% 自定义脚注
\RequirePackage{scrextend}
\RequirePackage{pifont} % 圆圈数字
\RequirePackage[perpage]{footmisc} % 每页脚注编号从1开始
% 自定义参考文献
\RequirePackage[sort&compress]{gbt7714} % 对引用的编号进行自动排序
% 引用、超链接
\RequirePackage[colorlinks,citecolor=black,linkcolor=black,urlcolor=black,bookmarksnumbered=true,bookmarksopen=true]{hyperref}
\RequirePackage{cleveref} % 单次多个引用
% 条件编译
\RequirePackage{ifthen}

%%%%%%%% 用户自定义变量 %%%%%%%%

\newcommand{\print}{\def\xmu@print{true}}                               % 电子版 / 打印版
\newcommand{\design}{\def\xmu@design{true}}                             % 毕业设计 / 毕业论文
\newcommand{\minor}{\def\xmu@minor{true}}                               % 主修 / 辅修
\newcommand{\arabicchapter}{\def\xmu@arabicchapter{true}}               % 章节使用阿拉伯数字编号
\renewcommand{\title}[2]{\def\xmu@title{#1}\def\xmu@entitle{#2}}        % 标题
\renewcommand{\author}[1]{\def\xmu@author{#1}}                          % 作者
\newcommand{\idn}[1]{\def\xmu@idn{#1}}                                  % 学号
\newcommand{\college}[1]{\def\xmu@college{#1}}                          % 学院
\newcommand{\subject}[1]{\def\xmu@subject{#1}}                          % 专业
\newcommand{\grade}[1]{\def\xmu@grade{#1}}                              % 年级
\newcommand{\teacher}[1]{\def\xmu@teacher{#1}}                          % 指导教师
\newcommand{\otherteacher}[1]{\def\xmu@otherteacher{#1}}                % 校外指导教师
\newcommand{\pubdate}[1]{\def\xmu@pubdate{#1}}                          % 日期
\newcommand{\keywords}[2]{\def\xmu@keywords{#1}\def\xmu@enkeywords{#2}} % 关键字

% 保存原始的无编号章节标题样式
\let\old@makeschapterhead\@makeschapterhead

% 定义新的居中样式
\def\centered@makeschapterhead#1{%
  {\parindent \z@ \centering \normalfont
    \heiti\zihao{-3} #1\par\nobreak
    \vskip 30pt}%
}

% 在致谢、摘要环境中应用居中标题
\AtBeginEnvironment{acknowledgement}{\let\@makeschapterhead\centered@makeschapterhead}
\AtBeginEnvironment{abstract}{\let\@makeschapterhead\centered@makeschapterhead}
\AtBeginEnvironment{enabstract}{\let\@makeschapterhead\centered@makeschapterhead}

% 恢复原始样式
\AtEndEnvironment{acknowledgement}{\let\@makeschapterhead\old@makeschapterhead}
\AtEndEnvironment{abstract}{\let\@makeschapterhead\old@makeschapterhead}
\AtEndEnvironment{enabstract}{\let\@makeschapterhead\old@makeschapterhead}

% 定义罗马数字部分的空白页样式
\fancypagestyle{romanplain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\rm\zihao{-5}\thepage} % 统一页脚字号
}

%%%%%%%% 字体、段落 %%%%%%%%

% 设置粗体的粗细程度
\xeCJKsetup{EmboldenFactor=3}

% 采用 Windows 字体文件以兼容 macOS 和 Linux
% \setCJKfamilyfont{simsun}{simsun.ttc}
% \setCJKfamilyfont{simhei}{simhei.ttf}
% \setCJKfamilyfont{simkai}{simkai.ttf}

% 定义新的字体调用命令
% \renewcommand{\songti}{\CJKfamily{simsun}} % 宋体
% \renewcommand{\heiti}{\CJKfamily{simhei}}  % 黑体
% \renewcommand{\kaishu}{\CJKfamily{simkai}} % 楷体

% 英文默认字体
\setmainfont{Times New Roman}
\setsansfont{Arial}

% 中文默认字体
% \setCJKmainfont[BoldFont=simhei.ttf,ItalicFont=simkai.ttf]{simsun.ttc}
% \setCJKsansfont{simhei.ttf}
% 这样设置之后，针对不同的中英字体效果如下：
% \rm：中文宋体，英文 Times New Roman
% \sf：中文黑体，英文 Arial
% \bf：中文黑体，英文 Times New Roman 加粗
% \it：中文楷体，英文 Times New Roman 斜体
% \bf\songti：中文宋体加粗，英文 Times New Roman 加粗

% 数学加粗斜体
\DeclareMathAlphabet{\mathbfit}{T1}{ptm}{b}{it}
\renewcommand{\boldsymbol}[1]{\mathbfit{#1}}
% URL 字体
\urlstyle{same}
% 默认行距
\renewcommand{\baselinestretch}{1.5}

%%%%%%%% 封面 %%%%%%%%

\renewcommand{\maketitle}{

    % PDF Metadata - hyperref宏包的相关
    \hypersetup{
        pdftitle={\xmu@title},
        pdfsubject={厦门大学本科毕业论文（设计）},
        pdfauthor={\xmu@author},
        pdfkeywords={\xmu@keywords}
    }
    \clearpage

    % 封面
    \thispagestyle{empty} % 设置页脚页眉为空
    \begin{center} % 文本居中
        \includegraphics[width=5.79cm]{xmu-logo-text-revised.jpg} % 设置校徽
        \vskip 44bp % 关于字号磅数用pt还是bp的讨论：https://github.com/ustctug/ustcthesis/issues/4
        \ifthenelse{\isundefined{\xmu@design}}{
            \bf\songti\zihao{-2} 本\hspace{1.1em}科\hspace{1.1em}毕\hspace{1.1em}业\hspace{1.1em}论\hspace{1.1em}文\\
        }{
            \bf\songti\zihao{-2} 本\hspace{1.1em}科\hspace{1.1em}毕\hspace{1.1em}业\hspace{1.1em}设\hspace{1.1em}计\\
        }
        \vskip 1bp
        \ifthenelse{\isundefined{\xmu@minor}}{}{
            \bf\songti\zihao{3} （辅\quad 修）\\
        }{
            \bf\songti\zihao{3}（主修专业）\\
        }
        \vskip 16bp
        \heiti \zihao{2}\mdseries\xmu@title
        \vskip 1ex
        \bf\zihao{3}\xmu@entitle
        \vskip 50bp
        \rm\zihao{4}\mdseries
        \renewcommand\arraystretch{1.2}
        \begin{tabular}{rl}
            姓\qquad 名：\quad & \xmu@author       \\
            学\qquad 号：\quad & \xmu@idn          \\
            学\qquad 院：\quad & \xmu@college      \\
            专\qquad 业：\quad & \xmu@subject      \\
            年\qquad 级：\quad & \xmu@grade        \\
            校内指导教师：\quad    & \xmu@teacher      \\
            \ifthenelse{\isundefined{\xmu@otherteacher}}{}{
            校外指导教师：\quad    & \xmu@otherteacher \\
            }
        \end{tabular}
        \vskip 5em
        \xmu@pubdate
    \end{center}
    \clearpage
    \ifthenelse{\isundefined{\xmu@print}}{}{\cleardoublepage}

    % 诚信承诺书
    % 定义目录前的页码格式为罗马字母
    \pagestyle{romanplain}      % 启用页眉页脚控制
    \pagenumbering{Roman}
    \setcounter{page}{1}
    \vspace*{1em}
    \begin{center}
        \heiti \zihao{-2}厦门大学本科学位论文诚信承诺书
    \end{center}
    \vspace{3em}
    {
        \renewcommand{\baselinestretch}{2}
        \zihao{4}
        \par
        本人呈交的学位论文是在导师指导下独立完成的研究成果。本人在论文写作中参考其他个人或集体已经发表的研究成果，均在文中以适当方式 明确标明，并符合相关法律规范及《厦门大学本科毕业论文（设计）规范》。
        \par
        该学位论文为（\qquad \qquad \qquad \qquad \qquad \qquad）课题（组）的研究成果，获得（\qquad \qquad \qquad \qquad）课题（组）经费或实验室的资助，在（\qquad \qquad \qquad \qquad）实验室完成（请在以上括号内填写课题或课题组负责人或实验室名称，未有此项声明内容的，可以不作特别声明）。
        \par
        本人承诺辅修专业毕业论文（设计）（如有）的内容与主修专业不存在相同与相近情况。
        \vspace{4em}
        \par
        \hfill 学生声明（签名）:\qquad \qquad \qquad \quad~
        \par
        \hfill 年\qquad 月\qquad 日
        \par
    }
    \clearpage
    % \ifthenelse{\isundefined{\xmu@print}}{}{\cleardoublepage}
    \ifthenelse{\isundefined{\xmu@print}}{}{
        \thispagestyle{romanplain} % 使用专用样式
        \cleardoublepage
    }

    % 正文字号
    \zihao{-4}
}

%%%%%%%% 致谢 %%%%%%%%

\newenvironment{acknowledgement}{
    \chapter*{\zihao{-3}\heiti 致\quad\; 谢}
    \pagestyle{fancy}
    \fancyhf{}
    \thispagestyle{romanplain} % 设置页眉页脚
    \ifthenelse{\isundefined{\xmu@entoc}}{
        % 如果致谢在目录前，则只设置页脚
        \renewcommand{\headrulewidth}{0pt}
        \fancyfoot[C]{\rm\zihao{-5}\thepage}
    }{
        % 如果致谢在目录后，设置页眉、页脚，并添加索引到目录
        \renewcommand{\headrulewidth}{0.4pt}
        \fancyhead[OC]{\rm\zihao{-5}致\quad\; 谢}
        \fancyhead[EC]{\rm\zihao{-5}\xmu@title}
        \fancyfoot[C]{\rm\zihao{-5}\thepage}
        \addcontentsline{toc}{chapter}{致谢}
        \addcontentsline{entoc}{chapter}{Acknowledgements}
    }
    \vspace{1em}
}{
    \par
    \clearpage
    \ifthenelse{\isundefined{\xmu@print}}{}{
        \thispagestyle{romanplain} % 使用专用样式
        \cleardoublepage
    }
}

%%%%%%%% 摘要 %%%%%%%%

% 中文摘要
\newenvironment{abstract}{
    \cleardoublepage % 强制从奇数页开始
    \thispagestyle{romanplain} % 设置页眉页脚
    \chapter*{摘\quad\; 要}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    \vspace{1em}
    \par
}{
    \par
    \vspace{1em}
    \noindent
    {\heiti \zihao{-4}关键词：}\xmu@keywords
    \def\xmu@inabstract{true}
    \clearpage
    \ifthenelse{\isundefined{\xmu@print}}{}{
        \thispagestyle{romanplain} % 使用专用样式
        \cleardoublepage
    }
}

% 英文摘要
\newenvironment{enabstract}{
    \cleardoublepage % 强制从奇数页开始
    \thispagestyle{romanplain} % 设置页眉页脚
    \let\xmu@inabstract\relax
    \chapter*{\bf Abstract}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    \vspace{1em}
    \par
}{
    \par
    \vspace{1em}
    \noindent
    {\bf\zihao{-4}Key Words: }\xmu@enkeywords
    \clearpage
    % \ifthenelse{\isundefined{\xmu@print}}{}{\cleardoublepage}
    \ifthenelse{\isundefined{\xmu@print}}{}{
        \thispagestyle{romanplain} % 使用专用样式
        \cleardoublepage
    }
}

%%%%%%%% 目录 %%%%%%%%

% 设置目录深度，只显示到 subsection
\setcounter{tocdepth}{2}

\renewcommand{\tableofcontents}{
    % 设置目录中的章节编号格式
    \ifthenelse{\isundefined{\xmu@arabicchapter}}{}{
        \ctexset{
            chapter={
                name={,},
                number=\arabic{chapter}
            }
        }
        \renewcommand{\enchapter}[1]{
            \addcontentsline{entoc}{chapter}{
                \protect\numberline{\thechapter}##1
            }
        }
    }

    % 中文目录
    \begin{center}
        \heiti \zihao{-3}目\quad\; 录
    \end{center}
    \vspace{1em}
    % 中文目录页脚
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    % 中文目录内容
    \vspace{1em}
    \@starttoc{toc}
    \clearpage

    \def\xmu@entoc{true}
    % 英文目录标题
    \begin{center}
        \bf\zihao{-3}Contents
    \end{center}
    \vspace{1em}
    % 英文目录页脚
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    % 英文目录内容
    \vspace{1em}
    \@starttoc{entoc}
    \clearpage
    \ifthenelse{\isundefined{\xmu@print}}{}{\cleardoublepage}

    % 定义目录后的页码格式为阿拉伯数字
    \pagenumbering{arabic}

    % 确保后续空白页应用正文页眉页脚
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[OC]{\rm\zihao{-5}\leftmark}  % 奇数页眉
    \fancyhead[EC]{\rm\zihao{-5}\xmu@title} % 偶数页眉
    \fancyfoot[C]{\rm\zihao{-5}\thepage}    % 页脚
}

% 定义英文目录相关指令
\newcommand{\enchapter}[1]{
    \addcontentsline{entoc}{chapter}{
        \protect\numberline{Chapter~\thechapter}#1
    }
}
\newcommand{\ensection}[1]{
    \addcontentsline{entoc}{section}{
        \protect\numberline{\thesection}#1
    }
}
\newcommand{\ensubsection}[1]{
    \addcontentsline{entoc}{subsection}{
        \protect\numberline{\thesubsection}#1
    }
}

% 定义中英双语目录相关指令
\newcommand{\xmuchapter}[2]{
    \chapter{#1}\enchapter{#2}
}
\newcommand{\xmusection}[2]{
    \section{#1}\ensection{#2}
}
\newcommand{\xmusubsection}[2]{
    \subsection{#1}\ensubsection{#2}
}

% 目录字体
% 一级标题
\titlecontents{chapter}[0pt]
{\ifthenelse{\isundefined{\xmu@entoc}}{\heiti}{\bf}\zihao{4}}
{\thecontentslabel\;}
{}
{\,\titlerule*{.}\contentspage}
% 二级标题
\titlecontents{section}[1\ccwd]
{\ifthenelse{\isundefined{\xmu@entoc}}{\heiti}{\bf}\zihao{-4}}
{\ifthenelse{\isundefined{\xmu@entoc}}{\thecontentslabel\;\;}{\thecontentslabel\;}}
{}
{\,\titlerule*{.}\contentspage}
% 三级标题
\titlecontents{subsection}[2\ccwd]
{\rm\zihao{-4}}
{\ifthenelse{\isundefined{\xmu@entoc}}{\thecontentslabel\;\,}{\thecontentslabel\,}}
{}
{\,\titlerule*{.}\contentspage}

%%%%%%%% 章节 %%%%%%%%

% 为 subsubsection 也启用编号
\setcounter{secnumdepth}{3}

% 章节标题字体
\titleformat{\chapter}{\heiti\zihao{-3}}{\ifthenelse{\isundefined{\xmu@arabicchapter}}{第\zhnumber{\thechapter} 章}{\thechapter}}{1em}{}
\titleformat{\section}{\heiti\zihao{4}}{\thesection}{0.5em}{}
\titleformat{\subsection}{\heiti\zihao{-4}}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\rm\zihao{-4}}{\thesubsubsection}{0.5em}{}

% 章节标题行间距
\titlespacing{\chapter}{\z@}{\z@}{4ex}
\titlespacing{\section}{\z@}{1.6ex \@plus 1.3ex \@minus 0ex}{1.3ex}
\titlespacing{\subsection}{\z@}{1.3ex \@plus 1ex \@minus 0ex}{1ex}
\titlespacing{\subsubsection}{\z@}{1ex \@plus 0.7ex \@minus 0ex}{0.7ex}

% 章节页眉、页脚
\renewcommand{\chapter}{
    \clearpage
    \ifthenelse{\isundefined{\xmu@inabstract}}{
        \ifthenelse{\isundefined{\xmu@print}}{}{\thispagestyle{fancy}\cleardoublepage}
    }{}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[OC]{\rm\zihao{-5}\leftmark}  %奇数页眉
    \fancyhead[EC]{\rm\zihao{-5}\xmu@title} %偶数页眉
    \fancyfoot[C]{\rm\zihao{-5}\thepage}    %页脚
    \global\@topnum\z@
    \secdef\@chapter\@schapter
}

%%%%%%%% 图表、公式、代码、算法 %%%%%%%%

% 图表目录
\graphicspath{{figures/}}
% 图表编号
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
% 图表字体
\DeclareCaptionFont{simsun5bf}{\bf\songti\zihao{5}}
\captionsetup[figure]{font=simsun5bf}
\captionsetup[table]{position=top,belowskip=2ex,font=simsun5bf}
\captionsetup[tabularx]{position=top,belowskip=2ex,font=simsun5bf}
% \captionsetup[tabular]{position=top,belowskip=2ex,font=simsun5bf}
\AtBeginEnvironment{figure}{\zihao{5}}
\AtBeginEnvironment{table}{\zihao{5}}
\AtBeginEnvironment{tabularx}{\zihao{5}}
% \AtBeginEnvironment{tabular}{\zihao{5}}
% 代码、算法字体
\AtBeginEnvironment{verbatim}{\par\renewcommand{\baselinestretch}{1.2}\zihao{5}}
\AtBeginEnvironment{algorithm}{\par\renewcommand{\baselinestretch}{1.2}\zihao{5}}
% 算法行距
\AtEndEnvironment{algorithm}{\vspace*{-0.5ex}}
\renewcommand{\interspacetitleruled}{1ex} % 算法标题和横线间距
\SetAlgoInsideSkip{smallskip}
\renewcommand{\algorithmcfname}{\quad\bf\songti 算法}
\setlength{\algomargin}{2em} % 设置算法缩进使得行号在线框内
%算法设置
\DontPrintSemicolon % 不打印分号
% 公式编号
\crefname{equation}{}{} % 设置非首字母大写的引用格式
\Crefname{equation}{}{} % 设置首字母大写的引用格式
\crefrangeformat{equation}{(#3#1#4)-(#5#2#6)}

%%%%%%%% 脚注 %%%%%%%%

% 脚注字体
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}
\renewcommand{\thempfootnote}{\ding{\numexpr171+\value{mpfootnote}}}
% \renewcommand{\thefootnote}{\textcircled{\rm\zihao{7}\arabic{footnote}}\;}
% \renewcommand{\thempfootnote}{\textcircled{\rm\zihao{7}\arabic{mpfootnote}}\;}
\renewcommand{\footnotesize}{\renewcommand{\baselinestretch}{1.15}\rm\zihao{-5}}
% 脚注线
\renewcommand{\footnoterule}{\vspace{1em}\hrule width 0.4\columnwidth height 0.4pt\vspace{0.3em}}
% 脚注缩进、行距
\renewcommand{\footnotesep}{1.2em}
\deffootnote[3ex]{3ex}{1em}{\zihao{7}\raisebox{0.4ex}{\rm\zihao{-5}\thefootnotemark}}

%%%%%%%% 参考文献 %%%%%%%%

\newenvironment{reference}{
    \ifthenelse{\isundefined{\xmu@print}}{}{\cleardoublepage}
}{
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[OC]{\rm\zihao{-5}参考文献}
    \fancyhead[EC]{\rm\zihao{-5}\xmu@title}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    \addcontentsline{toc}{chapter}{参考文献}
    \addcontentsline{entoc}{chapter}{References}
    \clearpage
}

\bibliographystyle{gbt7714-2005-numerical} % 参考文献格式 GB/T 7714-2005
\renewcommand{\bibfont}{\rm\zihao{5}} % 参考文献字体
\renewcommand{\bibsep}{0.5ex}         % 参考文献之间的间距

%%%%%%%% 附录 %%%%%%%%

\renewenvironment{appendix}{
    \chapter*{附\quad\; 录}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[OC]{\rm\zihao{-5}附\quad\; 录}
    \fancyhead[EC]{\rm\zihao{-5}\xmu@title}
    \fancyfoot[C]{\rm\zihao{-5}\thepage}
    \addcontentsline{toc}{chapter}{附录}
    \addcontentsline{entoc}{chapter}{Appendix}

    % 设置附录编号格式
    \renewcommand{\thefigure}{A-\arabic{figure}}
    \renewcommand{\thetable}{A-\arabic{table}}
    \renewcommand{\theequation}{A-\arabic{equation}}
    \renewcommand{\thesection}{A.\arabic{section}}
    \renewcommand{\thesubsection}{A.\arabic{section}.\arabic{subsection}}
    \renewcommand{\thesubsubsection}{A.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

    % 更新计数器
    \addtocounter{chapter}{1}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
}{
    \par
    \clearpage
}

\endinput
