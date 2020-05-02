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
	--js node_modules/google-closure-library/closure/**.js \
	--js node_modules/google-closure-library/third_party/closure/**.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/soyutils_usegoog.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/soyutils_velog.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/soyutils_idom.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/api_idom.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/element_lib_idom.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/checks.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/global.js \
	--js thirdparty/soy-2019-10-08-jssrc_js/skiphandler.js \
	--js thirdparty/protobuf-3.11.4/js/map.js \
	--js thirdparty/protobuf-3.11.4/js/message.js \
	--js "thirdparty/protobuf-3.11.4/js/binary/*.js" \
	--js "!thirdparty/protobuf-3.11.4/js/binary/*_test.js" \
	--js shim/xid.js \
	--js shim/tslib.js \
	--js shim/incremental-dom.js \
	--js node_modules/tslib/tslib.js \
	--js node_modules/incremental-dom/dist/incremental-dom-cjs.js \
	--js $^ \
	--entry_point index.js \
	--module_resolution NODE \
	--process_common_js_modules \
	--package_json_entry_names main \
	--compilation_level ADVANCED_OPTIMIZATIONS \
	--js_output_file $@ \
	--create_source_map $@.map
