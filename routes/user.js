'use strict';

const libutil = require('../lib/libutil');
const dbutil = require('../lib/dbutil');

exports.index = index;
exports.list = list;
exports.info = info;
exports.add = add;
exports.update = update;
exports.del = del;
exports.renderAddInputForm = renderAddInputForm;

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

    res.render('user/user_update_input_form', {user: result[0]});
  });
}

function renderAddInputForm(req, res) {
  res.render('user/user_add_input_form');
}

function add(req, res, next) {
  var id = libutil.getUuid();
  var name = req.body.name;
  var comment = req.body.comment;

  var conn = dbutil.getConnection();
  var query = 'INSERT INTO user (id, name, comment) VALUES ( ' + conn.escape(id) + ', '+ conn.escape(name) + ',' + conn.escape(comment) + ' )';
  conn.query(query, function (error) {
    conn.end();
    if (error) {
      next(error);
      return;
    }

    res.redirect('/user/list');
  });
}

function update(req, res, next) {
  var conn = dbutil.getConnection();
  var id = req.params.id;
  var comment = req.body.comment;

  var query = 'UPDATE user SET comment = ' + conn.escape(comment) + ' WHERE id = ' + conn.escape(id);
  conn.query(query, function (error) {
    conn.end();
    if (error) {
      next(error);
      return;
    }

    res.redirect('/user/list');
  });
}

function del(req, res, next) {
  var id = req.params.id;
  var conn = dbutil.getConnection();
  var query = 'DELETE FROM user WHERE id = ' + conn.escape(id); 
  conn.query(query, function (error) {
    conn.end();
    if (error) {
      next(error);
      return;
    }

    res.redirect('/user/list');
  });
}

