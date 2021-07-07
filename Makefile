rmd=$(wildcard *.Rmd)

rscript=Rscript
rscript_flags=

default: $(rmd:.Rmd=.html)

%.html: %.Rmd
	$(rscript) $(rscript_flags) -e 'rmarkdown::render("$<")'

nfa.html: $(wildcard logo-*.png) $(wildcard css/*.css)

index.html: nfa.html
	cp $< $@

logo-ieg.png: logo-ieg-src.png
	convert $< -resize x160 $@

logo-ku.png: logo-ku-src.jpeg
	convert $< -resize x160 $@

logo-ih.png: logo-ih-src.png
	convert $< -resize x160 $@

publish:index.html

.PHONY: default publish
