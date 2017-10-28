const fs = require('fs');
fs.readFile('/etc/passwd', (err, data) => {
  if (err) throw err;
  console.log(data);
  console.log(Buffer.isBuffer(data)); //true
  console.log(data.toString());  //default encoding: 'utf8'
  console.log(data.toString('ascii'));

});

fs.readFile('/etc/passwd', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data);
  console.log(Buffer.isBuffer(data)); //false
  console.log(typeof data); //string
});
