#!/bin/bash
## Make LaTeX PDF

## Compiles the PDF
pdflatex $1.tex -halt-on-error
biber $1 
pdflatex $1.tex -halt-on-error

## Removes unwanted files
## -aux-directorys=/tmp does not work on Linux
rm *.aux *.bbl *.bcf *.blg *.log *.run.xml

## Display the compiled PDF only if not already running
test -n "$(ps | grep zathura)" && sleep 0 || zathura $1.pdf &
