COMPILER = ./node_modules/uglify-js/bin/uglifyjs
LINT = ./node_modules/jshint/bin/hint

SOURCES = src/preamble.js \
			src/types.js \
			src/utils.js \
			src/factory.js \
			src/geometry.js \
			src/geometries/point.js \
			src/geometries/linearring.js \
			src/geometries/linestring.js \
			src/geometries/polygon.js \
			src/geometries/multipolygon.js \
			src/geometry_collection.js


all: wkb.js wkb.min.js

wkb.js: $(SOURCES)
	cat $(filter %.js, $^) > $@

wkb.min.js: wkb.js
	$(COMPILER) $^ > $@

lint: $(SOURCES)
	$(LINT) $(filter %.js, $^)

dep:
	npm install

test: wkb.js
	open test/index.html

.PHONY: lint all dep
