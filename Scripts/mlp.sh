#!/bin/bash
## Make LaTeX PDF

## Pull out the file name
file=$(echo $1 | cut -d '.' -f 1)

## Compiles the PDF, runs three times to generate correct ToC page numbers
pdflatex $file.tex -halt-on-error
biber $file 
pdflatex $file.tex -halt-on-error
pdflatex $file.tex -halt-on-error

## Removes unwanted files
## -aux-directorys=/tmp does not work on Linux
[[ -e $file.aux ]] && rm $file.aux
[[ -e $file.bbl ]] && rm $file.bbl
[[ -e $file.bcf ]] && rm $file.bcf
[[ -e $file.blg ]] && rm $file.blg
[[ -e $file.log ]] && rm $file.log
[[ -e $file.xml ]] && rm $file.xml
[[ -e $file.nav ]] && rm $file.nav
[[ -e $file.out ]] && rm $file.out
[[ -e $file.snm ]] && rm $file.snm
[[ -e $file.toc ]] && rm $file.toc

## Display the compiled PDF in the correct mode
[[ -n "$(head -n 1 $file.tex | grep beamer)" ]] && zathura $file.pdf --mode=presentation &
[[ -n "$(head -n 1 $file.tex | grep article)" ]] && setsid zathura $file.pdf &
