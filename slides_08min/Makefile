.DEFAULT_GOAL := all

all: compile clean compile-script

compile:
	rm -f *.pdf

	sed '3 c\
	\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
	sed '3 c\
	\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
	sed '3 c\
	\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
	sed '3 c\
	\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"

clean: 
	rm -f  *.aux *.log *.nav *.out *.snm *.synctex.gz "*.synctex(busy)" *.toc log.txt

compile-script:
	pandoc -f markdown -t html script.md -so script.html --metadata pagetitle="CollegeApplication script"
