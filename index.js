import api from 'goog:google3.javascript.template.soy.api_idom';
import simple from 'goog:soy.examples.simple.incrementaldom';

const renderer = new api.IncrementalDomRenderer();

function renderPart() {
  simple.helloWorld(renderer);
}

api.patch(document.getElementById('app'), renderPart, {});
