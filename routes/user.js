'use strict';

const libutil = require('../lib/libutil');
const dbutil = require('../lib/dbutil');


exports.index = index;
exports.list = list;
exports.info = info;
exports.add = add;
exports.update = update;
exports.del = del;

function index(req, res) {
  res.send(libutil.getUuid());
}

function list(req, res) {
  var conn = dbutil.getConnection();
  conn.query('select id, name, comment from user', function (error, results) {
    conn.end();
    if (error) {
      throw error;
    }

    res.render('user/user_list', {results: results});
  });

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
function del(req, res) {
  res.send(libutil.getUuid());
}

