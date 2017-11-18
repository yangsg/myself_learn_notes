'use strict';
const mysql = require('mysql');
const config = require('config');

exports.getConnection = getConnection;

function getConnection() {
  var connection = mysql.createConnection({
    host     : config.dbConfig.host,
    user     : config.dbConfig.user,
    password : config.dbConfig.password,
    database : config.dbConfig.database
  });

  return connection;
}





