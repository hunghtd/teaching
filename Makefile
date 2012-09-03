#!/usr/bin/make

all: $(patsubst %.tex,%.pdf,$(wildcard *.tex)) 
pdf: all

%.pdf: %.tex
	rubber -fd $<

clean: 
	rubber -d --clean *.tex
	rm -f *.tmp
	rm -f vc

viewpdf: all
	evince *.pdf

spell:
	aspell -c -t --tex-check-comments -b text.tex

vc:
	vc-git

.PHONY: clean all
