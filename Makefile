SOURCE=resume.rst

all:	README latex html txt json pdf

commit: clean README

README: ${SOURCE}
	cp ${SOURCE} README.rst
	echo -e '\n----\n' >> README.rst
	echo 'Generated with `dmr <https://github.com/stpierre/dmr>`_' >> \
	    README.rst

latex:  ${SOURCE}
	dmr -f latex -o resume.tex ${SOURCE}

html:   ${SOURCE}
	dmr -f html -o resume.html ${SOURCE}

txt:	${SOURCE}
	dmr -f text -o resume.txt ${SOURCE}

json:	${SOURCE}
	dmr -f json -o resume.json ${SOURCE}

pdf:	latex
	pdflatex resume.tex

cleanpdf:
	rm -rf resume.tex resume.log resume.out resume.aux

clean:	cleanpdf
	rm -rf resume.html resume.pdf README resume.json resume.txt
