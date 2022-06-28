.DEFAULT_GOAL := all

all: compile clean

compile:
	rm -f *.pdf

	pdflatex -no-parse-first-line -jobname="paper-en" paper.tex
	pdflatex -no-parse-first-line -jobname="paper-en" paper.tex

clean: 
	rm -f  *.aux *.log *.nav *.out *.snm *.synctex.gz "*.synctex(busy)" *.toc log.txt

