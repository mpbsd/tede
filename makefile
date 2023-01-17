TEX_ENGINE = xelatex
BIB_ENGINE = bibtex
OPR_SYSTEM = $(shell uname -s)

ifeq ($(OPR_SYSTEM), Darwin)
	DOC_VIEWER = open -a Preview
else
	DOC_VIEWER = zathura
endif

draft:
	$(TEX_ENGINE) main
	$(TEX_ENGINE) main
	$(DOC_VIEWER) main.pdf

final:
	$(TEX_ENGINE) main
	$(BIB_ENGINE) main
	$(TEX_ENGINE) main
	$(TEX_ENGINE) main
	$(DOC_VIEWER) main.pdf

clean:
	find . -type f -name main.aux | xargs rm -rf
	find . -type f -name main.loa | xargs rm -rf
	find . -type f -name main.loc | xargs rm -rf
	find . -type f -name main.lof | xargs rm -rf
	find . -type f -name main.log | xargs rm -rf
	find . -type f -name main.lot | xargs rm -rf
	find . -type f -name main.out | xargs rm -rf
	find . -type f -name main.pdf | xargs rm -rf
	find . -type f -name main.toc | xargs rm -rf

.PHONY: draft final clean
