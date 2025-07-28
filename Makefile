resume.pdf: resume.tex russell.cls
	tectonic resume.tex

clean:
	rm -f *.pdf *.aux *.bcf *.log *.run.xml *.synctex.gz *.bal *.blg *.fdb_latexmk *.fls *.bbl

view: resume.pdf
	open resume.pdf
