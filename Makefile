resume.html: resume.md resume-css-stylesheet.css
	pandoc -s --css resume-css-stylesheet.css --to=html5 -o resume.html resume.md

resume.pdf: resume.html
	wkhtmltopdf resume.html resume.pdf

resume.docx: resume.md
	pandoc -o resume.docx --reference-doc=resume-docx-reference.docx resume.md