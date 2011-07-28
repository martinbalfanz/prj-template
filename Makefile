# GNU Make rules for various tasks

usage:
	@echo "usage: make css    -- generate css file from less sources"
	@echo "                      => needs node.js & less module installed"
	@echo "       make clear  -- clear generated files & backups"
	@echo "                      => static/css/style.css"
	@echo "                      => *~"
	@echo "                      => .DS_Store"

css:
	rm -f static/css/style.css
	mkdir -p static/css
	lessc -x static/less/layout.less > static/css/style.css

clear:
	rm -f static/css/style.css
	find . -iname "*~" -delete
	find . -iname ".DS_Store" -delete