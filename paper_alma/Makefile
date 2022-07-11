.DEFAULT_GOAL := all

all: compile clean

compile:
	rm -f *.pdf

	pdflatex paper.tex -no-parse-first-line -jobname="paper-en"
	pdflatex paper.tex -no-parse-first-line -jobname="paper-en"

clean: 
	rm -f  *.aux *.log *.nav *.out *.snm *.synctex.gz "*.synctex(busy)" *.toc *.run.xml *.bcf log.txt

