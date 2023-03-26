.DEFAULT_GOAL := all

all: compile clean

compile:
	rm -f *.pdf

	pdflatex -no-parse-first-line wrapper-article.tex
	biber wrapper-article
	pdflatex -no-parse-first-line wrapper-article.tex
	pdflatex -no-parse-first-line wrapper-article.tex
	mv wrapper-article.pdf paper-en.pdf

clean: 
	rm -f *.aux *.log *.nav *.out *.snm *.synctex.gz "*.synctex(busy)" *.toc log.txt
	rm -f *.bbl *.bcf *.blg *.run.xml

compileapa:
	rm -f *.pdf

	pdflatex -no-parse-first-line wrapper-apa.tex
	biber wrapper-apa
	pdflatex -no-parse-first-line wrapper-apa.tex
	pdflatex -no-parse-first-line wrapper-apa.tex
	mv wrapper-apa.pdf paper-en.pdf
	
compileinforms:
	@echo "This job requires the files endnotes.sty, informs3.cls, and informs2014.bst from the INFORMS journal template."
	pdflatex -no-parse-first-line wrapper-informs.tex
	bibtex wrapper-informs
	pdflatex -no-parse-first-line wrapper-informs.tex
	pdflatex -no-parse-first-line wrapper-informs.tex
	mv wrapper-informs.pdf paper-en-informs.pdf
