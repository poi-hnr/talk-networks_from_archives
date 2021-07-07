rmd=$(wildcard *.Rmd)

rscript=Rscript
rscript_flags=

default: $(rmd:.Rmd=.html)

%.html: %.Rmd
	$(rscript) $(rscript_flags) -e 'rmarkdown::render("$<")'

publish: docs/index.html

docs/index.html: nfa.html
	cp $< $@

.PHONY: default publish
