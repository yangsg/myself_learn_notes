
```mysql
CREATE DATABASE my_db;
CREATE USER 'dbuser01'@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON my_db.* TO 'dbuser01'@'localhost';


use my_db;
SELECT DATABASE();
CREATE TABLE user(
  id char(36) PRIMARY KEY,  #for store uuid
  name varchar(20) UNIQUE,
  comment varchar(50)
)ENGINE=InnoDB CHARACTER SET utf8;
show tables;

```

- [What is the performance impact of using CHAR vs VARCHAR on a fixed-size field?](https://dba.stackexchange.com/questions/2640/what-is-the-performance-impact-of-using-char-vs-varchar-on-a-fixed-size-field)

- [mysqljs/mysql](https://github.com/mysqljs/mysql)

- [Inserting and selecting UUIDs as binary(16)](https://stackoverflow.com/questions/28251144/inserting-and-selecting-uuids-as-binary16)
- [Convert UUID to/from binary in Node](https://stackoverflow.com/questions/25753505/convert-uuid-to-from-binary-in-node)
- [Storing UUID Values in MySQL Tables](http://mysqlserverteam.com/storing-uuid-values-in-mysql-tables/)
- [How should I store GUID in MySQL tables?](https://stackoverflow.com/questions/412341/how-should-i-store-guid-in-mysql-tables)
- [mariadb UUID](https://mariadb.com/kb/en/library/uuid/)
- [GUID/UUID Performance](https://mariadb.com/kb/en/library/guiduuid-performance/)







