'use strict';
const libutil = require('../lib/libutil.js');

exports.index = index;

function index(req, res) {
  res.send(libutil.getUuid());
}

//app.get('/users/list', routes.user.index);
function list(req, res) {
  res.send(libutil.getUuid());
}

//app.get('/user/update_input_form/:id', routes.user.info);
function info(req, res) {
  res.send(libutil.getUuid());
}

//app.post('/users/add', routes.user.add);
function add(req, res) {
  res.send(libutil.getUuid());
}


//app.put('/users/update', routes.user.update);
function update(req, res) {
  res.send(libutil.getUuid());
}

//app.delete('/users/delele', routes.user.delete);
function delete(req, res) {
  res.send(libutil.getUuid());
}

