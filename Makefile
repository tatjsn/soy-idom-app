.PHONY: install

all: dist/index.js

install:
	sh install-thirdparty.sh
	npm install
	mkdir -p build
	mkdir -p dist

build/%.idom.soy.js: %.soy
	java -jar thirdparty/soy-2019-10-08-SoyToIncrementalDomSrcCompiler.jar \
	--srcs $< \
	--outputDirectory build

dist/index.js: index.js build/simple.idom.soy.js
	java -jar thirdparty/closure-compiler-v20200406.jar \
	--js "node_modules/google-closure-library/closure/goog/**.js" \
	--js "node_modules/google-closure-library/third_party/closure/goog/**.js" \
	--js "thirdparty/soy-2019-10-08-jssrc_js/*.js" \
	--js "!thirdparty/soy-2019-10-08-jssrc_js/required_by_soy.js" \
	--js "!thirdparty/soy-2019-10-08-jssrc_js/soy_requirements_onefile.js" \
	--js thirdparty/protobuf-3.11.4/js/map.js \
	--js thirdparty/protobuf-3.11.4/js/message.js \
	--js "thirdparty/protobuf-3.11.4/js/binary/*.js" \
	--js "!thirdparty/protobuf-3.11.4/js/binary/*_test.js" \
	--js "shim/*.js" \
	--js node_modules/tslib/package.json \
	--js node_modules/tslib/tslib.js \
	--js node_modules/incremental-dom/package.json \
	--js node_modules/incremental-dom/dist/incremental-dom-cjs.js \
	--js $^ \
	--entry_point $< \
	--module_resolution NODE \
	--process_common_js_modules \
	--package_json_entry_names main \
	--compilation_level ADVANCED_OPTIMIZATIONS \
	--dependency_mode PRUNE \
	--js_output_file $@ \
	--create_source_map $@.map \
	--hide_warnings_for node_modules \
	--language_out ECMASCRIPT_2018 \
	--define goog.DEBUG=false
