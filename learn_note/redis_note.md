- [redis download](https://redis.io/download)
version number format: major.minor.patchlevel (An even minor marks a stable release. Odd minors are used for unstable releases)

- [Installation](https://redis.io/download)
```bash
cd /usr/local/src/
wget http://download.redis.io/releases/redis-4.0.5.tar.gz
tar -zxvf redis-4.0.5.tar.gz
cd redis-4.0.5/
make            #for more details: vim README.md


cd src
./redis-server     #run Redis with the default configuration

./redis-server --port 9999 --slaveof 127.0.0.1 6379
./redis-server /etc/redis/6379.conf --loglevel debug

% ./redis-cli
redis> ping
PONG
redis> set foo bar
OK
redis> get foo
"bar"
redis> incr mycounter
(integer) 1
redis> incr mycounter
(integer) 2
redis>

```


- [try redis](http://try.redis.io/)
```redis
SET server:name "fido"
GET server:name

SET connections 10
INCR connections  //INCR 可以保证原子性
INCR connections
DEL connections
INCR connections

// 以下代码在多客户端操作时无法保证原子性
//(如clientA , clientB同时执行如下每条语句的情况)
x = GET count
x = x + 1
SET count x

// commands
// SETNX  //(SET-if-not-exists) sets a key only if it does not already exist
// INCR   //to atomically increment a number stored at a given key

SET resource:lock "Redis Demo"
EXPIRE resource:lock 120       //This causes the key resource:lock to be deleted in 120 seconds.
// You can test how long a key will exist with the TTL command. It returns the number of seconds until it will be deleted.
TTL resource:lock
TTL resource:lock

//The -2 for the TTL of the key means that the key does not exist (anymore). A -1 for the TTL of the key means that it will never expire. Note that if you SET a key, its TTL will be reset.
SET resource:lock "Redis Demo 1"
TTL resource:lock => -1
EXPIRE resource:lock 120
TTL resource:lock => 114
SET resource:lock "Redis Demo 2"
TTL resource:lock => -1

// Some of the important commands for interacting with lists are RPUSH, LPUSH, LLEN, LRANGE, LPOP, and RPOP.
// You can immediately begin working with a key as a list, as long as it doesn't already exist as a different type.

// RPUSH puts the new value at the end of the list.
RPUSH friends "Alice"
RPUSH friends "Bob"

// LPUSH puts the new value at the start of the list.
LPUSH friends "Sam"

// LRANGE gives a subset of the list. It takes the index of the first element you want to retrieve as its first parameter
// and the index of the last element you want to retrieve as its second parameter.
// A value of -1 for the second parameter means to retrieve elements until the end of the list.
LRANGE friends 0 -1 => 1) "Sam", 2) "Alice", 3) "Bob"
LRANGE friends 0 1  => 1) "Sam", 2) "Alice"
LRANGE friends 1 2  => 1) "Alice", 2) "Bob"

next
next
next
next


```


