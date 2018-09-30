SRC  := $(wildcard csd-*.adoc)
XML  := $(patsubst %.adoc,%.xml,$(SRC))
PDF  := $(patsubst %.adoc,%.pdf,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))

SHELL := /bin/bash

all: $(HTML) $(XML) $(PDF)

clean:
	rm -f $(HTML) $(XML) $(PDF)

bundle:
	bundle

%.xml %.html %.pdf: %.adoc bundle
	bundle exec metanorma -t csd -x xml,html,pdf $<

html: $(HTML)

open:
	open $(HTML)

.PHONY: bundle all open
