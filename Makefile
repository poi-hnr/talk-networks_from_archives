rmd=$(wildcard *.Rmd)

rscript=Rscript
rscript_flags=

convert=$(rscript) convert.R

default: $(rmd:.Rmd=.html)

%.html: %.Rmd
	$(rscript) $(rscript_flags) -e 'rmarkdown::render("$<")'

nfa.html: photo-demi.png photo-agata.png photo-michal.png logo-ieg.png logo-ku.png logo-ih.png o1.jpg o2.jpg $(wildcard css/*.css)

index.html: nfa.html
	cp $< $@

logo-ieg.png: logo-ieg-src.png
	$(convert) --resize x160 $< $@

logo-ku.png: logo-ku-src.jpeg
	$(convert) --resize x160 $< $@

logo-ih.png: logo-ih-src.png
	$(convert) --resize x160 $< $@

photo-demi.png: photo-demi-src.jpg
	$(convert) --resize 100x $< $@

photo-agata.png: photo-agata-src.jpg
	$(convert) --resize 100x $< $@

photo-michal.png: photo-michal-src.png
	$(convert) --resize 100x $< $@

o1.jpg: original-letter1.jpg
	Rscript convert.R --resize x450 $< $@

o2.jpg: original-letter2.jpg
	Rscript convert.R --resize x450 $< $@



publish: index.html

.PHONY: default publish
