SOURCE := resume.rst

all:	README.rst resume.pdf

commit: clean README

README.rst: ${SOURCE}
	cp ${SOURCE} $@
	echo -e '\n----\n' >> $@
	echo 'Generated with `dmr <https://github.com/stpierre/dmr>`_' >> \
	    $@

resume.tex:  ${SOURCE}
	dmr -c ./dmr.conf -f latex -o $@ ${SOURCE}

resume.html:   ${SOURCE}
	dmr -c ./dmr.conf -f html -o $@ ${SOURCE}

resume.txt:	${SOURCE}
	dmr -c ./dmr.conf -f text -o $@ ${SOURCE}

resume.json:	${SOURCE}
	dmr -c ./dmr.conf -f json -o $@ ${SOURCE}

resume.pdf:	resume.tex
	pdflatex $<

cleanpdf:
	rm -rf resume.tex resume.log resume.out resume.aux

clean:	cleanpdf
	rm -rf resume.html resume.pdf resume.json resume.txt
