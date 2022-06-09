.DEFAULT_GOAL := all

all: compile clean

compile:
	rm -f *.pdf

	sed '3 c\
	\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname="paper-en"
	sed '3 c\
	\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname="paper-ko"
	sed '3 c\
	\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname="paper-en"
	sed '3 c\
	\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname="paper-ko"

clean: 
	rm -f  *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc

