#!/usr/bin/make

all: $(patsubst %.tex,%.pdf,$(wildcard *.tex)) 
pdf: all

%.pdf: %.tex
	perl -p -e 's/©//' refs.bib > refs-cleaned.bib
	recode -d u8..ltex < refs-cleaned.bib > refs-processed.bib
	rubber -fd $<

clean: 
	rubber -d --clean *.tex
	rm -f *.tmp
	rm -f vc
	rm -f refs-cleaned.bib
	rm -f refs-processed.bib

viewpdf: all
	evince *.pdf

spell:
	aspell -c -t --tex-check-comments -b text.tex

vc:
	vc-git

.PHONY: clean all
