# Soy Idom App
Example of webapp using Incremental DOM backended Closure Templates (Soy)

## How to install
1. Download following dependencies to `/thridparty`
   * closure-compiler-v20200406.jar from Maven Central
   * soy-2019-10-08-jssrc_js.jar from Maven Central
   * soy-2019-10-08-SoyToIncrementalDomSrcCompiler.jar from Maven Central
   * protobuf-js-3.11.4.tar.gz from Github releases
1. Unzip protobuf-js-3.11.4.tar.gz and soy-2019-10-08-jssrc_js.jar as subdirectories of `/thridparty`
1. Run `npm install`

## How to build
Run `make`

## How to run
1. Run `python -m SimpleHTTPServer 8000`
2. Open http://localhost:8000
