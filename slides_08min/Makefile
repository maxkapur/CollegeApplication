.DEFAULT_GOAL := all

all: compile clean

compile:
	rm -f *.pdf

	sed '3 c\
	\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
	sed '3 c\
	\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
	sed '3 c\
	\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
	sed '3 c\
	\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"

clean: 
	rm -f  *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc
