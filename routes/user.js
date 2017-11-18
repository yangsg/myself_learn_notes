const libutil = require('../lib/libutil.js');

exports.index = index;

function index(req, res, next) {
  res.send(libutil.getUuid());
}

