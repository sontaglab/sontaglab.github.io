cp ~sontag/grants/make_publications.tex .
cp  ~sontag/grants/publication_list.bib .
chmod u+w make_publications.tex
chmod u+w publication_list.bib
pdflatex make_publications.tex
bibtex make_publications > log-bibtex
pdflatex make_publications.tex
pdflatex make_publications.tex
mv make_publications.pdf sontag_all_publications.pdf
/bin/rm *.log *.aux *.blg *.bbl
python3 ~/pythondir/bibtex2html.py publication_list.bib --site PUBDIR
echo "now protecting"
chmod -R a+rx *;chmod -R o-w *
echo "done; check log-bibtex now:"
cat log-bibtex
