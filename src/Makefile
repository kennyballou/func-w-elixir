.PHONY: all clean

all: func-w-elixir.pdf

%.pdf: %.tex references.bib
	@xelatex -halt-on-error $<
	@bibtex $(basename $<).aux
	@xelatex -halt-on-error $<
	@xelatex -halt-on-error $<

clean:
	@rm --force *.nav \
				*.log \
				*.out \
				*.pdf \
				*.toc \
				*.snm \
				*.aux \
				*.bbl \
				*.blg \
				*.vrb
