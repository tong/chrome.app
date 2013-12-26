
##
## chrome-app
##

PROJECT=chrome-app
SRC=chrome/*.hx chrome/app/*.hx chrome/system/*.hx

all: haxedoc.xml

haxedoc.xml: $(SRC)
	haxe haxedoc.hxml

$(PROJECT).zip: haxedoc.xml $(SRC)
	zip -r $@ chrome/ extraParams.hxml haxedoc.hxml haxelib.json README.md

install: $(PROJECT).zip
	haxelib install $(PROJECT).zip

uninstall:
	haxelib remove $(PROJECT)

clean:
	rm -f $(PROJECT).zip haxedoc.xml

.PHONY: install uninstall clean
	