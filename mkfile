<./latex.mk
<./spell.mk
<./bbl.$USER.mk


TGT=dfopt

all:V: $TGT.pdf $TGT.ps supplement.pdf
bib:V: $TGT.bbl
dvi:V: $TGT.dvi
bbl:V: bib

dfopt.dvi: dfopt.bbl code.sty timestamp.tex

$TGT.pdf: $TGT.dvi
	dvips -Ppdf -o"|ps2pdf - $target" -pp 1-12 $prereq

supplement.pdf: $TGT.dvi
	dvips -Ppdf -o "|ps2pdf - $target" -pp 13- $prereq

timestamp.tex: $TGT.tex
	date=`stat -c "%y" $prereq`
	date -d "$date" "+\\textbf{\\uppercase{%A} %l:%M %p}" > $target


