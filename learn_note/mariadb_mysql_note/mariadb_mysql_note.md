- [MySQL技术内幕（第5版）](http://product.dangdang.com/1174890195.html)
- [MySQL技术内幕：SQL编程](http://product.dangdang.com/22646462.html)

- relational database management system[RDBMS]
- database table row column record

```bash
mysql -p -u root
```
```mysql
CREATE USER 'sampadm'@'localhost' IDENTIFIED BY 'secret';

GRANT ALL ON sampdb.* TO 'sampadm'@'localhost';
```
- 经验：应该在事先对将被保存到数据库里去的数据值做尽可能深入的了解。

- MySQL expects dates to be written in 'CCYY-MM-DD’ format, where CC, YY, MM, and DD represent the century, year within the century, month, and day of the month.

```bash
[test@localhost ~]$ vim ~/.my.cnf   #for windows system: C:\my.cnf
[client]
host=127.0.0.1
user=sampadm
password=secret
```

```bash
[test@localhost ~]$ vim mysql.sh
#!/usr/bin/env bash
exec mysql -h 127.0.0.1 -u sampadm -p

[test@localhost ~]$ bash mysql.sh
```

- ~/.mysql_history

```bash
[test@localhost ~]$ vim interests.sql
SELECT last_name, first_name, email, interests FROM member
WHERE interests LIKE '%depression%'
ORDER BY last_name, first_name;


[test@localhost ~]$ mysql sampdb < interests.sql     #默认情况下,以批处理模式运行的mysql程序的输出内容是以制表符来分隔的。
[test@localhost ~]$ mysql -t sampdb < interests.sql  #选项-t用于得到与以交互方式运行mysql程序时的输出格式相同的整齐效果.
[test@localhost ~]$ mysql -t sampdb < interests.sql > interests.out

mysql> source interests.sql  #If you are already running mysql, execute the contents of the file by using a source command.
```

- MySQL服务器的sql_mode系统变量
```mysql
MariaDB [(none)]> SELECT @@global.sql_mode;
+-------------------------------------------------------------------------------------------+
| @@global.sql_mode                                                                         |
+-------------------------------------------------------------------------------------------+
| STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+-------------------------------------------------------------------------------------------+

MariaDB [(none)]> SELECT @@session.sql_mode;
+-------------------------------------------------------------------------------------------+
| @@session.sql_mode                                                                        |
+-------------------------------------------------------------------------------------------+
| STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+-------------------------------------------------------------------------------------------+


```

- 大小写参考约定：(database, table, column名使用小写，关键字使用大写)

```mysql
-- CREATE DATABASE db_name CHARACTER SET utf8 COLLATE utf8_bin;
-- CREATE TABLE student(...)ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin;
```






