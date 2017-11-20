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









