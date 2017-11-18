var express = require('express');
var router = express.Router();

const libutil = require('../lib/libutil.js');

/* GET users listing. */
router.get('/', function(req, res, next) {
  //res.send('respond with a resource');
  res.send(libutil.getUuid());
});

module.exports = router;
