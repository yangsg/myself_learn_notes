## [nodejs documentation](https://nodejs.org/en/docs/es6/)
### books
- [Node.js in Practice](https://github.com/alexyoung/nodeinpractice)

### [Globals](https://nodejs.org/dist/latest-v6.x/docs/api/globals.html)

#### [unload module from cache](https://nodejs.org/dist/latest-v6.x/docs/api/globals.html#globals_require)
```node
require('./test');
var isSuccess = delete require.cache[require.resolve('./test')];  //unload module from cache
console.log(isSuccess);
require('./test');
```

#### [Folders as Modules](https://nodejs.org/dist/latest-v6.x/docs/api/modules.html#modules_folders_as_modules)
```node
// the following statement will first try to find './dir01/package.json' and load module according to the 'main' property in package.json,
// If there is no package.json file present in the directory, then Node.js will attempt to load an './dir01/index.js' or './dir01/index.node'
require('./dir01'); 
```

#### [__dirname](https://nodejs.org/dist/latest-v6.x/docs/api/globals.html#globals_dirname) 
#### [path.join([...paths])](https://nodejs.org/dist/latest-v6.x/docs/api/path.html#path_path_join_paths)
```node
path.join(__dirname, 'views', 'view.html');
```

#### read or write by stdio
```node
 // file: process.js
 // Run with:
 //   echo hello world | node process.js

 process.stdin.resume();
 process.stdin.setEncoding('utf8');

 process.stdin.on('data', function(text) {
   process.stdout.write(text.toUpperCase());
 });
```

#### [Console](https://nodejs.org/dist/latest-v6.x/docs/api/console.html)
```node
console.trace('Show me');
```

```node
console.time('100-elements');
for (let i = 0; i < 100; i++) ;
console.timeEnd('100-elements');
```

#### [Process](https://nodejs.org/dist/latest-v6.x/docs/api/process.html)
```node 
console.log(process.arch);
console.log(process.platform);
console.log(process.memoryUsage());
```

#### process.argv and process.exit
- [commander.js](https://github.com/tj/commander.js)
```node 
// https://github.com/alexyoung/nodeinpractice/blob/master/listings/globals/arguments-status-code.js
// file: arguments-status-code.js
// run with
// node arguments-status-code.js -r arguments-status-code.js
var args = {
  '-h': displayHelp,
  '-r': readFile
};

function displayHelp() {
  console.log('Argument processor:', args);
}

function readFile(file) {
  if (file && file.length) {
    console.log('Reading:', file);
    require('fs').createReadStream(file).pipe(process.stdout);
  } else {
    console.error('A file must be provided with the -r option');
    process.exit(1); //<co id="listing-globals-arguments-1-1" />
  }
}

if (process.argv.length > 0) {
  process.argv.forEach(function(arg, index) {
    if (typeof args[arg] === 'undefined') {
      return;
    }
    args[arg].apply(this, process.argv.slice(index + 1));
  });
}
```

#### repsonse to signal
```node
// kill -SIGHUP 16079
process.stdin.resume();

process.on('SIGHUP', function () {
  console.log('Reloading configuration...');
});

console.log('PID:', process.pid);
```

#### [process.kill](https://nodejs.org/dist/latest-v6.x/docs/api/process.html#process_process_kill_pid_signal)
```node
process.on('SIGHUP', () => {
  console.log('Got SIGHUP signal.');
});

setTimeout(() => {
  console.log('Exiting.');
  process.exit(0);
}, 100);

process.kill(process.pid, 'SIGHUP');
```

#### Timer

- [setTimeout](https://nodejs.org/dist/latest-v6.x/docs/api/timers.html#timers_settimeout_callback_delay_args)
- [Function.prototype.bind()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)
```node
function Bomb() {
  this.message = 'Boom!';
}

Bomb.prototype.explode = function() {
  console.log(this.message);
};

var bomb = new Bomb();

var timeoutId = setTimeout(bomb.explode.bind(bomb), 1000);

```
#### [setInterval](https://nodejs.org/dist/latest-v6.x/docs/api/timers.html#timers_class_timeout)
```node
function monitor() {
  console.log(process.memoryUsage());
}

var id = setInterval(monitor, 1000);
id.unref();

setTimeout(function() {
  console.log('Done!');
}, 5000);
```












