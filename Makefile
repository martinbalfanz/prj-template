# GNU Make rules for various tasks

usage:
	@echo "usage: make css    -- generate css file from less sources"
	@echo "                      => needs node.js & less module installed"
	@echo "       make build  -- create static files and cleanup"
	@echo "                      => needs to be executed from within virtualenv"
	@echo "       make clear  -- clear generated files & backups"
	@echo "                      => static/css/style.css"
	@echo "                      => *~"
	@echo "                      => *#"
	@echo "                      => .DS_Store"

css:
	rm -f static/css/style.css
	mkdir -p static/css
	lessc static/less/layout.less > static/css/style.css
	java -jar bin/yuicompressor-2.4.6.jar --type css --charset utf-8 -o static/css/style.css static/css/style.css

build:clear css
	python freeze.py
	rm -f build/static/js/debug.js
	rm -f build/static/js/lib/less*.js
	rm -rf build/static/less

clear:
	rm -rf build/
	rm -f static/css/style.css
	find . -iname "*~" -delete
	find . -iname "*#" -delete
	find . -iname ".DS_Store" -delete