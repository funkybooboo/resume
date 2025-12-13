resume.pdf: resume.tex
	tectonic resume.tex

clean:
	rm -f *.pdf *.aux *.bcf *.log *.run.xml *.synctex.gz *.bal *.blg *.fdb_latexmk *.fls *.bbl *.out

view: resume.pdf
	xdg-open resume.pdf
