# Compilation d'article Latex
# PH oct 2014
TEXFILE = PVbat_optim
TEXOPTS = ''


### Spell checking
spellcheck: $(TEXFILE).tex
	aspell --encoding=utf-8 --lang=en_US.UFT-8 -c  $(TEXFILE).tex


### PDF presentation:
pdf: $(TEXFILE).pdf

# Compilation
$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXOPTS) $(TEXFILE)
	bibtex $(TEXFILE)
	pdflatex $(TEXOPTS) $(TEXFILE)
	pdflatex $(TEXOPTS) $(TEXFILE)


### Cleaning the build files:

# Removes just the logs and auxilliary files:
mostlyclean: 
	rm -fv *.aux *.idx *.log *.toc *.blg *.bbl *.synctex.gz *.out *.brf *.tex.backup *.snm *.nav

# Removes all outputs (e.g. PDF)
clean: mostlyclean
	rm -fv $(TEXFILE).pdf

### Upload presentation to remote server
push:
	rsync -av $(TEXFILE).pdf eole:www
