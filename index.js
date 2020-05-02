goog.module('tatjsn.app');

var api = goog.require('google3.javascript.template.soy.api_idom');
var simple = goog.require('soy.examples.simple.incrementaldom');
var renderer = new api.IncrementalDomRenderer();

function renderPart() {
  simple.helloWorld(renderer);
}

api.patch(document.getElementById('app'), renderPart, {});
