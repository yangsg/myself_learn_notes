'use strict';
const libutil = require('../lib/libutil.js');

exports.index = index;

function index(req, res) {
  res.send(libutil.getUuid());
}

