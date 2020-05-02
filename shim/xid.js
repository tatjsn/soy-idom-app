goog.module('xid');
goog.module.declareLegacyNamespace();

function xid(str) {
  return 'xid-' + str;
}

exports = xid;
