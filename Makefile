PRINCE = prince/lib/prince/bin/prince
LATEX = pdflatex
PYTHON3 = python3

define newline


endef

fileord := $(filter-out #%,$(subst $(newline), ,$(file < file_ord.txt)))

codebook.pdf: codebook3.pdf
	qpdf --pages codebook3.pdf 1-25 -- codebook3.pdf codebook.pdf

.PHONY: clean
clean:
	rm -f cksum.* *.aux *.log *.out *.toc tmp_source.*
	rm -f codebookpart2.html codebookpart2.pdf codebook3.tex codebook3.pdf codebook.pdf

codebookpart2.html: header.html $(filter %.c %.cpp %.py %.h %.hpp %.sh,$(fileord))
	$(PYTHON3) create_codebook2.py

codebookpart2.pdf: codebookpart2.html
	$(PRINCE) codebookpart2.html -o codebookpart2.pdf

codebook3.tex: $(filter %.tex,$(fileord))
	@echo $^
	$(PYTHON3) create_codebook3.py

codebook3.pdf: codebookpart2.pdf codebook3.tex
	for i in 1 2 ; do \
		yes '' | $(LATEX) --shell-escape codebook3.tex >/dev/null ;\
	done

