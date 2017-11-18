const dbutil = require('./lib/dbutil');

var conn = dbutil.getConnection();

conn.query('select id, name, comment from user', function (error, results) {
  if (error) {
    throw error;
  }

  console.log(results);
  console.log('-----------------------------------------------------------------------------------------------------------');
  //console.log(fields);

});

conn.end();

