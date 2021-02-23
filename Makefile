all: clean resume.html resume.pdf resume.docx

resume.html: resume.md resume-css-stylesheet.css
	pandoc -s --css resume-css-stylesheet.css --to=html5 -o $@ $<

resume.pdf: resume.html
	wkhtmltopdf $< $@

resume.docx: resume.md resume-docx-reference.docx
	pandoc --reference-doc=resume-docx-reference.docx -o $@ $<

clean:
	rm -rf resume.html resume.pdf resume.docx