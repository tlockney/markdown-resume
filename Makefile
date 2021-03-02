all: resume.html resume.pdf resume.docx

resume.html: resume.md 
	pandoc -s --css resume-css-stylesheet.css --to=html5 --metadata title="Thomas Lockney" -o $@ $<
	cp resume.html dist

resume.pdf: dist/resume.html
	wkhtmltopdf --enable-local-file-access $< $@
	cp resume.pdf dist

resume.docx: resume.md
	pandoc --reference-doc=resume-docx-reference.docx --metadata title="Thomas Lockney" -o $@ $<
	cp resume.docx dist

publish: resume.docx resume.pdf resume.html
	mkdir -p dist
	cp resume-css-stylesheet.css resume.docx resume.pdf dist
	cp resume.html dist/index.html
	git subtree push --prefix dist origin gh-pages

clean:
	rm -rf resume.html resume.pdf resume.docx