# Paper
sed '3 c\
\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
sed '3 c\
\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko
sed '3 c\
\\newif\\ifen\\entrue' paper.tex  | pdflatex -no-parse-first-line -jobname=paper-en
sed '3 c\
\\newif\\ifen\\enfalse' paper.tex | pdflatex -no-parse-first-line -jobname=paper-ko

# Slides
cd ./slides_20min
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
cd ..

cd ./slides_08min
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
sed '3 c\
\\newif\\ifen\\entrue' slides.tex  | pdflatex -no-parse-first-line -jobname="slides-en"
sed '3 c\
\\newif\\ifen\\enfalse' slides.tex | pdflatex -no-parse-first-line -jobname="slides-ko"
cd ..

