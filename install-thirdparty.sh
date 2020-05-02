SOY_VERSION=2019-10-08
CLOSURE_COMPILER_VERSION=20200406
PROTOBUF_VERSION=3.11.4

mkdir thirdparty
curl "https://repo1.maven.org/maven2/com/google/template/soy/$SOY_VERSION/soy-$SOY_VERSION-SoyToIncrementalDomSrcCompiler.jar" -o thirdparty/soy-$SOY_VERSION-SoyToIncrementalDomSrcCompiler.jar
curl "https://repo1.maven.org/maven2/com/google/template/soy/$SOY_VERSION/soy-$SOY_VERSION-jssrc_js.jar" -o thirdparty/soy-$SOY_VERSION-jssrc_js.jar
curl "https://repo1.maven.org/maven2/com/google/javascript/closure-compiler/v$CLOSURE_COMPILER_VERSION/closure-compiler-v$CLOSURE_COMPILER_VERSION.jar" -o thirdparty/closure-compiler-v$CLOSURE_COMPILER_VERSION.jar
curl -L "https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOBUF_VERSION/protobuf-js-$PROTOBUF_VERSION.tar.gz" -o thirdparty/protobuf-js-$PROTOBUF_VERSION.tar.gz

cd thirdparty
tar xzvf protobuf-js-$PROTOBUF_VERSION.tar.gz
unzip soy-$SOY_VERSION-jssrc_js.jar -d soy-$SOY_VERSION-jssrc_js
