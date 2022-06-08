.DEFAULT_GOAL := all

all: compile_paper clean_paper compile_clean_slides

compile_paper:
	rm -f *.pdf

	sed '3 c\
	\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
	sed '3 c\
	\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko
	sed '3 c\
	\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
	sed '3 c\
	\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko

clean_paper: 
	rm -f *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc

compile_clean_slides:
	make -C ./slides_08min
	make -C ./slides_08min
	make -C ./slides_08min
