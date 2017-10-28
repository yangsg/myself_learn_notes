const EventEmitter = require('events');

class MyStream extends EventEmitter {
  constructor() {
    super();
  }
  write(data) {
    this.emit('error', data);
  }
}

const stream = new MyStream();
/*
stream.on('error', (data) => {
  console.log(`Received data: "${data}"`);
});
*/

stream.write('With ES6');
