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

function list(req, res, next) {
  var conn = dbutil.getConnection();
  conn.query('select id, name, comment from user', function (error, results) {
    conn.end();
    if (error) {
      next(error);
      return;
    }

    res.render('user/user_list', {results: results});
  });

}

//app.get('/user/update_input_form/:id', routes.user.info);
function info(req, res, next) {
  var id = req.params.id;
  var conn = dbutil.getConnection();
  conn.query('select id, name, comment from user where id = ' + conn.escape(id), function (error, result) {
    conn.end();
    if (error) {
      next(error);
      return;
    }

    if (result.length === 0) {
      res.sendStatus(404);  
      //res.status(404).end();
      //res.status(404).send('Sorry, we cannot find that!');
      return;
    }

    res.render('user/user_input_form', {user: result[0]});
  });
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

