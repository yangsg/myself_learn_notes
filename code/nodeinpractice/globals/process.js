// Run with:
//   echo hello world | node process.js

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(text) {
  process.stdout.write(text.toUpperCase());
});
