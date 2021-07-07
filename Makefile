rmd=$(wildcard *.Rmd)

rscript=Rscript
rscript_flags=

default: $(rmd:.Rmd=.html)

%.html: %.Rmd
	$(rscript) $(rscript_flags) -e 'rmarkdown::render("$<")'

nfa.html: logo-ieg.png

index.html: nfa.html
	cp $< $@

logo-ieg.png: logo-ieg-src.png
	convert $< -resize 100x $@

publish:index.html

.PHONY: default publish
