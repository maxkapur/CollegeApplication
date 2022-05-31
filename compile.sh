# Paper

# Helps spot errors
rm *.pdf
rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc

sed '3 c\
\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
sed '3 c\
\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko
sed '3 c\
\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
sed '3 c\
\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko

rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc




# Slides
cd ./slides_15min

# Helps spot errors
rm *.pdf
rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"

rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc

cd ..

cd ./slides_08min

# Helps spot errors
rm *.pdf
rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"

rm *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc

cd ..

