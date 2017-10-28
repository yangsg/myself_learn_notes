var user = 'johnny';
var pass = 'c-bad';
var authstring = user + ':' + pass;
var buf = Buffer.from(authstring);
console.log(buf);
var encoded = buf.toString('base64');
console.log(encoded);
var buf2 = Buffer.from(encoded, 'base64');
console.log(buf2);
console.log(buf2.toString('hex'));

var buf3 = Buffer.from(authstring, 'base64');
console.log(buf3);


