TOPDIR := $(shell pwd)
TOPDIR_BASE := $(notdir $(TOPDIR))

# GNUPLOT_TERMINAL := epslatex color solid
GNUPLOT_TERMINAL := epslatex color
GNUPLOT := gnuplot  
MKOCTFILE := mkoctfile
OCTAVE := octave
OCTAVE_FLAGS := --silent
EPSTOPDF := epstopdf
PDFVIEWER := evince

TEX_SRCS := Abstract.tex AcksPage.tex  BibliographyPage.tex  ContentsPage.tex  CopyrightPage.tex  DedicationPage.tex  DraftTitlePage.tex  IndexPage.tex  TitlePage.tex VitaPage.tex

TEXSUFFIXES := .pdf .aux .log .bbl .blg .out .fgx .tbx .vdx .ind .idx .ilg .lof .lot .toc

TEX_BASES := $(basename $(TEX_SRCS))
FILES_CLEANED := $(foreach f, $(TEXSUFFIXES), $(addsuffix $f, $(TEX_BASES)))

## Targets
all:
	@echo $(TOPDIR_BASE)
	@echo $(FILES_CLEANED)
.PHONY: all

## Three levels of clean -- clean, datclean, matclean
clean:
	rm -f $(FILES_CLEANED)
	rm -f $(shell find -name "*~")
.PHONY: clean

