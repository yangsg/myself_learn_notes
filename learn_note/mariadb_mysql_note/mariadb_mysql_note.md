- [MySQL技术内幕（第5版）](http://product.dangdang.com/1174890195.html)
- [MySQL技术内幕：SQL编程](http://product.dangdang.com/22646462.html)

- relational database management system[RDBMS]
- database table row column record

- [MySQL Workbench(available on windows, linux, Mac OS X and for MariaDB)](https://dev.mysql.com/downloads/)
- [如何使用 MySQL workbench 生成 EER 图？](https://www.zhihu.com/question/20680795)
- [MySQL Workbench, getting started tutorial - Oracle](https://docs.oracle.com/cd/E19078-01/mysql/mysql-workbench/wb-getting-started-tutorial.html)

```bash
mysql -p -u root
```
```mysql
CREATE USER 'sampadm'@'localhost' IDENTIFIED BY 'secret';

GRANT ALL ON sampdb.* TO 'sampadm'@'localhost';
```
- 经验：应该在事先对将被保存到数据库里去的数据值做尽可能深入的了解。
- 生产环境下应该使用严格模式

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

- [Save MySQL query results into a text or CSV file](http://www.tech-recipes.com/rx/1475/save-mysql-query-results-into-a-text-or-csv-file/)
```mysql
SELECT * FROM student INTO OUTFILE '/tmp/student.txt'; --This will create a tab-separated file, each row on its own line. T


SELECT * FROM student
INTO OUTFILE '/tmp/student.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

```

- [MySQL query to find all views in a database](https://geeksww.com/tutorials/database_management_systems/mysql/tips_and_tricks/mysql_query_to_find_all_views_in_a_database.php)
```mysql
SHOW FULL TABLES IN sampdb WHERE TABLE_TYPE LIKE 'VIEW';
```

- [How do I see all foreign keys to a table or column?](https://stackoverflow.com/questions/201621/how-do-i-see-all-foreign-keys-to-a-table-or-column)

- String Escape Sequences

| Sequence | Meaning                           |
| -------- | --------------------------------- |
| \\0       | NUL (zero-valued byte)            |
| \\'       | Single quote                      |
| \\"       | Double quote                      |
| \b       | Backspace                         |
| \n       | Newline (linefeed)                |
| \r       | Carriage return                   |
| \t       | Tab                               |
| \\\       | Single backslash                  |
| \Z       | Control-Z (Windows EOF character) |

The escape sequences shown in the table are case sensitive, and any character not listed
in the table is interpreted as itself if preceded by a backslash. For example, \t is a tab, but
\T is an ordinary ‘T’ character.

- [Case Sensitive collation in MySQL](https://stackoverflow.com/questions/4558707/case-sensitive-collation-in-mysql)
- [mysql, utf-8 column: how to select only case-sensitive?](https://stackoverflow.com/questions/10237129/mysql-utf-8-column-how-to-select-only-case-sensitive)

- [Chapter 11 Data Types](https://dev.mysql.com/doc/refman/5.7/en/data-types.html)

- [Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT](https://dev.mysql.com/doc/refman/5.6/en/integer-types.html)

| Type      | Storage  | Minimum Value        | Maximum Value        |
| ----      | -------- | ----------------     | -----------------    |
|           | (Bytes)  | (Signed/Unsigned)    | (Signed/Unsigned)    |
| TINYINT   | 1        | -128                 | 127                  |
|           |          | 0                    | 255                  |
| SMALLINT  | 2        | -32768               | 32767                |
|           |          | 0                    | 65535                |
| MEDIUMINT | 3        | -8388608             | 8388607              |
|           |          | 0                    | 16777215             |
| INT       | 4        | -2147483648          | 2147483647           |
|           |          | 0                    | 4294967295           |
| BIGINT    | 8        | -9223372036854775808 | 9223372036854775807  |
|           |          | 0                    | 18446744073709551615 |


- Table 3.13 Date and Time Data Types

Type      | Specification Range
--------- | -------------
DATE      | '1000-01-01' to '9999-12-31'
TIME      | '-838:59:59' to '838:59:59'
DATETIME  | '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
TIMESTAMP | '1970-01-01 00:00:01' to '2038-01-19 03:14:07'
YEAR[(M)] | 1901 to 2155 for YEAR(4), and 1970 to 2069 for YEAR(2)

For combined date and time values, it is allowable to specify a ‘T’ character rather than
a space between the date and time (for example, '2008-12-31T12:00:00').

- [Listing Stored Procedures in a MySQL Database](http://www.mysqltutorial.org/listing-stored-procedures-in-mysql-database.aspx)
- [List of Stored Procedures/Functions Mysql Command Line](https://stackoverflow.com/questions/733349/list-of-stored-procedures-functions-mysql-command-line)
```mysql
-- SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE expr];
SHOW PROCEDURE STATUS;
SHOW FUNCTION STATUS;

SHOW PROCEDURE STATUS WHERE db = 'sampdb';
SHOW PROCEDURE STATUS WHERE name LIKE '%update_expiration%';

SHOW CREATE PROCEDURE update_expiration\G;
```

- [Configuring MariaDB with my.cnf](https://mariadb.com/kb/en/library/configuring-mariadb-with-mycnf/)

























