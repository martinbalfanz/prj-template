# GNU Make rules for various tasks

usage:
	@echo "usage: make run    -- run testing environment"
	@echo "       make css    -- generate css file from scss sources"
	@echo "                      => needs scss gem intalled"
	@echo "       make static -- create static files and cleanup"
	@echo "                      => needs to be executed from within virtualenv"
	@echo "       make clear  -- clear generated files & backups"
	@echo "                      => static/css/style.css"
	@echo "                      => *~"
	@echo "                      => *#"
	@echo "                      => .DS_Store"

run:
	foreman start

css:
	rm -f static/css/style.css
	mkdir -p static/css
	sass --scss -E utf-8 static/scss/layout.scss:static/css/style.css
	java -jar bin/yuicompressor-2.4.6.jar --type css --charset utf-8 -o static/css/style.css static/css/style.css

static:clear
	sass --scss -E utf-8 static/scss/layout.scss:static/css/style.css
	python freeze.py
	rm -f build/static/js/debug.js
	rm -rf build/static/scss
	rm -f build/static/css/*
	java -jar bin/yuicompressor-2.4.6.jar --type css --charset utf-8 -o build/static/css/style.css static/css/style.css

clear:
	rm -rf build/
	rm -f static/css/style.css
	find . -iname "*~" -delete
	find . -iname "*#" -delete
	find . -iname ".DS_Store" -delete