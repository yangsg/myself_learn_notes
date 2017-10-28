const fs = require('fs');

var mine = 'image/png';
var encoding = 'base64';
var data = fs.readFileSync('./monkey.png').toString(encoding);
var uri = 'data:' + mine + ';' + encoding + ',' + data;
console.log(uri);

var data = uri.split(',')[1];
var buf = Buffer.from(data, encoding);
fs.writeFileSync('./secondmonkey.png', buf);



