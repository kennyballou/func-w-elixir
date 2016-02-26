.PHONY: all clean

all: func-w-elixir.pdf

%.pdf: src/%.tex
	@make -C src/ $@
	@cp src/$@ .

clean:
	@make -C src/ clean
	@rm -f *.pdf
