# Auto-generated by Cimas: Do not edit it manually!
# See https://github.com/metanorma/cimas
#!make
ifeq ($(OS),Windows_NT)
SHELL := pwsh -NoProfile
else
SHELL := /bin/bash
endif

SRC := $(wildcard views/*.lutaml)

ifeq ($(SRC),)
SRC := $(patsubst models/%.wsd,views/%.lutaml,$(wildcard models/*.wsd))
endif

PNG := $(patsubst views/%.lutaml,images/%.png,$(SRC))

all: $(PNG)

images/%.png: views/%.lutaml
	lutaml -t png -o $@ $<

views/%.lutaml: models/%.wsd | views
	lutaml-wsd2uml $< > $@

views:
	mkdir views

clean:
ifeq ($(OS),Windows_NT)
	if (Test-Path images/*.png) { rm -r -force images/*.png }
else
	rm -f images/*.png
endif

.PHONY: clean
