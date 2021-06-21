set nocompatible
set number
set relativenumber
syntax on
colorscheme ron
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
filetype plugin on
filetype detect
filetype indent on
set foldmethod=indent
set foldlevel=20
set wrap linebreak nolist
set laststatus=2
let g:tex_flavor = "latex"

inoremap ;; <Esc>/<++><Enter>"_c4l

autocmd FileType tex inoremap ;s \documentclass[10pt,letterpaper]{article}<Enter><Enter>\edef\restoreparindent{\parindent=\the\parindent\relax}<Enter>\usepackage{parskip}<Enter>\restoreparindent<Enter>\usepackage[margin=1in]{geometry}<Enter>\usepackage{titlesec}<Enter>\titleformat{\section}{\LARGE\bfseries}{}{0em}{}<Enter><Enter>\title{<++>}<Enter>\author{Michael D. Allred}<Enter><Enter>\begin{document}<Enter><Enter>\maketitle<Enter><Enter>\section{<++>}<Enter><Enter><++><Enter><Enter>\end{document}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F}i
autocmd FileType tex inoremap ;i \textit{}<Space><++><Esc>F}i
autocmd FileType tex inoremap ;u \underline{}<Space><++><Esc>F}i
autocmd FileType tex inoremap ;p \parencite{}.<Space><++><Esc>F}i
autocmd FileType tex inoremap ;P \parencite{<++>}.<Space><++><Esc>?usepackage<Enter>o\usepackage[backend=biber,style=apa,autocite=inline]{biblatex}<Enter>\addbibresource{<++>}<Esc>/end{document}<Enter>O<Enter>\printbibliography<Enter><Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;1 <Enter>\section{<++>}<Enter><Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;2 <Enter>\subsection{<++>}<Enter><Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;3 <Enter>\subsubsection{<++>}<Enter><Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;f \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>\label{<++>}}<Enter>\end{figure}<Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;F \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>\label{<++>}}<Enter>\end{figure}<Enter><++><Esc>?usepackage<Enter>o\usepackage{graphicx}<Enter>\usepackage{float}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;e \begin{enumerate}[noitemsep]<Enter>\item<Space><++><Enter>\end{enumerate}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;E \begin{enumerate}[noitemsep]<Enter>\item<Space><++><Enter>\end{enumerate}<Esc>/usepackage<Enter>o\usepackage{enumitem}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;l \begin{itemize}[noitemsep]<Enter>\item<Space><++><Enter>\end{itemize}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;L \begin{itemize}[noitemsep]<Enter>\item<Space><++><Enter>\end{itemize}<Esc>/usepackage<Enter>o\usepackage{enumitem}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;I \item<Space>
autocmd FileType tex inoremap ;c \begin{multicols}{<++>}<Enter><++><Enter>\end{multicols}<Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;C \begin{multicols}{<++>}<Enter><++><Enter>\end{multicols}<Esc>/usepackage<Enter>o\usepackage{multicol}<Esc>/<++><Enter>"_c4l
