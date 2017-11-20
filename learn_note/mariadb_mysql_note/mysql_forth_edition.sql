MySQL迁移到Oracle的50条军规


-- 示例数据库sampdb地址：http://www.kitebird.com/mysql-book/

--!!tip: 重要提示
--mysql和oracle的一个区别：group by子句：
	-MySQL中select子句中可以出现GROUP BY子句中未出现的列
	-ORDER BY子句中在某些情况下需要别名(Ctrl+F "!!tip")
												

#1.4.3 如何建立和断开与服务器的连接
% mysql -p -u root
% mysql -p1234 -u root #不推荐，密码被显示在屏幕上

mysql> CREATE USER 'sampadm'@'localhost' IDENTIFIED BY 'secret';
mysql> GRANT ALL ON sampdb.* TO 'sampadm'@'localhost';


mysql> CREATE USER 'sampadm'@'asp.snake.net' IDENTIFIED BY 'secret';
mysql> GRANT ALL ON sampdb.* TO 'sampadm'@'asp.snake.net';


% mysql -h localhost -p -u root
% mysql --password --user=root --host=localhost
% mysql --password --user root --host localhost

mysql> quit


#1.4.4 执行SQL语句
mysql> SELECT NOW();
mysql> SELECT NOW() \g #g(go)
mysql> SELECT NOW(), USER(), VERSION() \G #竖直排列显示结果，每行一个值

mysql> SELECT NOW(),
    -> VERSION(),
    -> \c #type \c to clear (cancel) it

mysql> SELECT NOW(); SELECT USER(); SELECT VERSION();

mysql> mysql < myscript.sql

#1.4.5 创建数据库

mysql> CREATE DATABASE sampdb;
mysql> SELECT DATABASE();

mysql> USE sampdb;
mysql> SELECT DATABASE();

% mysql -p -u sampadm sampdb    #Another way to select a default database is to name it on the command line when you invoke mysql
% mysql -h cobra.snake.net -p -u sampadm sampdb

#1.4.6 创建数据表
%mysql -p -u root sampdb < F:\迅雷下载\sampdb\sampdb\create_president.sql

-----------------------------------------------------------
# Create president table for U.S. Historical League

DROP TABLE IF EXISTS president;
#@ _CREATE_TABLE_
CREATE TABLE president
(
  last_name  VARCHAR(15) NOT NULL,
  first_name VARCHAR(15) NOT NULL,
  suffix     VARCHAR(5) NULL,
  city       VARCHAR(20) NOT NULL,
  state      VARCHAR(2) NOT NULL,
  birth      DATE NOT NULL,
  death      DATE NULL
);
#@ _CREATE_TABLE_


-----------------------------------------------------------
# Create member table for U.S. Historical League

DROP TABLE IF EXISTS member;
#@ _CREATE_TABLE_
CREATE TABLE member
(
  member_id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (member_id),
  last_name  VARCHAR(20) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  suffix     VARCHAR(5) NULL,
  expiration DATE NULL,
  email      VARCHAR(100) NULL,
  street     VARCHAR(50) NULL,
  city       VARCHAR(50) NULL,
  state      VARCHAR(2) NULL,
  zip        VARCHAR(10) NULL,
  phone      VARCHAR(20) NULL,
  interests  VARCHAR(255) NULL
);
#@ _CREATE_TABLE_
-----------------------------------------------------------

#如下语句作用相同
mysql> DESCRIBE president;
mysql> DESC president;
mysql> EXPLAIN president;
mysql> SHOW COLUMNS FROM president;
mysql> SHOW FIELDS FROM president;

mysql> DESCRIBE president '%name'; #限制为指定的数据列
mysql> SHOW COLUMNS FROM president like '%name';

-----------------------------------------------------------


mysql> SHOW TABLES;
mysql> SHOW DATABASES;

% mysqlshow -u root -p #列出数据库清单
% mysqlshow sampdb -u root -p #给一个数据库名,则列出数据库里数据表清单

% mysqlshow sampdb president -u root -p
mysql> SHOW FULL COLUMNS FROM president;

SELECT student.name, grade_event.date, score.score, grade_event.category
FROM grade_event INNER JOIN score INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id
WHERE grade_event.date = '2008-09-23';


-----------------------------------------------------------
#note: 一种"存储引擎"就是一种用来管理某种特定类型的数据表的处理器。
#InnoDB引擎引入了"事务"及"外键参照约束"等功能

mysql> source F:\迅雷下载\sampdb\sampdb\create_student.sql

-----------------------------------------------------------
CREATE TABLE student
(
  name       VARCHAR(20) NOT NULL,
  sex        ENUM('F','M') NOT NULL,
  student_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (student_id)
) ENGINE=InnoDB;

CREATE TABLE grade_event
(
  date     DATE NOT NULL,
  category ENUM('T','Q') NOT NULL,
  event_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (event_id)
) ENGINE=InnoDB;

CREATE TABLE score
(
  student_id INT UNSIGNED NOT NULL,
  event_id   INT UNSIGNED NOT NULL,
  score      INT NOT NULL,
  PRIMARY KEY (event_id, student_id),
  INDEX (student_id),
  FOREIGN KEY (event_id) REFERENCES grade_event (event_id),
  FOREIGN KEY (student_id) REFERENCES student (student_id)
) ENGINE=InnoDB;

-----------------------------------------------------------
mysql> DESCRIBE student 'sex';
-----------------------------------------------------------
#1.4.7 如何添加新的数据行
mysql> SELECT * FROM student;

-----------------------------------------------------------
#1. 利用INSERT语句添加数据
#加载数据的方法： INSERT 语句，或纯粹的数值文件(通过LOAD DATA语句或者mysqlimport工具程序)

mysql> INSERT INTO student VALUES('Kyle', 'M', NULL);
mysql> INSERT INTO grade_event VALUES('2008-09-03', 'Q', NULL);

#MySQL里的字符串和日期值必须放在单引号或双引号里才能被引用，放在单引号里更标准些。
#在一个AUTO_INCREMENT数据列里插入一个表示"无数据"的NULL值将是MySQL为这个数据列自动生成下一个序号

mysql> INSERT INTO student VALUES('Avery', 'F', NULL), ('Nathan', 'M', NULL);
mysql> INSERT INTO member (last_name, first_name) VALUES('Stein', 'Waldo'); #没有在INSERT语句中出现的数据列将被赋予默认值
mysql> INSERT INTO student (name, sex) VALUES('Abby', 'F'), ('Joseph', 'M');

mysql> INSERT INTO member SET last_name='Stein', first_name='Waldo'; #这种形式的INSERT语句不允许一次插入多个数据行

mysql> INSERT INTO score (event_id, student_id, score) VALUES(9999, 9999, 0); #违反外键约束
mysql> INSERT INTO absence SET student_id=9999, date='2008-09-16'; #违反外键约束

#2. 通过从文件中读取来添加新行
%mysql -p -u root sampdb < F:\迅雷下载\sampdb\sampdb\insert_president.sql

mysql> source F:\迅雷下载\sampdb\sampdb\insert_president.sql  #如果已经进入mysql,可以用source命令读入这个文件

#如果文件里的记录项不是以INSERT语句而是以纯数据值的形式来存放的，则可使用LOAD DATA语句或mysqlimport工具程序来来加载它们

#> LOCAL关键字可以使客户程序读取数据文件并发送到服务器以加载。如果省略了关键字LOCAL,
#  就表示数据文件时保存在服务器主机上的，而你必须拥有相应的FILE服务器访问权限才能把
#  文件里的数据加载到数据表里去。还应指定文件的完全路径，这样服务器才能找到它。
#  参见附录E里的LOAD DATA条目
mysql> LOAD DATA LOCAL INFILE 'member.txt' INTO TABLE member; 

%mysql --local-infile sampdb  

#激活服务器端LOCAL机制的具体做法参见第12章

#>加载数据文件的另一种方法是使用mysqlimport客户程序
# 特别注意：mysqlimport程序是根据数据文件的名字来确定与之对应的数据表的,
# 它将把文件名中第一个句号字符(.)之前的那个字符串用作数据表的名字。
# 如: member.txt -> member
#     persident.txt -> persident
#     member.1.txt -> member 或 member.txt1 -> member
%mysqlimport --local -p -u root sampdb member.txt 


-----------------------------------------------------------
#1.4.8 将sampdb 数据库重设为原来的状态
%mysql -p -u root sampdb
DROP TABLE IF EXISTS absence, score, grade_event, member, president, student;
mysql> source create_member.sql;
mysql> source create_president.sql;
mysql> source insert_member.sql;
mysql> source insert_president.sql;
mysql> source create_student.sql;
mysql> source create_grade_event.sql;
mysql> source create_score.sql;
mysql> source create_absence.sql;
mysql> source insert_student.sql;
mysql> source insert_grade_event.sql;
mysql> source insert_score.sql;
mysql> source insert_absence.sql;



-----------------------------------------------------------
% sh init_all_tables.sh -u root -p  sampdb   #unix todo
C:\> init_all_tables.bat -u root -p sampdb              #windows系统 todo


-----------------------------------------------------------
#1.4.9 检索信息
mysql> SELECT * FROM president;
mysql> SELECT birth FROM president WHERE last_name='Eisenhower';

mysql> SELECT 2+2, 'Hello, world', VERSION();

mysql> SELECT * FROM student;
mysql> SELECT name FROM student;
mysql> SELECT name, sex, student_id FROM student; #多个数据列用逗号隔开

#note: 数据列名不区分大小写, dan数据库和数据表的名字可能需要区分字母的大小写。
#      这取决于服务器主机上所使用的文件系统以及MySQL的配置情况。比如windows不区分
#      大小写，Unix文件名区分大小写。 可以对服务器进行配置，请参见11.2.5节

#1. 指定检索条件

#针对数值进行查找
mysql> SELECT * FROM score WHERE score > 95;

#针对字符串进行查找
mysql> SELECT last_name, first_name FROM president WHERE last_name='ROOSEVELT';
mysql> SELECT last_name, first_name FROM president WHERE last_name='roosevelt';

#针对日期进行查找
mysql> SELECT last_name, first_name, birth FROM president WHERE birth<'1750-1-1';

#针对不同类型的值的组合进行查找
mysql> SELECT last_name, first_name, birth, state FROM president WHERE birth<'1750-1-1' AND (state='VA' OR state='MA');

#MySQL函数的完整清单参阅附录C
#Operators

#算数运算符： + - * / div(整除) %
#比较运算符:  < <= = <=>(等于，能够对NULL值进行比较) <>或!= >= >
#逻辑运算符： AND OR XOR(异或) NOT



#>注意：逻辑与运算与人们日常生活中所说的"和"在含义上是不一样的。
#   例如：把"出生于弗吉利亚州和出生于马萨诸塞州的总统"查出来：

mysql> SELECT last_name, first_name, state FROM president
WHERE state='VA' AND state='MA';  #逻辑错误，应该是结果集的并操作
mysql> SELECT last_name, first_name, state FROM president
WHERE state='VA' OR state='MA';  #正确，结果集的合并用析取运算符

mysql> SELECT last_name, first_name, state FROM president
WHERE state IN('VA', 'MA');  #正确，结果集的合并用析取运算符

#2.NULL值
#NULL的含义是"无数据"或"未知数据",不应该用它与"有数据"的值进行运算或比较，
#也不应该把NULL值与它本身进行比较，其结果都将是不可预料的。
mysql> SELECT NULL<0, NULL=0, NULL<>0, NULL>0; #错误, 结果不可预料
mysql> SELECT NULL=NULL, NULL<>NULL;

#使用IS NULL 或 IS NOT NULL作谓语
mysql> SELECT last_name, first_name FROM president WHERE death IS NULL; # IS NULL, 查询人健在的美国总统

mysql> SELECT last_name, first_name, suffix FROM president WHERE suffix IS NOT NULL; #IS NOT NULL, 找出没有姓名后缀的美国总统


#3. 如何对查询结果集进行排序
# 信赖原则：从服务器返回的数据行的先后顺序没有任何保证,除非你实现设定。
# (数据删除操作会在数据库表里留下一些"空洞",而MySQL会用你以后插入的新纪录
#  来尽量填补这些"空洞")

mysql> SELECT last_name, first_name FROM president
ORDER BY last_name; #ORDER BY子句中默认的排序方式是升序ASC

mysql> SELECT last_name, first_name FROM president
ORDER BY last_name DESC; #显示指定降序显示DESC

mysql> SELECT last_name, first_name, state FROM president
ORDER BY state DESC, last_name ASC; #按多数据列进行排序

#对于包含NULL值的数据行，如果设定按升序排序，它们将出现在升序结果的开头；
#如果设定按降序排列，它们将出现在查询结果集的末尾。必要时可额外增加一个排序列
#以区分NULL值和非NULL值：
mysql> SELECT last_name, first_name, death FROM president
ORDER BY IF(death IS NULL, 0, 1), death DESC; #增加额外排序数据列IF(death IS NULL, 0, 1)


#4.如何限制查询结果中的数据行个数
mysql> SELECT last_name, first_name, death FROM president
ORDER BY death  LIMIT 5; #LIMIT 5为count上限

mysql> SELECT last_name, first_name, death FROM president
ORDER BY death DESC LIMIT 5; #LIMIT 5为count上限

#从查询结果的中间部分抽出一部分数据记录
mysql> SELECT last_name, first_name, death FROM president
ORDER BY death DESC LIMIT 10, 5; #10为跳过的记录数,也是index

#随机抽取出一条或一组数据记录,可以联合使用LIMIT和ORDER BY RAND()子句
mysql> SELECT last_name, first_name FROM president
ORDER BY RAND() LIMIT 1; #随机抽取记录

#5. 如何对输出列进行求值和命名
mysql> SELECT 17, FORMAT(SQRT(25+13), 3);
mysql> SELECT CONCAT(first_name, ' ', last_name), CONCAT(city, ', ', state)
FROM president; #数据列名也可以用在表达式里

mysql> SELECT CONCAT(first_name, ' ', last_name) AS Name, 
CONCAT(city, ', ', state) AS Birthplace
FROM president; #用AS name短语给输出列另外去一个名字，即别名(alias)

#>如果输出列的别名里包含空格符，就必须把它放到一组引号里
mysql> SELECT CONCAT(first_name, ' ', last_name) AS 'President Name', 
CONCAT(city, ', ', state) AS 'Place of Birth'
FROM president; #别名中包含空格

mysql> SELECT 1, 2 AS two, 3 three; #为数据列提供别名时, 关键字AS可以省略

#笔者更喜欢写出关键字AS
mysql> SELECT first_name last_name FROM president; #注意，这里漏掉了逗号，所以last_name无意中变成了first_name的别名
mysql> SELECT first_name, last_name FROM president;


#与日期有关的问题
	#日期2008年7月27日将被表示为'2008-07-27'

#MySQL为我们准备了一些日期操作，比较常见的有以下几种：
--按日期排序。
--查找某个日期或某个日期范围。
--提取日期中的年、月、日等组成部分。
--计算两个日期之间的时间距离。
--用一个日期加上或减去一个时间间隔以求出另一个日期。

mysql> SELECT * FROM grade_event WHERE date='2008-10-01';

mysql> SELECT last_name, first_name, death
FROM president
WHERE death>='1970-01-01' AND death<'1980-01-01';


#年、月、日3部分可以用函数YEAR()、MONTH()、DAYOFMONTH()分别分离出来.
mysql> SELECT last_name, first_name, birth
FROM president WHERE MONTH(birth)=3;

mysql> SELECT last_name, first_name, birth
FROM president WHERE MONTHNAME(birth)='March';

mysql> SELECT last_name, first_name, birth
FROM president
WHERE MONTH(birth)=3 AND DAYOFMONTH(birth)=29; #MONTH() 和 DAYOFMONTH()函数结合起来使用


#今天出生的总统
mysql> SELECT last_name, first_name, birth
FROM president WHERE MONTH(birth)=MONTH(CURDATE())
AND DAYOFMONTH(birth)=DAYOFMONTH(CURDATE()); #CURDATE()函数

#找出哪位总统的寿命最长
mysql> SELECT last_name, first_name, birth, death,
TIMESTAMPDIFF(YEAR, birth, death) AS age
FROM president WHERE death IS NOT NULL
ORDER BY age DESC LIMIT 5; #TIMESTAMPDIFF()函数,此例中YEAR用以指定计算结果的单位
-----------------
#TO_DAYS函数用于将日期转换为天数。
# 把资格已经失效和需要在60天以内续交会费的会员查出来
mysql> SELECT last_name, first_name, expiration FROM member
WHERE (TO_DAYS(EXPIRATION) - TO_DAYS(CURDATE())) < 60;
#使用TIMESTAMPDIFF()函数也可以完成,如
mysql> SELECT last_name, first_name, expiration FROM member
WHERE TIMESTAMPDIFF(DAY, CURDATE(), expiration) < 60;
-----------------

mysql> SELECT DATE_ADD('1970-1-1', INTERVAL 10 YEAR); #DATE_ADD()函数
mysql> SELECT DATE_SUB('1970-1-1', INTERVAL 10 YEAR); #DATE_SUB()函数

#那些总统逝世于20实际70年代
mysql> SELECT last_name, first_name, death
FROM president
WHERE death>='1970-1-1'
AND death< DATE_ADD('1970-1-1', INTERVAL 10 YEAR);

#需要在近期缴纳会费的会员
mysql> SELECT last_name, first_name, expiration FROM member
WHERE expiration < DATE_ADD(CURDATE(), INTERVAL 60 DAY);

#一个关于"那些患者没有参加复查"的查询
mysql> SELECT last_name, first_name, last_visit FROM patient
WHERE last_visit < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


#7.模式匹配
#MySQL支持模式匹配操作，这使我们能够在没有给出精确比较值的情况下把有关的数据查出来。
#操作符：LIKE , NOT LIKE
#通配符: 下划线字符"_"只能匹配一个字符，百分号字符"%"则能匹配任何一个字符序列(包括空序列在内)。

#把姓氏以字母W或w开头的总统姓名查找出来
mysql> SELECT last_name, first_name FROM president
WHERE last_name LIKE 'W%';  #note: 该语句大小写匹配不能完全保证满足需求。set names utf8 collate utf8_bin;

SELECT last_name, first_name FROM president WHERE last_name = 'W%'; #注意：此处用"="符号不是模式匹配

#把姓氏里有W或w字母(并不仅限于姓氏是第一个字母)的总统找出来
mysql> SELECT last_name, first_name FROM president
WHERE last_name LIKE '%W%'; #TODO, 有待完善

#把姓氏有且仅由4个字母构成的总统姓名查出来
mysql> SELECT last_name, first_name FROM president
WHERE last_name LIKE '____';

#MySQL还提供基于正则表达式(regular expression)和REXEXP操作符的另一种模式匹配形式，
#3.5.1节中的第1小节和附录C将进一步讨论LIKE和REGEXP操作符。

#8. 如何设置和使用SQL变量

#变量的命名语法是"@变量名"，赋值语法是在SELECT语句里使用一个"@变量名:=值"形式的表达式。
-----------------------------------
#那些总统出生在Andrew Jackson总统之前
mysql> SELECT @birth := birth FROM president
WHERE last_name='Jackson' AND first_name='Andrew';
mysql> SELECT last_name, first_name, birth FROM president
WHERE birth<@birth ORDER BY birth;
-----------------------------------

#SET语句也能用来对变量赋值，此时，"=" 和 ":=" 都可以作赋值运算符。
mysql> SET @today = CURDATE();
mysql> SET @one_week_ago := DATE_SUB(@today, INTERVAL 7 DAY);
mysql> SELECT @today, @one_week_ago;


#9. 如何生成统计数据

#把美国历届总统的出生地所在州不加重复地列举出来：
mysql> SELECT DISTINCT state FROM president ORDER BY state; #DISTINCT将重复地数据清除掉，只保留一份。

mysql> SELECT COUNT(*) FROM member; #整个数据表的行数
mysql> SELECT COUNT(*) FROM grade_event WHERE category = 'Q'; #WHERE子句匹配了多少个数据行

#COUNT(*)的统计结果是被选中的数据行的总数，而COUNT(数据列名称)值则只统计全体非NULL值的个数。
#COUNT(*)对于只有唯一列的表格会将NULL行纳入统计数的范围内，即不会忽略NULL值
mysql> SELECT COUNT(*), COUNT(email), COUNT(expiration) FROM member;

#COUNT()和 DISTINCT联合起来可以统计出查询结果里到底有多少种不同的非NULL值
mysql> SELECT COUNT(DISTINCT state) FROM president; #美国共同有多少个州曾经有总统出生

mysql> SELECT COUNT(*) FROM student;

mysql> SELECT COUNT(*) FROM student WHERE sex='f';
mysql> SELECT COUNT(*) FROM student WHERE sex='m';

mysql> SELECT sex, COUNT(*) FROM student GROUP BY sex;
mysql> SELECT state, COUNT(*) FROM president GROUP BY state; #分别统计出生于各州的美国总统人数
#如果需要进行这种分门别类的统计，GROUP BY子句就必不可少

#!!tip: 当你准备用来排序的输出列是某个汇总函数的计算结果时，不能直接在ORDER BY子句里
#引用函数，而应该先给这个输出列取一个别名，然后再把这个别名用在ORDER BY子句里。
mysql> SELECT state, COUNT(*) AS count FROM president
GROUP BY state ORDER BY count DESC; #为COUNT(*)取一个别名count,再应用到ORDER BY子句中，<====

#在ORDER BY子句里引用输出列的另一种办法是利用它在输出结果中的位置，不过这种方式不被推荐
mysql> SELECT state, COUNT(*) FROM president GROUP BY state ORDER BY 2 DESC; #不推荐



#!!tip: 类似于ORDER BY子句的情况，如果你打算用GROUP BY子句对一个计算出来的输出列进行归类，
#可以使用输出列的别名或者它们在查询结果里的出现位置来设定。
mysql> SELECT MONTH(birth) AS Month, MONTHNAME(birth) AS Name,
Count(*) AS Count
FROM president GROUP BY Name ORDER BY Month; #在GROUP BY和ORDER BY子句中使用别名


#出生总统最多的前4个州
mysql> SELECT state, COUNT(*) AS count FROM president
GROUP BY state ORDER BY count DESC LIMIT 4; #COUNT()函数还能与ORDER BY和LIMIT子句联合使用

#HAVING子句：
#HAVING子句与WHERE子句的相似之处是它们都是用来设定查询条件的，输出的行必须符合这些查询条件,
#不同之处在于COUNT()之类的汇总函数的计算结果允许在HAVING子句里出现。
mysql> SELECT state, COUNT(*) AS count FROM president
GROUP BY state HAVING count > 1 ORDER BY count DESC; #HAVING子句

mysql> SELECT
event_id,
MIN(score) AS minimum,
MAX(score) AS maximum,
MAX(score)-MIN(score)+1 AS span,
SUM(score) AS total,
AVG(score) AS average,
COUNT(score) AS count
FROM score
GROUP BY event_id; #MIN() MAX() SUM() AVG() COUNT()统计函数

-----------------------------------
#WITH ROLLUP
#输出"统计结果",将使MySQL对数据行分组统计结果做进一步统计而得到所谓的'超级聚合'值
mysql> SELECT sex, COUNT(*) FROM student GROUP BY sex WITH ROLLUP; #WITH ROLLUP子句
+-----+----------+
| sex | COUNT(*) |
+-----+----------+
| F   |       15 |
| M   |       16 |
| NULL |       31 |
+-----+----------+


mysql> SELECT
    -> event_id,
    -> MIN(score) AS minimum,
    -> MAX(score) AS maximum,
    -> MAX(score)-MIN(score)+1 AS span,
    -> SUM(score) AS total,
    -> AVG(score) AS average,
    -> COUNT(score) AS count
    -> FROM score
    -> GROUP BY event_id
    -> WITH ROLLUP; #WITH ROLLUP子句
+----------+---------+---------+------+-------+---------+-------+
| event_id | minimum | maximum | span | total | average | count |
+----------+---------+---------+------+-------+---------+-------+
|        1 |       9 |      20 |   12 |   439 | 15.1379 |    29 |
|        2 |       8 |      19 |   12 |   425 | 14.1667 |    30 |
|        3 |      60 |      97 |   38 |  2425 | 78.2258 |    31 |
|        4 |       7 |      20 |   14 |   379 | 14.0370 |    27 |
|        5 |       8 |      20 |   13 |   383 | 14.1852 |    27 |
|        6 |      62 |     100 |   39 |  2325 | 80.1724 |    29 |
|     NULL |       7 |     100 |   94 |  6376 | 36.8555 |   173 |
+----------+---------+---------+------+-------+---------+-------+

-----------------------------------
#10.  如何从多个数据表里检索信息

#从多个数据表选取信息的方法： 
		--1. 连接(join): 把两个(或多个)数据表里的同类数据进行匹配而完成的
		--2. 子查询(一个SELECT语句嵌套在另一个SELECT语句里)


mysql> SELECT student_id, date, score, category
FROM grade_event INNER JOIN score
ON grade_event.event_id = score.event_id
WHERE date = '2008-09-23';


mysql> SELECT score.student_id, grade_event.date, score.score, grade_event.category
FROM grade_event INNER JOIN score
ON grade_event.event_id = score.event_id
WHERE grade_event.date = '2008-09-23';



mysql> SELECT
student.name, grade_event.date, score.score, grade_event.category
FROM grade_event INNER JOIN score INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id
WHERE grade_event.date = '2008-09-23';


#>这个查询命令的GROUP BY子句里，数据列名字前面也加上了数据表的名字，
#但就这个查询而言，这并不是必要的。这是因为：GROUP BY子句作用于输出列，
#而这里的查询结果只包含一个名为student_id的列，所以MySQL知道你指的是哪一个。
mysql> SELECT student.student_id, student.name,
COUNT(absence.date) AS absences
FROM student INNER JOIN absence
ON student.student_id = absence.student_id
GROUP BY student.student_id;

#每一位学生的出勤情况
mysql> SELECT student.student_id, student.name,
COUNT(absence.date) AS absences
FROM student LEFT JOIN absence
ON student.student_id = absence.student_id
GROUP BY student.student_id; #LEFT JOIN 外连接

----------------------
SELECT
grade_event.date, grade_event.category,
MIN(score.score) AS minimum,
MAX(score.score) AS maximum,
MAX(score.score)-MIN(score.score)+1 AS span,
SUM(score.score) AS total,
AVG(score.score) AS average,
COUNT(score.score) AS count
FROM score INNER JOIN grade_event
ON score.event_id = grade_event.event_id
GROUP BY grade_event.date;

#!!tip:对设计多个数据表的查询结果里的输出列也可以使用COUNT()和AVG()等汇总函数。
#把与考试日期与考生性别的每一种组合相对应的考生人数(即考试分数的个数)和平均分数统计出来：
mysql> SELECT grade_event.date, student.sex,
COUNT(score.score) AS count, AVG(score.score) AS average
FROM grade_event INNER JOIN score INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id
GROUP BY grade_event.date, student.sex;


#计算每位学生的期末总成绩
mysql> SELECT student.student_id, student.name,
SUM(score.score) AS total, COUNT(score.score) AS n
FROM grade_event INNER JOIN score INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id
GROUP BY score.student_id
ORDER BY total;

#连接操作可作用于同一张数据表
#是否有两位(或者多位)总统出生于同一城市
mysql> SELECT p1.last_name, p1.first_name, p1.city, p1.state
FROM president AS p1 INNER JOIN president AS p2 -- 表别名 (table alias),同列别名，定义表别名时关键字AS也是可选的
ON p1.city = p2.city AND p1.state = p2.state
WHERE (p1.last_name <> p2.last_name OR p1.first_name <> p2.first_name) -- 剔除"记录与它本身相匹配"的情况
ORDER BY state, city, last_name; #同表连接

#!!tip:查出同一天出生的总统
# 此处请不要使用DAYOFYEAR()函数对出生日期进行比较，
# 因为DAYOFYEAR()没有考虑到闰年的因数，所以结果有可能不正确
mysql> SELECT p1.last_name, p1.first_name, p1.birth
FROM president AS p1 INNER JOIN president AS p2
WHERE MONTH(p1.birth) = MONTH(p2.birth)
AND DAYOFMONTH(p1.birth) = DAYOFMONTH(p2.birth)
AND (p1.last_name <> p2.last_name OR p1.first_name <> p2.first_name)
ORDER BY p1.last_name; --使用MONTH()和DAYOFMONTH()比较出生日期中的的月份和日期


#子查询: 把一条SELECT语句嵌套在另一条里

#把全勤学生都找出来
mysql> SELECT * FROM student
WHERE student_id NOT IN (SELECT student_id FROM absence);

#利用子查询可以为1.4.9节的第8小节里提出的问题提供一个单语句解决方案，
mysql> SELECT last_name, first_name, birth FROM president
WHERE birth < (SELECT birth FROM president
WHERE last_name = 'Jackson' AND first_name = 'Andrew'); #那些总统出生在Andrew Jackson之前


#1.4.10 如何删除或更新现有的数据

#syntax: DELETE FROM tb1_name WHERE .. #WHERE子句可选，如果没有WHERE子句，，数据表里全部行将都被删除。

DELETE FROM tb1_name; #删除表中全部数据行。

#!!tip: 删除部分数据，通过WHERE子句过滤，如果不清楚DELETE语句到底会删掉那些数据行，
#最好先把这条语句的WHERE子句放到一条SELECT语句里，看这条SELECT语句能查出那些记录。
mysql> DELETE FROM president WHERE state='OH';

mysql> SELECT last_name, first_name FROM president
WHERE last_name='Roosevelt' AND first_name='Theodore';

mysql> DELETE FROM president
WHERE last_name='Roosevelt' AND first_name='Theodore';

mysql> UPDATE student SET name='George'; #没有可选的WHERE子句，则数据表里每一条记录都会被修改

mysql> INSERT INTO member (last_name, first_name) VALUES('York', 'Jerome');
mysql> UPDATE member
SET expiration='2009-7-20'
WHERE last_name='York' AND first_name='Jerome';

#可以用一条语句修改多个数据列
mysql> UPDATE member
SET email='jeromey@aol.com', street='123 Elm St',
city='Anytown', state='NY', zip='01003'
WHERE last_name='York' AND first_name='Jerome';

#如果某个数据列允许NULL值，可以把它设置为NULL,从而使它处于"未设置"状态
mysql> UPDATE member
SET expiration=NULL
WHERE last_name='York' AND first_name='Jerome';



-----------------------------------------------------------
第二章：使用SQL管理数据
-改变SQL模式以影响MySQL服务器的行为
-各种数据库元素的命名规则
-使用多种字符集
-数据库、数据表和索引的创建和销毁
-获得关于数据库及其内容的信息
-使用联接、子查询和联合操作去检索数据
-创建视图以便从不同的角度去查看数据表里的数据
-多个数据表的删除和刷新操作
-利用事务处理机制一次性执行或撤销多条语句
-创建外键关系
-使用FULLTEXT搜索引擎

#2.1 MySQL服务器的SQL模式
-- 受SQL模式影响的行为包括在数据录入阶段如何处理非法数据、如何引用各种标识符，等等。

-- 模式值不区分大小写
mysql> SET sql_mode=''; #给出一个空字符串以清除该值。
mysql> SET sql_mode='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
mysql> SET GLOBAL sql_mode='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

mysql> SELECT @@global.sql_mode;
+----------------------------------------------------------------+
| @@global.sql_mode                                              |
+----------------------------------------------------------------+
| STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+----------------------------------------------------------------+


mysql> SELECT @@session.sql_mode;
+----------------------------------------------------------------+
| @@session.sql_mode                                             |
+----------------------------------------------------------------+
| STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+----------------------------------------------------------------+

#SQL模式设置值：
-- ANSI_QUOTES: 告诉MySQL服务器把双引号识别为一个标识符引用字符。
-- PIPES_AS_CONCAT 将导致"||"字符串被视为一个标准的SQL字符串合并操作符，而不是"OR"操作符的一个同义词。
-- ANSI是一种复合模式。它将同时启用ANSI_QUOTES、PIPES_AS_CONCAT和另外几种模式值，其结果是让MySQL服务器的
	-- 行为比它的默认运行状态更接近于标准的SQL。

#note: 启用ANSI_QUOTES还有额外的效果--字符串值必须用单引号写出。如果使用双引号，
#MySQL服务器将把该值解释为标识符而不是字符串。

#2.2 MySQL标识符语法和命名规则
-- 标识符里的合法字符
 #1：不加反引号(``)的标识符必须由系统字符集(utf8)中的字母和数字字符，在加上"_"和"$"字符构成。
 #   标识符的的第一个字符可以是允许用在标识符里的任何一个字符，包括数字。不过，不加引号的标识符
 #   不允许完全由数字字符构成，因为那会使它与数值难以区分。  
 #2： 标识符可以用反引号(``)扩括起来(加以界定)，这意味着允许使用任意字符，只有取值为0或255的单字节例外，
 #    当标识符是一个SQL保留字或者包含空格或其他特殊字符的时候，给他加上引号非常使用，给标识符加上反引号
 #    让它可以完全由数字字符构成，如果想在一个加上加上反引号的标志符里使用一个标识符引号字符，双写它既可。
 #    如`create`, `123`, `table name`, 	`my``table`都可作为标识符。best practice: 应尽量避免怪异的标识符。
 
 
 -- 标识符长度：绝大多数标识符的最大长度是64个字符。假名的最大长度是256个字符。
 -- 标识符限定符: 根据上下文，标识符可能需要加以限定，以明确它到底着什么。
	 		#如果想指称一个数据库，把它的名字写出来即可：
	    # use db_name;
	    # SHOW TABLES FROM db_name;
	    #如果想指称一个数据表，有两种选择：
	    	#使用完整的数据表名，它由一个数据库标识符和一个数据表标识符构成：
	    	#SHOW COLUMNS FROM db_name.tb1_name;
	    	#SELECT * FROM db_name.tb1_name;
	   #一个数据表标识符本省对应着默认(当前)数据库里的一个数据表。如果sampdb是默认的数据库，下面的语句是等效的：
	 	 # SELECT * FROM member;
	 	 # SELECT * FROM sampdb.member;
	 	 			#两条相关的命令：use db_name; SELECT DATABASE();
	 	 
	 	 #对数据表明加以限定的考虑同样适用于视图和存储程序的名字。
	 	 #指称一个数据列：
	 	 # case 1: db_name.tb1_name.col_name
	 	 # case 2: tb1_name.col_name
	 	 # case 3: SELECT last_name, first_name FROM president;
 

 -- 如果打算在引用一个完整名字时使用引号，就应该给该名字里的每一个标识符分别加上引号，如：
 SELECT * FROM `sampdb`.`member` WHERE `sampdb`.`member`.`member_id` > 100;
 
#2.3 SQL语句中的字母大小写问题
	-- SQL 关键字和函数名： 不区分大小写
	-- 数据库、数据表视图名：在服务器主机上，MySQL数据库和数据表用底层文件系统中的目录和文件表示。
	--    因而数据库和数据表名字的默认字母大小写情况将取决于服务器主机上的操作系统在文件名方面的规定。
	-- 存储程序的名字: 存储函数、存储过程和事件的名字不区分字母的大小写。触发器的名字要区分要区分字母
	--    的大小写，这一点和标准SQL的行为是不一样的。
	-- 数据列和索引的名字：不区分字母的大小写
	-- 别名的名字： 默认情况下，数据表别名区分字母的大小写。
	-- 字符串值: 取决于它是二进制还是非二进制，而非二进制字符串还要取决于字符集的排序方式。

#2.4.1 字符集的设定

#服务器的默认字符集和排序规则可以启动时用下面选项指定或启动后用用
#character-set-server和collation-server系统变量覆盖：
# --character-set-server
# --collation-server

#在创建数据库和数据表的SQL语句里，有两个子句专门用来设定数据库、数据表和数据列级别的字符集和排序方式：
CHARACTER SET charset
COLLATE collation
--CHARSET 可以用作 CHARSET SET 同义词


#在创建数据库时为他设定一个默认的字符集和排序方式：
CREATE DATABASE db_name CHARACTER SET charset COLLATE collation;
#
CREATE TABLE tb1_name (...) CHARACTER SET charset COLLATE collation;
#对数据表里的某个列，可以使用CHARACTER SET 和 COLLATION 属性为它指定一个字符集和排序方式：
c CHAR(10) CHARACTER SET charset COLLATE collation

#还可以使用COLLATE操作符按照特定排序方式对字符串值排序。如：
SELECT c FROM ORDER BY c COLLATE latin1_spanish_ci;

#2.4.2 确定可供选用的字符集和当前设置
  -- 想知道哪些字符集和排序方式可供选用：
  SHOW CHARACTER SET;
  SHOW COLLATION;
  
  
  SHOW CHARACTER SET LIKE 'latin%';
  SHOW COLLATION LIKE 'utf8%';

#关于可用字符集和排序方式的信息，还可以从information_schema数据库的
#CHARACTER_SETS 和 COLLATIONS 数据表查到。

#显示MySQL服务器当前字符集和排序方式的设置情况，可以使用SHOW VARIABLES语句；
mysql> SHOW VARIABLES LIKE 'character\_set\_%';
mysql> SHOW VARIABLES LIKE 'collation\_%';

#utf8字符集对应着UTF-8编码方案


#2.5 数据库的选定、创建、删除和变更(SCHEMA是DATABASE的同义词)
Use db_name; #选定或切换一个数据库并把它当做指定MySQL服务器连接上的默认(当前)数据库。
							 -- tip: 选定数据库前提是具有相应的权限。
SELECT * FROM sampdb.president; #如果没有选择数据库，可以使用数据库名字限定数据表名。

#数据库创建的完整语法：
CREATE DATABASE [IF NOT EXISTS] db_name [CHARACTER SET charset] [COLLATE collation];

#查看现有数据库的定义
mysql> SHOW CREATE DATABASES mydb;

#2.5.3数据库的删除
DROP DATABASE db_name;
#2.5.4 数据库的变更
#ALTER DATABASES 语句可以改变数据库的全局特征。就目前而言，数据库的全局特征还只有默认字符集和排序规则：
ALTER DATABASE [db_name] [CHARACTER SET charset] [COLLATE collation];

#2.6 数据表的创建、删除、索引和变更
-- 相关语句：CREATE TABLE、ALTER TABLE、DROP TABLE 和 CREATE INDEX、DROP INDEX

#MyISAM：默认的MySQL插件式存储引擎，它是在Web、数据仓储和其他应用环境下最常使用的存储引擎之一。
  #注意，通过更改STORAGE_ENGINE配置变量，能够方便地更改MySQL服务器的默认存储引擎。

SHOW VARIABLES like 'STORAGE_ENGINE';
SELECT @@SESSION.STORAGE_ENGINE;
SELECT @@GLOBAL.STORAGE_ENGINE;
SET STORAGE_ENGINE='InnoDB';
SET GLOBAL STORAGE_ENGINE='InnoDB';

#InnoDB：用于事务处理应用程序，具有众多特性，包括ACID事务支持。
#Federated：能够将多个分离的MySQL服务器链接起来，从多个物理服务器创建一个逻辑数据库。十分适合于分布式环境或数据集市环境。
#BDB：可替代InnoDB的事务引擎，支持COMMIT、ROLLBACK和其他事务特性。
#Archive：用于数据存档的引擎(数据行被插入后就不能再修改了)
#Memory：将所有数据保存在RAM中，在需要快速查找引用和其他类似数据的环境下，可提供极快的访问。
#CSV: 这种存储引擎在存储数据时以逗号作为数据项之间的分隔符。
#其他： http://dev.mysql.com/doc/refman/5.1/zh/pluggable-storage.html#pluggable-storage-choosing

SHOW ENGINES; #查看有哪些存储引擎可供选择,能回答"有哪些支持事务的存储引擎可供选择"之类的问题。
SHOW ENGINES\G   #XA: YES表示是否支持分布式事务


#在MySQL5.1和更高的版本里，查看有哪些支持事务处理的存储引擎可供选用
SELECT ENGINE FROM INFORMATION_SCHEMA.ENGINES WHERE TRANSACTIONS = 'YES';

2. 数据表在硬盘上的存储方式
.frm 数据表的格式定义文件
--------------------------------------------------
			由存储引擎创建的数据表文件
--------------------------------------------------	
MyISAM				.MYD(数据)、.MYI(索引)
InnoDB				.ibd(数据和索引)
CSV						.CSV(数据)、.CSM(元数据)
Archive				.ARZ(数据)、.ARM(元数据)
--------------------------------------------------

#note:Federated引擎用于访问某远程MySQL服务器上的数据表，它本身不创建任何文件。

11.存储引擎的可移植性

2.6.2 创建数据表

mysql> SHOW WARNINGS;
mysql> SHOW ERRORS;

#note: 要想让某个数据表使用特定的存储引擎，就一定要给出相应的ENGINE数据表选项。
#因为默认的存储引擎可以改变，所以省略ENGINE选项与可能导致你预期使用的默认存储引擎与实际不一样。
#此外，一定要保证CREATE TABLE语句没有任何警告信息,与这条语句有关的警告信息基本上都是 "某某存储
#引擎不可用使用了默认的存储引擎"。

SHOW CREATE TABLE tb_name\G
SHOW TABLE STATUS\G

ALTER TABLE tb_name ENGINE = InnoDB;

DROP TABLE IF EXISTS tb_name;


#临时数据表 (它在你与服务器的连接断开时自动消失)
#一个TEMPORARY数据表只对创建该数据表的客户是可见的。
CREATE TEMPORARY TABLE tb_test(
	a bigint primary key auto_increment,
	b int
)ENGINE=InnoDB;

DROP TEMPORARY TABLE tb_test;

4. 从其他数据表或查询结果创建数据表

CREATE TABLE...LIKE: 创建一个新表作为原始数据表的一份空白副本。(包括数据表结构和索引)
CREATE TABLE...SELECT: 从任意一条SELECT语句的查询结果创建新数据表

CREATE TABLE new_tb_name LIKE tb_name;
INSERT INTO new_tb_name SELECT * FROM tb_name;

#创建一个数据表作为它本身的一个临时副本，需要加上TEMPORARY关键字
CREATE TEMPORARY TABLE new_tb_name LIKE tb_name;
INSERT INTO new_tb_name SELECT * FROM tb_name;

CREATE TABLE student_f LIKE student;
INSERT INTO student_f SELECT * FROM student WHERE sex = 'f';


CREATE TABLE mytb1 SELECT pi()*2 AS mycol;
CREATE TABLE t3 SELECT t1.c, t2.c AS c2 FROM t1 INNER JOIN t2;

	CREATE TABLE mytb1 SELECT
	CAST(1 AS UNSIGNED) AS i,
	CAST(CURTIME() AS TIME) AS t,
	CAST(PI() AS DECIMAL(10, 5)) AS d;
mysql> DESCRIBE mytb1;

#还可以在CREATE TABLE部分提供明确的数据列定义：
	CREATE TABLE mytb1(i INT UNSIGNED, t time, d DECIMAL(10, 5))
	SELECT
	CAST(1 AS UNSIGNED) AS i,
	CAST(CURTIME() AS TIME) AS t,
	CAST(PI() AS DECIMAL(10, 5)) AS d;

-------------------------------------------
#使用MERGE数据表(MERGE数据表只能用MyISAM数据表来构成)
CREATE TABLE log_CCYY(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE =MyISAM;

CREATE TABLE log_2004(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE =MyISAM;

CREATE TABLE log_2005(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE =MyISAM;


INSERT INTO log_2004(dt, info) values(now(), "info_log_2004_01");
INSERT INTO log_2004(dt, info) values(now(), "info_log_2004_02");
INSERT INTO log_2005(dt, info) values(now(), "info_log_2005_aa");
INSERT INTO log_2005(dt, info) values(now(), "info_log_2005_bb");

DELETE FROM log_merge WHERE info = 'info_log_2004_02'
UPDATE log_merge SET info='abc' WHERE info = 'info_log_2005_aa'

CREATE TABLE log_merge(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE = MERGE UNION = (log_2004, log_2005);


mysql> select * from log_merge;
+---------------------+------------------+
| dt                  | info             |
+---------------------+------------------+
| 2013-11-02 15:56:57 | info_log_2004_01 |
| 2013-11-02 15:56:57 | info_log_2004_02 |
| 2013-11-02 15:56:57 | info_log_2005_aa |
| 2013-11-02 15:56:58 | info_log_2005_bb |
+---------------------+------------------+


#INSERT_METHOD 的可选值为NO、FIRST、LAST
CREATE TABLE log_merge_insertable(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE = MERGE UNION = (log_2004, log_2005) INSERT_METHOD = LAST;


CREATE TABLE log_2006(
	dt DATETIME NOT NULL,
	info VARCHAR(100) NOT NULL,
	INDEX (dt)
)ENGINE =MyISAM;


INSERT INTO log_2006(dt, info) values(now(), "info_log_2006_01");

ALTER TABLE log_merge_insertable UNION = (log_2004, log_2005, log_2006) INSERT_METHOD = FIRST;

-------------------------------------------

6.使用分区数据表

--------------------------------------------------------------
7.使用FEDERATED数据表
#FEDERATED存储引擎可以让你访问在其他主机上由另一个MySQL服务器实际管理的数据表。
#对于每一个你想如此访问的数据表，你必须创建与远程数据表有着同样数据列的FEDERATED
#数据表,并给出相应的连接字符串让本地服务器知道如何连接远程服务器。

假设远程服务器上的student数据表有着如下的定义：
CREATE TABLE student(
	name VARCHAR(20) NOT NULL,
	sex ENUM('F', 'M') NOT NULL,
	student_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(student_id)
)ENGINE=InnoDB;

CREATE TABLE federated_student(
	name VARCHAR(20) NOT NULL,
	sex ENUM('F', 'M') NOT NULL,
	student_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(student_id)
)ENGINE=FEDERATED #MySQL 5.0.13之前的版本需要用COMMENT选项代替CONNECTION选项
CONNECTION = 'mysql://sampadm:secret@corn.snake.net/sampdb/student';


CREATE TABLE federated_student(
	name VARCHAR(20) NOT NULL,
	sex ENUM('F', 'M') NOT NULL,
	student_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(student_id)
)ENGINE=FEDERATED 
CONNECTION = 'mysql://root:1234@localhost:3306/db_02/student';

#!!note: 这里有一个值得注意的问题,整个CONNECTION字符串(包括用户名和口令)
#      对可以使用SHOW CREATE TABLE或类似语句去查看你的FEDERATED数据表
#      的任何人来说都是可见的。从MySQL5.1.15版开始，你可以避免这个问题：
#      提前用CREATE SERVER 语句创建一个存储服务器定义(这需要SUPER权限)，
#			 然后再CONNECTION选项里写出该服务器名字即可。如下面这条语句定义了
#      一个名为corn_sampdb-server的存储服务器：

CREATE SERVER corn_sampdb_server
FOREIGN DATA WRAPPER mysql
OPTIONS (
	USER 'sampadm',
	PASSWORD 'secret',
	HOST 'corn.snake.net',
	DATABASE 'sampdb'
);

#!!MySQL服务器将把这个定义保存为mysql数据库中的servers数据表的一个数据行。
#如下语句创建了一个引用这个服务器定义的数据表
CREATE TABLE federated_student2 (
	name VARCHAR(20) NOT NULL,
	sex ENUM('F', 'M') NOT NULL,
	student_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (student_id)
)ENGINE=FEDERATED 
CONNECTION = 'corn_sampdb-server/student';

--------------------------------------------------------------

2.6.3 删除数据表

#删除数据表
DROP TABLE tb_name;
#删除多个数据表
DROP TABLE  tb_name01, tb_name02;

DROP TABLE IF EXISTS tb_name;

DROP TEMPORARY TABLE tb_name; #只想删除临时数据表

2.6.4 问数据表编制索引

改变现有数据表的存储引擎的语法：
ALTER TABLE tb_name ENGINE=InnoDB;

mysql存储引擎的索引特性 //TODO：列表

2. 创建索引
# 可在使用CREATE TABLE语句创建新数据表时创建索引，也可用
# ALTER TABLE或CREATE INDEX语句给现有数据表添加索引。(MySQL 会在
# 内部把CREATE INDEX语句映射为ALTER TABLE操作)
# ALTER TABLE语句比CREATE INDEX语句更灵活多能,因为它可以用来创建MySQL
# 所能支持的任何一种索引。比如说：
ALTER TABLE tb_name ADD INDEX index_name (index_columns); #多个数据列可用逗号隔开
ALTER TABLE tb_name ADD UNIQUE index_name (index_columns);
ALTER TABLE tb_name ADD PRIMARY KEY (index_columns);
ALTER TABLE tb_name ADD FULLTEXT index_name (index_columns);
ALTER TABLE tb_name ADD SPATIAL index_name (index_columns);

# 其中index_name是可选的，如果没有给出，MySQL将根据第一个带索引的数据列给它挑一个名字。
# 如果某个索引是一个PRIMARY KEY H或 SPATIAL索引，带索引的数据列必须具备NOT NULL属性。
# 其他用途的索引都允许包含NULL值。

# 只需用逗号把它们隔开，你就可以在同一条ALTER TABLE语句里包括多个对数据表的改动，这意味着
# 你可以同时创建多个索引：如下：
CREATE TABLE t01 (a int, b int);
ALTER TABLE t01 ADD INDEX idx_a(a), ADD INDEX idx_b(b);

#除PRIMARY KEY以外, 其他类型的索引几乎都可以用CREATE INDEX语句来添加:
#与ALTER TABLE语句不同的是，CREATE INDEX 语句里的index_name不是可选的，
#你也不能用一条CREATE INDEX 语句创建多个索引：
CREATE INDEX index_name ON tb1_name (index_columns);
CREATE UNIQUE INDEX index_name ON tb1_name (index_columns);
CREATE FULLTEXT INDEX index_name ON tb1_name (index_columns);
CREATE SPATIAL INDEX index_name ON tb1_name (index_columns);

# 在使用 CREATE TABLE 语句创建新数据表的同时为它创建索引语法，和使用
# ALTER TABLE语句添加索引时用的语法很相似,这需要你在定义各数据列的基础上再
# 增加一些索引创建子句：
CREATE TABLE tb_name(
	... column definitions ...
	INDEX index_name (index_columns),
	UNIQUE index_name (index_columns),
	PRIMARY KEY (index_columns),
	FULLTEXT index_name (index_columns),
	SPATIAL index_name (index_columns),
	...
);
#类似于ALTER TABLE语句，index_name在这里也是可选的。如果你省略了它，MySQL将为你挑选一个。

#作为一种特殊情况，你可以通过在某个数据列的定义的末尾加上一条PRIMARY KEY或UNIQUE子句的办法，
#来创建一个单数据列的PRIMARY KEY 或 UNIQUE索引， 如
CREATE TABLE mytb(
	i INT NOT NULL PRIMARY KEY,
	j CHAR(10) NOT NULL UNIQUE
);

#MEMORY数据表的默认索引类型是HASH,利用散列索引进行精确值查询的数度非常快，这也是
#MEMORY数据表的典型用法。不过如果你打算用一个MEMORY数据表进行范围比较(如id<100),散列
#索引的效果就没那么理想了。在遇到这类情况时，你最好创建一个BTREE索引代替之。具体做法
#是在索引定义里增加一条USING BTREE子句：
CREATE TABLE namelist (
	id INT NOT NULL,
	name CHAR(100),
	INDEX USING BTREE (id)
)ENGINE=MEMORY;


#  如果只对某个字符串数据列的一个前缀编索引，在索引定义里命名数据列的语法是col_name(n)
#  而不是简单的col_name。n的含义是索引应该包括数据列值的前n个字节(二进制字符串类型)或
#  前n个字符(非二进制字符串类型)。如：
CREATE TABLE addresslist (
	name CHAR(30) NOT NULL,
	address BINARY(60) NOT NULL,
	INDEX (name(10)), #对前10个字符编了索引
	INDEX (address(15)) #对前15个字节编了索引
);


3： 删除索引
# 删除索引的工作可以用DROP INDEX 或 ALTER TABLE 语句来完成。 如果使用的是 DROP INDEX语句，
# 你必须给出要删除的索引的名字：
DROP INDEX index_name ON tb_name; #等价于 

#如果你想用DROP INDEX语句删除一个PRIMARY KEY,就必须以一个带引号的标识符的形式给出名字PRIMARY,如
DROP INDEX 'PRIMARY' ON tb_name;
#类似于CREATE INDEX语句，DROP INDEX在MySQL内部将被当做一条ALTER TABLE语句来处理。
# 上面两条语句分别等价于：
ALTER TABLE tb_name DROP INDEX index_name;
ALTER TABLE tb_name DROP PRIMARY KEY;

#note:  如果你不知道某给定数据表的索引的名字， 可以用SHOW CREATE TABLE 和 SHOW INDEX
#       把它们查出来

#!!note: 当你从数据库删除数据列时，索引也会隐式地受到影响。如果你删除的数据列是某个索引的组成
#        部分， MySQL将从索引里删除那个数据列。如果你把构成某个索引的数据列全都丢弃了，
#        MySQL将删除整个索引。

2.6.5：改变数据表的结构
# 在表中添加列，请使用下列语法:
ALTER TABLE table_name ADD column_name datatype;
# 如
ALTER TABLE tb_name ADD COLUMN new_add_column int(10) unsigned NOT NULL ;

# 删除表中的列，请使用下列语法：
ALTER TABLE table_name DROP COLUMN column_name;
#注释：某些数据库系统不允许这种在数据库表中删除列的方式 (DROP COLUMN column_name)。

# ALTER TABLE 语句的语法：
ALTER TABLE tb_name action [, action] ...;

#有些数据库系统只允许一条ALTER TABLE语句完成一个动作，但MySQL允许用一条ALTER TABLE语句完成多个改动。

#改变数据列的数据类型：
# 可以使用 CHANGE 或 MODIFY子句。
ALTER TABLE mytb MODIFY column_name INT UNSIGNED;
ALTER TABLE mytb CHANGE column_name column_name INT UNSIGNED;
# 为什么在使用CHANGE子句时需要写两遍数据列的名字呢？因为CHANGE子句能够(而MODIFY子句不能)
# 做到的事情是在改变其数据类型的同时重新命名一个数据列。如果想在改变其数据类型的同时把数据列
# i 重新命名为 k, 你可以这样做：
ALTER TABLE mytb CHANGE i k MEDIUMINT UNSIGNED;
ALTER TABLE mytb CHANGE column_name new_column_name INT UNSIGNED;

# 如果只想改变数据列的名字，不改变它的数据类型，先写出CHANGE old_name new_name,在写出数据列
# 的当前定义即可

# 你可以为数据列指定字符集“
ALTER TABLE tb_name MODIFY column_name VARCHAR(20) CHARACTER SET utf8;

# 改变数据类型的重要原因之一，是改善涉及多个数据表中的数据列比较的关联查询的性能。索引通常可以
# 用来在关联查询里比较两个相似的数据列类型，而如果两个数据列的类型完全相同的话，比较的数度会更快。
# 
SELECT ... FROM t1 INNER JOIN t2 WHERE t1.name = t2.name;
# 如果t1.name是CHAR(10), t2.name是CHAR(15), 查询的速度将不如它们都是CHAR(15)时那么快。
# 你可以把它们改成相同的, 先面两条语句都可以把t1.name改成你需要的样子：
ALTER TABLE t1 MODIFY name CHAR(15);
ALTER TABLE t1 CHANGE name name CHAR(15);

# 让数据表改用另一种存储引擎
ALTER TABLE tb_name ENGINE = engine_name;  #engine_name不区分字母大小写
#让数据表改用另一种存储引擎的常见原因是让它具备事务安全性。如
ALTER TABLE tb_name ENGINE = InnoDB;

#当你打算让数据表改用另一种存储引擎时，能否达到你的目的还要取决于新老两种存储引擎的功能是否兼容。

#InnoDB数据表可以被转换使用另一种存储引擎，不过，如果你为你的InnoDB数据表定义了外键约束条件，那些
#约束条件在转换后将不复存在，因为只有InnoDB才支持外键。


#重新命名一个数据表
# 用RENAME子句给数据表起一个新名字:
ALTER TABLE tb_name RENAME TO new_tb_name;
# 另一个办法是使用RENAME TABLE语句来重新命名数据表：
RENAME TABLE tb_old_name TO new_name;

# ALTER TABLE语句每次只能重新命名一个数据表，而RENAME TABLE语句可以一次重新命名多个数据表
# 如可以向下面这样交换两个数据表的名字：
RENAME TABLE t1 TO tmp, t2 TO t1, tmp TO t2;

#如果在重新命名一个数据表时在它的名字前面加上了数据库名前缀，就可以把它从一个数据库移动到另一个数据库。
#下面两条语句都可以把数据表t从sampdb数据库移动到test数据库去：
ALTER TABLE sampdb.t RENAME TO test.t;
RENAME TABLE sampdb.t TO test.t;

#note: 不能把一个数据表重新命名为一个已有的名字
# 如果重新命名的某个MyISAM数据表时某个MERGE数据表的成员，你必须重新定义那个MERGE数据表，
# 让它使用那个MyISAM数据表的新名字。

2.7： 获取数据库的元数据：
# MySQL提供了好几种办法供我们获取关于数据库和数据库里各种对象(也就是数据库的元数据)的信息：
 -- 各种SHOW语句， 如 SHOW DATABASES 或 SHOW TABLES;
 -- INFORMATION_SCHEMA 数据库里的数据表
 -- 命令行程序, 如mysqlshow 或 mysqldump

# 用SHOW语句获取元数据
SHOW DATABASES; #列出服务器所管理的数据库
SHOW CREATE DATABASE db_name; #查看给定数据库的CREATE DATABASE语句

#查看默认数据库或给定数据库里的数据表:
SHOW TABLES;
SHOW TABLES FROM db_name;

SHOW CREATE TABLE tb1_name; #查看数据表的CREATE TABLE语句

# 查看数据表里的数据列或索引信息
SHOW COLUMNS FROM tb_name;
SHOW INDEX FROM tb_name;


DESCRIBE tb_name 和 EXPLAIN tb_name 语句是 SHOW COLUMNS FROM tb_name语句的同义语句


# 查看默认数据库或某给定数据库里的数据表的描述性信息：
SHOW TABLE STATUS;
SHOW TABLE STATUS FROM db_name;

# 有几种SHOW语句还可以带有一条LIKE 'pattern'子句，这个子句用来把SHOW语句的输出限制在给定范围。
# MySQL将把'pattern'表达式解释为SQL模式，这种模式允许包含"%" 和 "_" 通配符。 如 
SHOW COLUMNS FROM tb_name LIKE 's%';

# 如果需要在LIKE模式里实际使用某个通配符，必须在该字符的前面加上一个反斜线进行转义。
# 这种情况常见于需要匹配"_"(下划线)字符时，该字符经常出现在数据库、数据表和数据列的名字里。

# 支持LIKE子句的所有SHOW语句都可以被改写为使用一条WHERE子句。WHERE子句应该引用SHOW语句将
# 输出的数据列。如果某个数据列的名字是一个保留字(如KEY),就必须以带反引号的标识符的方式给出。
# 下面这条语句用来确定student数据表里的主键是哪一个数据列：
SHOW COLUMNS FROM student WHERE `Key` = 'PRI';

# 有时候， 如何能从一个应用程序里检查某个给定的数据表是否存在，这将很有用。可以用SHOW TABLES语句
# 来达到这个目的(但别忘了SHOW TABLES语句的输出里不包括TEMPORARY数据表):
SHOW TABLES LIKE 'tb_name';
SHOW TABLES LIKE FROM db_name LIKE 'tb_name';

#你可以通过下面两条语句中的一条去检查某给定数据表的存在，它们可以把TEMPORARY数据表也找出来：
SELECT COUNT(*) FROM tb_name; 
SELECT * FROM tb_name WHERE FALSE;
#如果数据表存在，这两条语句都将执行成功；如果不存在，两条语句都将失败。
#第一条语句最试用于MyISAM数据表，因为不带WHERE子句的COUNT(*)函数已经得到了
#高度优化。它不太试用于InnoDB数据表，因为对InnoDB数据表的数据行的总数进行统计将
#导致一次全表扫描。第二条语句更通用一些，它在任何一种存储引擎下都执行的很快。


2.7.2 从information_schema数据库获取元数据
SHOW TABLES IN INFORMATION_SCHEMA;

SCHEMATA  数据库
TABLES		数据表
VIEWS     视图
ROUTINES	存储例程(stored routine)
TRIGGERS	触发器
EVENTS		数据库里的事件
PARTITIONS 数据表分区
COLUMNS		 数据列信息

FILES     关于NDB硬盘数据文件的信息

TABLE_CONSTRAINTS、KEY_COLUMN_USAGE 关于数据表和数据列上的约束条件的信息。

STATISTICS	关于数据表索引特性的信息
REFERENTIAL_CONSTRAINTS 关于外键信息

CHARACTER_SETS、COLLATIONS、COLLATION_CHARACTER_SET_APPLICABILITY 关于所支持的字符集、
										 每种字符集的排序方式、每种排序方式与它的字符集的映射关系的信息。

ENGINES、PLUGINS 关于存储引擎和服务器插件的信息。

USER_PRIVILEGES、SCHEMA_PRIVILEGES、TABLE_PRIVILEGES、COLUMN_PRIVILEGES 
		全局、数据库、数据表和数据列的权限信息。这些信息分别来自mysql数据库里的user、
		db、tables_priv、column_priv数据表

GLOBAL_VARIABLES、SESSION_VARIABLES、GLOBAL_STATUS、SESSION_STATUS
		全局和回话级系统变量和状态变量的值。

DESC INFORMATION_SCHEMA.CHARACTER_SETS;
DESCRIBE INFORMATION_SCHEMA.CHARACTER_SETS;

SELECT * FROM DESCRIBE INFORMATION_SCHEMA.tb_name;


SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA='sampdb' AND TABLE_NAME='member';
 
SELECT ENGINE FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA='sampdb' AND TABLE_NAME='member';

2.7.3 从命令行获取元数据

% mysqlshow --password=1234 --user=root --host=localhost
% mysqlshow db_name --password=1234 --user=root --host=localhost
% mysqlshow db_name tb_name --password=1234 --user=root --host=localhost
% mysqlshow --keys db_name tb_name --password=1234 --user=root --host=localhost
% mysqlshow --status db_name --password=1234 --user=root --host=localhost

% mysqldump --no-data --status db_name [tb_name] --password=1234 --user=root --host=localhost


2.8：利用连接操作对多个数据表进行检索

SELECT语句的基本语法如下所示：
SELECT select_list						# What columns to select
FROM table_list								# The tables from which to select rows
WHERE row_constraint					# What conditions rows must satisfy
GROUP BY grouping_columns			# How to group results
ORDER BY sorting_columns			# How to sort results
HAVING group_constraint				# What conditions groups must satisfy
LIMIT count;									# Row count limit on results

# 有些数据库软件要求FROM子句必不可少，但MySQL没有这样做。
SELECT SQRT(POW(3,2) + POW(4,2));


2.1.8	内联接
CREATE TABLE t1(
	i1 bigint PRIMARY KEY AUTO_INCREMENT,
	c1 VARCHAR(20)
);

INSERT INTO t1 SELECT null, 'a';
INSERT INTO t1 SELECT null, 'b';
INSERT INTO t1 SELECT null, 'c';
+----+------+
| i1 | c1   |
+----+------+
|  1 | a    |
|  2 | b    |
|  3 | c    |
+----+------+

CREATE TABLE t2(
	i2 bigint PRIMARY KEY AUTO_INCREMENT,
	c2 VARCHAR(20)
);

INSERT INTO t2 SELECT null, 'a';
INSERT INTO t2 SELECT null, 'c';
INSERT INTO t2 SELECT null, 'b';
INSERT INTO t2 SELECT null, 'a';
DELETE FROM t2 WHERE i2 = 1;
+----+------+
| i2 | c2   |
+----+------+
|  2 | c    |
|  3 | b    |
|  4 | a    |
+----+------+

SELECT * FROM t1 INNER JOIN t2;
SELECT t1.*, t2.* FROM t1 INNER JOIN t2;

#推荐的内联语法SQL92(recommented).
SELECT t1.*, t2.* FROM t1 INNER JOIN t2 ON t1.i1 = t2.i2;
+----+------+----+------+
| i1 | c1   | i2 | c2   |
+----+------+----+------+
|  2 | b    |  2 | c    |
|  3 | c    |  3 | b    |
+----+------+----+------+

CROSS JOIN 和 JOIN 联接类型类似于INNER JOIN. 比如说：下面的语句是等价的：
SELECT t1.*, t2.* FROM t1 INNER JOIN t2 WHERE t1.i1 = t2.i2;
SELECT t1.*, t2.* FROM t1 CROSS JOIN t2 WHERE t1.i1 = t2.i2;
SELECT t1.*, t2.* FROM t1 JOIN t2 WHERE t1.i1 = t2.i2;


2.8.2 避免歧义：如何在联接操作中给出数据列的名字
SELECT a, mytb01.b, mytb02.b, c FROM mytb01 INNER JOIN mytb02 ...;

SELECT tb_role01.col01, tb_role02.col02 
FROM mytb01 AS tb_role01 INNER JOIN mytb01 AS tb_role02 
WHERE tb_role01.col01 > tb_role02.col02;

2.8.3 左联接和右联接(外联接)
#note: LEFT OUTER JOIN 是 LEFT JOIN 的同义词
SELECT t1.*, t2.* FROM t1 LEFT JOIN t2 ON t1.i1 = t2.i2;
+----+------+------+------+
| i1 | c1   | i2   | c2   |
+----+------+------+------+
|  2 | b    |    2 | c    |
|  3 | c    |    3 | b    |
|  1 | a    | NULL | NULL |
+----+------+------+------+

SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.i1 = t2.i2;
+------+------+----+------+
| i1   | c1   | i2 | c2   |
+------+------+----+------+
|    2 | b    |  2 | c    |
|    3 | c    |  3 | b    |
| NULL | NULL |  4 | a    |
+------+------+----+------+

SELECT t1.*, t2.* FROM t1 LEFT JOIN t2 ON t1.i1 = t2.i2
WHERE t2.i2 IS NULL;
+----+------+------+------+
| i1 | c1   | i2   | c2   |
+----+------+------+------+
|  1 | a    | NULL | NULL |
+----+------+------+------+

SELECT t1.* FROM t1 LEFT JOIN t2 ON t1.i1 = t2.i2
WHERE t2.i2 IS NULL;
+----+------+
| i1 | c1   |
+----+------+
|  1 | a    |
+----+------+

SELECT 
	student.name, student.student_id,
	grade_event.date, grade_event.event_id, grade_event.category
FROM
	student INNER JOIN grade_event
	LEFT JOIN score ON student.student_id = score.student_id
									AND grade_event.event_id = score.event_id
WHERE
	score.score IS NULL
ORDER BY
	student.student_id, grade_event.event_id;


2.9：用子查询进行多数据表检索
# MySQL支持子查询(subquery), 也就是把一条SELECT语句用括号括起来嵌入另一个SELECT语句。
# 如：
SELECT * FROM score
WHERE event_id IN (SELECT event_id FROM grade_event WHERE category = 'T');

子查询可以返回以下不同类型的信息:
-- 标量子查询将返回一个值
-- 数据列子查询将返回一个由一个或多个值构成的数据列。
-- 数据行子查询将返回一个由一个或多个值构成的数据行。
-- 数据表子查询将返回一个由一个或多个数据行构成的数据表，
   数据行可以由一个或多个数据列构成。


子查询的结果可以用以下不同的办法进行测试：
-- 标量子查询可以的结果可以用诸如"="或"<"之类的相对比较操作符进行求值。
-- 可以用IN 和 NOT IN 操作符来测试某给定值是否包含在子查询的结果集里。
-- 可以用ALL、ANY和SOME操作符把某给定值与子查询的结果集进行比较。
-- 可以用EXISTS 和 NOT EXISTS操作符来测试子查询的结果集是否为空。

# note: 标量子查询可以出现在允许使用标量操作数的任何地方，你可以把它用作
#       表达式里的一个操作数或函数的输入参数，还可以让它出现在输出数据列的清单里。
#       数据列、数据行和数据表子查询可以返回返回更多的信息，但只能用在不要求必须
#       使用单个值得上下文里。

# 子查询即可以与主查询相关-----需要引用和依赖于主查询里的值，也可以与之不相关。


# 除了SELECT语句，子查询还可以用在其他语句里，不过，如果子查询用在一条会改变
# 数据表内容的语句(INSERT、 REPLACE、 DELETE、 UPDATE、 LOAD DATA)里，目前还
# 必须遵守这样一条限制：子查询不允许引用正在被修改的数据。

# 有些子查询可以被改写为连接查询


2.9.1：子查询与关系比较运算符
# =、<>、>、>=、<、和<=操作符用来进行相对值比较。它们可以和标量子查询配合使用:
# 用子查询返回值来构造一个检索条件，再由主查询根据该条件做进一步检索。如：
SELECT * FROM score
WHERE event_id = 
(SELECT event_id FROM grade_event
	WHERE date = '2008-09-23' AND category = 'Q');
# 子查询的这种用法要求它只返回一个值。否则整条语句会以失败告终。有时候，为了
# 确保子查询返回且只返回一个值，有必要用LIMIT 1 对只查询的结果加以限制。

# 如果你遇到的问题可以通过在WHERE子句里使用某个聚合函数去解决，就应该考虑用标量
# 子查询和相对比较操作符。比如说，如果你想知道president数据表里的哪位总统出生得
# 最早，你可能会写出如下所示的语句:
SELECT * FROM president WHERE birth = MIN(birth);	# error, 该语句语法错误
# 可这个办法是行不通的--你不能再WHERE子句里使用聚合函数。WHERE子句的用途是
# 确定应该选取那些数据行，但MIN()的值只有在选取完数据行之后才能确定下来。不过，
# 你可以向下面这样用一个子查询把最早的出生日期检索出来：
SELECT * FROM president 
WHERE birth = (SELECT MIN(birth) FROM president);  # OK

# 如果子查询返回的是一个数据行，你可以用一个数据行构造器把一组值(一条临时创建的记录)
# 与子查询的结果进行比较。如下：
SELECT last_name, first_name, city, state FROM president
WHERE (city, state) = 
(SELECT city, state FROM president
WHERE last_name = 'Adams' AND first_name = 'Jhon');

# 你也可以使用ROW(city, state)表示法，它等价于(city, state)。它们都可以用来生成一条临时记录。

2.9.2：IN 和 NOT IN子查询
# 如果你的子查询将返回多个数据行，你可以用IN和NOT IN操作符来构造主查询的检索条件。
# 查找在absence数据表里有缺勤记录和没有缺勤记录(也就是全勤)的学生：
SELECT * FROM student
WHERE student_id IN (SELECT student_id FROM absence);

SELECT * FROM student
WHERE student_id NOT IN (SELECT student_id FROM absence);

# IN 和 NOT IN操作符还可以用在将返回多个数据列的子查询里。换句话说，你
# 可以在数据表子查询里使用它们。此时，你需要使用一个数据行构造器来给出将
# 与各数据列比较的比较值。
SELECT last_name, first_name, city, state FROM president
WHERE (city, state) IN 
(SELECT city, state FROM president
WHERE last_name = 'Roosevelt');

# IN 和 NOT IN 操作符其实是 = ANY 和 <> ALL 的同义词

2.9.3 ALL、ANY 和 SOME 子查询

SELECT last_name, first_name, birth FROM president
WHERE birth <=ALL (SELECT birth FROM president);

SELECT last_name, first_name, birth FROM president
WHERE birth <= ANY (SELECT birth FROM president);


# 当ALL、ANY或SOME操作符与"="比较操作符配合使用时，子查询可以是一个数据表子查询。
# 此时，你需要使用一个数据行构造器来提供与子查询所返回的数据行进行比较的比较值。
SELECT last_name, first_name, city, state FROM president
WHERE (city, state) = ANY
(SELECT city, state FROM president
WHERE last_name = 'Roosevelt');

2.9.4： EXISTS 和 NOT EXISTS
# EXISTS 和 NOT EXISTS 操作符只测试某个子查询是否返回了数据行：如果是，
# EXISTS将是true, NOT EXISTS将是false.
SELECT EXISTS (SELECT * FROM absence);
+--------------------------------+
| EXISTS (SELECT * FROM absence) |
+--------------------------------+
|                              1 |
+--------------------------------+
SELECT NOT EXISTS (SELECT * FROM absence);
+------------------------------------+
| NOT EXISTS (SELECT * FROM absence) |
+------------------------------------+
|                                  0 |
+------------------------------------+


SELECT EXISTS (SELECT 1 FROM absence);
+--------------------------------+
| EXISTS (SELECT 1 FROM absence) |
+--------------------------------+
|                              1 |
+--------------------------------+
SELECT NOT EXISTS (SELECT 1 FROM absence);
+------------------------------------+
| NOT EXISTS (SELECT 1 FROM absence) |
+------------------------------------+
|                                  0 |
+------------------------------------+

2.9.5: 与主查询相关的子查询
# 主查询可以与主查询相关，也可以与之无关
 --  与主查询无关的子查询不引用主查询里的任何值。与主查询无关的子查询可以脱离主查询作为一条独立
     -- 的查询命令去执行。如
     SELECT j FROM t2 WHERE j IN (SELECT i FROM t1);
 --  与主查询相关的子查询需要引用主查询里的值，所以必须依赖于主查询。意味这种联系，与主查询相关的
 		 -- 子查询不能脱离主查询作为一条独立的查询命令去执行。如
 		 SELECT j FROM t2 WHERE (SELECT i FROM t1 WHERE i = j);

# 与主查询相关的子查询通常用在EXISTS 和 NOT EXISTS子查询里。这类子查询主要用来在某个数据表里查找在
# 另一个数据表里有匹配数据行或没有匹配数据行的数据行。

# 与主查询相关的子查询的工作情况是：把值从主查询传递到子查询，看它们是否满足在子查询里给出的条件。因此，
# 如果数据列的名字有可能引起歧义的话(在不同的数据表里有同名的数据列)，千万不要忘记使用数据表的名字来限定数据列


SELECT student_id, name FROM student WHERE EXISTS
(SELECT * FROM absence WHERE absence.student_id = student.student_id);


SELECT student_id, name FROM student WHERE NOT EXISTS
(SELECT * FROM absence WHERE absence.student_id = student.student_id);


2.9.6 FROM 子句中的子查询
# 子查询可以用在FROM子句里以生成一些值。在这种情况里，子查询的结果在行为上就像是一个
# 数据表。FROM 子句里的子查询可以参加关联操作，它的值可以在WHERE子句里被测试，等等。在
# 使用这种子查询的时候，你必须提供一个数据表的别名作为子查询的结果的名字：
SELECT * FROM (SELECT 1, 2) AS t1 INNER JOIN (SELECT 3, 4) AS t2;
+---+---+---+---+
| 1 | 2 | 3 | 4 |
+---+---+---+---+
| 1 | 2 | 3 | 4 |
+---+---+---+---+

2.9.7: 把子查询改写为联接查询
有相当一部分使用子查询的查询命令可以被改写为一个联接查询。有时候，连接查询要比子查询
的执行效率更高，所以把子查询改写为联接查询是个不坏的主意。如果一条只用了子查询的SELECT
语句需要很长时间执行完毕，就应该尝试把它改写为一个联接查询，看它是不是执行得更好。

1：如何改写用来选取匹配值的子查询：
SELECT * FROM score
WHERE event_id IN (SELECT event_id FROM grade_event WHERE category = 'T');
-- 也可以写成不使用子查询的样子，只要把它转换为一个简单的联接操作就行了：
SELECT score.* FROM score INNER JOIN grade_event
ON score.event_id = grade_event.event_id WHERE grade_event.category = 'T';

# 一般形式：
SELECT * FROM table1
WHERE column1 IN (SELECT column2a FROM table2 WHERE column2b = value);
-- 之类查询可以被转换为如下所示的联接查询：
SELECT table1.* FROM table1 INNER JOIN table2 
ON table1.column1 = table2.column2a WHERE table2.column2b = value;
#!!tip: 在某些场合，子查询和关联查询可能返回不同的结果。这发生在table2包含
#       多个column2a的实例的时候。子查询只为每个column2a值生成一个实例，联接
#       操作会把它们都生成出来并导致在其输出里出现重复地数据行。如果你想防止
#       这种重复，在编写连接查询命令时就要用SELECT DISTINCT 来代替 SELECT。


2：如何改写用来选取非匹配(缺失)值的子查询：
# 子查询语句的另一种常见用法是检索在一个数据表有，在另一个数据表里没有的值。前面看到，
#  与"那些值没有出现"有关的问题通常都可以用LEFT JOIN来解决。如
SELECT * FROM student
WHERE student_id NOT IN (SELECT student_id FROM absence);
-- 这条语句可以被改写为如下所示的LEFT JOIN查询命令：
SELECT student.*
FROM student LEFT JOIN absence ON student.student_id = absence.student_id
WHERE absence.student_id IS NULL;

# 一般说来，如果子查询语句有如下所示形式：
SELECT * FROM table1
WHERE column1 NOT IN (SELECT column2 FROM table2);
-- 就可以把它改写为下面这样的连接查询：
SELECT table1.*
FROM table1 LEFT JOIN table2 ON table1.column1 = table2.column2
WHERE table2.column2 IS NULL;
#!!tip: 注意：这里需要假设table2.column2被定义成NOT NULL;


2.10 用UNION语句进行多数据表检索：
# 如果想把多个查询的结果合并在一起创建一个结果集，可以使用UNION语句来做这件事。
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t3;

SELECT i FROM t1 UNION SELECT i FROM T2 UNION SELECT i FROM t3;

UNION有以下特性：
数据列的名字和数据类型：
	UNION结果集里的数据列名字来自第一个SELECT语句里的数据列的名字。UNION中的第二个
	和再后面的SELECT语句必须选取个数相同的数据列，但各有关数据列不必有同样的名字或
	数据类型。(一般来说，同一条UNION语句里的各有关数据列会是相同的数据类型，但这并
	不是一项要求。如果他们不一样，MySQL会进行必要的类型转换)。数据列是根据位置而不
	是根据名字进行匹配的。这也正是下面两条语句会返回不同结果的原因：
	SELECT i, c FROM t1 UNION SELECT i, d FROM t3;
	SELECT i, c FROM t1 UNION SELECT d, i FROM t3;
	#在每条语句里，结果中的每个数据列的数据类型是根据被选取的值而确定的。
	
重复数据行的处理
	# 在默认情况下，UNION将从结果集里剔除重复地数据行。
	SELECT 1, 2 UNION SELECT 1, 2 UNION SELECT 1, 3;
	+---+---+
	| 1 | 2 |
	+---+---+
	| 1 | 2 |
	| 1 | 3 |
	+---+---+
	# UNION DISTINCT 和 UNION 是同义词，它们都只保留不重复地数据行。
	# 如果你想保留重复地数据行，需要把每个UNION 该为 UNION ALL.
	SELECT 1, 2 UNION ALL SELECT 1, 2 UNION ALL SELECT 1, 3;	
	+---+---+
	| 1 | 2 |
	+---+---+
	| 1 | 2 |
	| 1 | 2 |
	| 1 | 3 |
	+---+---+
	
	# 如果把 UNION (或UNION DISTINCT) 和 UNION ALL 混杂在一起使用，每个UNION(或UNION DISTINCT)
	# 操作符将优先于它左边的任何UNION ALL操作。


ORDER BY 和 LIMIT 处理
	如果你想将UNION结果作为一个整体进行排序，需要用括号把每一个SELECT语句括起来并在最后一个SELECT
	语句的后面加上一个ORDER BY子句。注意，因为UNION的结果的数据列的名字来自第一个SELECT语句，所以
	你在ORDER BY子句里必须引用那些名字而不是引用来自最后一个SELECT语句的数据列的名字：
	(SELECT i, c FROM t1) UNION (SELECT i, d FROM t3) 
	ORDER BY c;
	# 如果某个排序数据列有别名，位于UNION语句末尾的ORDER BY子句必须引用那个别名，此外，ORDER BY
	# 不能引用数据表的名字。如果为了排序而需要以table_name.col_name的形式给出一个来自第一个SELECT
	# 语句的数据列名字，必须给那个数据列起一个别名并在ORDER BY子句里引用那个别名。

类似的，如果你想限制UNION语句所输出的数据行的个数，可以在语句末尾加上一个LIMIT子句。
	(SELECT * FROM t1) UNION (SELECT * FROM t2) UNION (SELECT * FROM t3) LIMIT 2;

# 在UNION语句中，ORDER BY 和 LIMIT还可以用在被括号括起来的各条SELECT"子句"里。此
# 时，它们将只作用于那条SELECT语句。
(SELECT * FROM t1 ORDER BY i LIMIT 2) 
UNION (SELECT * FROM t2  ORDER BY i LIMIT 1) 
UNION (SELECT * FROM t3  ORDER BY d LIMIT 2);
#!!tip: 在用括号括起来的各个SELECT语句里的ORDER BY只能在LIMIT也出现时才能使用，以确定
#       LIMIT将作用于哪些数据行。此时，它只影响那条SELECT语句的结果，不影响最终的UNION
#       结果里的数据行的先后顺序。

MERGE数据表上的SELECT语句相当于UNION ALL(不剔除重复的数据行),SELECT DISTINCT相当于
UNION 或 UNION DISTINCT (剔除重复地数据行)。



2.11： 使用视图
	视图是一种虚拟的数据表。它们的行为和数据表一样，但并不真正包含数据。它们是用底层(真正的)数据
	表或其他视图定义出来的"假"数据表，用来提供查看数据表数据的另一种方法，通常可以简化应用程序。

	SELECT last_name, first_name, city, state FROM president;
	
	# 定义一个视图并取名为vpres
	CREATE VIEW vpres AS
	SELECT last_name, first_name, city, state FROM president;
	
mysql> SELECT * FROM vpres;
+------------+---------------+---------------------+-------+
| last_name  | first_name    | city                | state |
+------------+---------------+---------------------+-------+
| Washington | George        | Wakefield           | VA    |
| Adams      | John          | Braintree           | MA    |

SELECT * FROM vpres WHERE last_name = 'Adams';

# 在查询视图时还可以使用ORDER BY、LIMIT等子句，其效果与查询一个真正的数据表时的情况一样。

# 在默认的情况下,视图里的数据列的名字与SELECT语句里列出的输出数据列相同。如果你想要明确
# 的改用另外的数据列名字，需要在定义视图时在视图名字的后面用括号列出那些新名字：
CREATE VIEW vpres2 (ln, fn) AS
SELECT last_name, first_name FROM president;
#此后，当你使用这个视图时，必须使用在括号里给出的数据列的名字，而非SELECT语句里的名字；
SELECt ln, fn FROM vpres2;

# 视图可以用来自动完成必要的数学运算
mysql> CREATE VIEW vpres_age AS
SELECT last_name, first_name, birth, death,
TIMESTAMPDIFF(YEAR, birth, death) AS age
FROM president;

# 同一个视图可以涉及多个数据表，这使得连接查询的编写和运行变得更容易：
CREATE VIEW vstudent AS
SELECT student.student_id, name, date, score, category
FROM grade_event INNER JOIN score INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id;

mysql> SELECT * FROM vstudent;
mysql> SELECT * FROM vstudent WHERE name='emily';

# 有些视图是可更新的，这意味着你可以通过对视图进行操作而在其底层数据表里插入、更新或删除数据行。
# 下面是一个简单的例子：
CREATE TABLE t (i INT);
INSERT INTO t(i) VALUES (1), (2), (3);
CREATE VIEW v AS SELECT i FROM t;
SELECT i FROM v;

INSERT INTO v(i) VALUES(4);
DELETE FROM v WHERE i < 3;
SELECT i FROM v;

UPDATE v SET i = i + 1;
SELECT i FROM v;

要想让一个视图是更新的，它必须直接映射到一个数据表，它选取的数据列只能是数据表里数据列的简单引用
(不能是表达式)，视图里的单行操作必须对应于对其底层数据表里的一个单行操作。比如说： 如果某个视图
里有一个"汇总"数据列是用一个聚合函数计算出来的，这个视图里的每个数据行都将涉及其底层数据表里的多个数据行。
这样的视图是不可更新的。因为你如法告诉MySQL应该更新其底层数据表里的哪一个数据行。



2.12： 涉及多个数据表的删除和更新操作
DELETE FROM t WHERE id > 100;
# 将从数据表t1里把其id值可以在另一个数据表t2里找到的数据行全部删掉。
DELETE t1 FROM t1 INNER JOIN t2 ON t1.id = t2.id;

# DELETE有一种语法可以让我们一次删除多个数据表里的数据行。如果你想从两个数据表里把id值相匹配的数据行都删掉，
# 必须在DELETE关键字的后面写出两个数据表的名字。
DELETE t1, t2 FROM t1 INNER JOIN t2 ON t1.id = t2.id;

# 在设计多个数据表的DELETE语句里可以使用允许用在SELECT语句里的任何一种连接操作，所以我们可以按照编写一条
# 从多个数据表选取不匹配数据行的SELECT语句的思路去思考。这通常会归结到是选用LEFT JOIN 还是选用 RIGHT JOIN
# 上，比如：如果要从数据表t1里把在数据表t2里没有匹配的数据行找出来，你应该会写出一条如下所示的SELECT语句：
SELECT t1.*, FROM t1 LEFT JOIN t2 ON t1.id = t2.id WHERE t2.id IS NULL;
# 同样，从数据表t1找出并删除那些数据行的DELETE语句也要用到一个LEFT JOIN操作：
DELETE t1 FROM t1 LEFT JOIN t2 ON t1.id = t2.id WHERE t2.id IS NULL;

# MySQL还支持另一种涉及多个数据表的DELETE语法。这种语法使用一个FROM子句来列出将从中删除有关数据行的数据表,
# 使用一个USING子句来联结各有关数据表以确定那些数据行需要被删除。前面那几条涉及多个数据表的DELETE语句可以
# 用这种语法改写为如下所示的样子：
DELETE FROM t1 USING t1 INNER JOIN t2 ON t1.id = t2.id;
DELETE FROM t1, t2 USING t1 INNER JOIN t2 ON t1.id = t2.id;
DELETE FROM t1 USING t1 LEFT JOIN t2 ON t1.id = t2.id WHERE t2.id IS NULL;

编写涉及多个数据表的UPDATE语句的基本步骤与编写涉及多个数据表的DELETE语句很相似。同样需要列出涉及的全部数据表，
同样需要用数据表的名字对数据列的名字进行必要的限定。

给每位学生的考生成绩加上一分：
UPDATE score, grade_event SET score.score = score.score + 1
WHERE score.event_id = grade_event.event_id
AND grade_event.date = '2008-09-23' AND grade_event.category = 'Q';
具体到这个问题，你也可以用一个基于子查询的单数据表更新操作来达到同样的目的：
UPDATE score SET score = score + 1
WHERE event_id = (SELECT event_id FROM grade_event
WHERE date = '2008-09-23' AND category = 'Q');
但其他类型的更新操作能不能用子查询来完成就不一定了。比如说，假设你不仅需要根据另一个
数据表的内容来确定应该刷新某给定数据表里的那些数据行，还需要把另一个数据表的数据列值
复制到这个数据表里。下面这条语句将把符合条件的t1.a复制到t2.a,而需要满足的条件是数据行
有匹配的id数据列值：
UPDATE t1, t2 SET t2.a = t1.a WHERE t2.id = t1.id;
如果是对InnoDB数据表进行多数据表删除和刷新操作，你不必非得使用刚才介绍的语法。更好的办法
是在数据表之间建立一个外键关系并给它加上ON DELETE CASCADE 或 ON UPDATE CASCADE 约束条件。


2.13： 事务处理:
事务(transaction)是作为一个不可分割的逻辑单元而被执行的一个SQL语句，如果必要，它们的执行效果可以被撤销。
事务处理是通过提交(commit)和回滚(rollback)功能实现的。

提交和回滚机制使我们能够确保尚未全部完成的操作不会影响到数据库，不会让新旧数据混杂在一起让
数据库呈不稳定状态。
事务的另一种用途是确保某个操作所涉及的数据行在你正在使用它们时不会被其他客户修改。
MySQL在执行每一条SQL语句时都会自动地对该语句所涉及的资源进行锁定以避免各语句之间相互
干扰。但这仍不足以保证每一个数据库操作总能得到预期的效果。要知道，有些数据库操作需要
多条语句才能完成，而在此期间，不同的客户就有可能相互干扰。通过吧多条语句定义为一个执行
单元，事务机制可以防止在多客户环境里可能发生的并发问题。

事务机制的特性通常被概括为"ACID原则"。ACID是Atomic(原子性)、Consistent(稳定性)、Isolated(孤立性)
和Durable(可靠性)的首字母缩写，它们分别代表事务机制应该具备的一个属性。
原子性： 构成一个事务的所有语句应该是一个独立的逻辑单元，要么全部执行成功，要么一个都不成功。你不能
         只执行它们当中的一部分。
稳定性：数据库在事务开始执行之前和事务执行完毕之后都必须是稳定的。换句话说：事务不应该把你的数据库
        弄得一团糟。
隔离性： 事务不应该相互影响。
可靠性： 如果事务执行成功，它的影响将被永久性地记录到数据库里。

事务处理为数据库操作的结果提供了强有力的保证，但这需要以增加CPU、内存和硬盘空间等方面
的开销为代价。MySQL提供了几种具备事务安全性的存储引擎(如InnoDB和Falcon)和一些不具备事务
安全性的存储引擎(如MyISAM和MEMORY)。 有些应用程序需要通过事务来实现，另外一些则不然，你
可以根据具体情况挑选最适合的。一般来说，与金融有关的操作应该以事务方式完成，这是因为财务
数据的完整性要比额外增加的开销成本更重要。从另一方面看，对于一个负责把Web页面的访问情况
记入数据库表的应用程序来说，在主机崩溃时损失一些数据行应该是可以忍受的，你可以选用一种非
事务存储引擎以避免事务处理所要求的额外开销。

2.13.1 利用事务来保证语句的安全执行
  # 要想使用事务，就必须选用一种支持事务处理的存储引擎，如InnoDB等。

在默认情况下，MySQL从自动提交(autocommit)模式运行，这种模式会在每条语句执行完毕后把它作出
的修改立刻提交给数据库并使之永久化。事实上，这相当于把每一条语句都隐含地当做一个事务来执行。
如果你想明确地执行一个事务，需要禁用自动提交模式并告诉MySQL你想让它在何时提交或回滚有关的修改。

执行事务的常用办法是发出一条START TRANSACTION(或 BEGIN)语句挂起自动提交模式，然后执行构成本次
事务的各条数据，最后用一条COMMIT语句结束事务并把它们作出的修改永久性地记入数据库。万一在事务过程
中发生错误，用一条ROLLBACK语句撤销事务并把数据库恢复到事务开始之前的状态。START TRANSACTION 语句
"挂起"自动提交模式的含义是：在事务被提交或回滚之后，该模式将恢复到开始本次事务的START TRANSACTION
语句被执行之前的状态(如果自动提交模式原来是激活的，结束事务将让你回到自动提交模式;如果它原来是
禁止的，结束当前事务将开始下一个事务。)。
# 如下是一个演示例子：
mysql> CREATE TABLE t(name CHAR(20), UNIQUE(name)) ENGINE = InnoDB;
mysql> START TRANSACTION;
mysql> INSERT INTO t SET name = 'William';
mysql> INSERT INTO t SET name = 'Wallace';
mysql> COMMIT;
mysql> SELECT * FROM t;
+---------+
| name    |
+---------+
| Wallace |
| William |
+---------+
你可以看到一些数据行已被记录到了数据表里。如果你另外启动一个mysql程序的实例并在插入之后，
但提交之前选取数据表t的内容的话，你将看不到那些数据行。在第一个mysql进程发出COMMIT语句
之前，那些数据行对第二个mysql进程来说是不可见的。

如果子事务过程中发生了错误，你可以用ROLLBACK语句把它删除。仍以数据表t为例，你可以通过
发出下面这些语句看到这种情况：
mysql> START TRANSACTION;
mysql> INSERT INTO t SET name = 'Gromit';
mysql> INSERT INTO t SET name = 'Wallace';
ERROR 1062 (23000): Duplicate entry 'Wallace' for key 'name'
mysql> ROLLBACK;
mysql> SELECT * FROM t;
+---------+
| name    |
+---------+
| Wallace |
| William |
+---------+

#!!tip: 如果在事务过程中发出一条 START TRANSACTION 语句，它将隐含地提交当前事务，然后
#       开始一个新事务。


执行事务的另一个办法是利用SET语句直接改变自动提交模式的状态：
SET autocommit = 0; #禁用自动提交模式
SET autocommit = 1; #
# 把aucocommit变量设置为0将禁用自动提交模式，其效果是随后的任何语句都将成为当前
# 事务的一部分，直到你发出一条COMMIT或ROLLBACK语句来提交或撤销它为止。如果使用
# 这个办法，自动提交模式的状态将一直保持下去直到你把它设置回原来的状态，所以结束
# 一个事务将开始下一个事务。你也可以通过重新激活自动提交模式的办法来提交一个事务。 

我们来看看这个办法的工作情况。首先，创建一个和前面的例子一样的数据表：
DROP TABLE t;
CREATE TABLE t (name CHAR(20), UNIQUE (name)) ENGINE = InnoDB;
接下来，禁用自动提交模式，插入一些数据行，提交本次事务：
SET autocommit = 0;
INSERT INTO t SET name = 'William';
INSERT INTO t SET name = 'Wallace';
COMMIT;
SELECT * FROM t;
+---------+
| name    |
+---------+
| Wallace |
| William |
+---------+
现在，有两个数据行被插入了数据表，但自动提交模式仍处于被禁用状态。如果你发出
一些语句，它们将成为一个新事务的组成部分，它们的提交或撤销与第一个事务不会有
任何关系。下面这些语句可以证明自动提交模式仍处于被禁用状态，并且ROLLBACK将撤销
尚未被提交的语句：
INSERT INTO t SET name = 'Gromit';
INSERT INTO t SET name = 'Wallace';
ERROR 1062 (23000): Duplicate entry 'Wallace' for key 'name'
ROLLBACK;
SELECT * FROM t;
+---------+
| name    |
+---------+
| Wallace |
| William |
+---------+
要想重新自动激活提交模式，使用下面这条语句即可：
SET autocommit = 1; 
# 正如刚才所描述的那样，发出一条COMMIT或ROLLBACK语句将结束当前事务，先禁用自动提交
# 模式、在重新激活它也将结束当前事务。在其他环境下，事务也会结束。SET COMMIT、
# START TRANSACTION、BEGIN、COMMIT和ROLLBACK语句会明确地对事务产生影响，除它们以外，
# 还有一些语句会对事务产生隐式影响，因为它们不能成为事务的一部分。一般来说，用来创建
# 、改变或删除数据库或其中的对象的DDL(Data Definition Language,数据定义语言)语句以及
# 与锁定有关的语句都不能成为事务的一部分。比如说，如果你在事务过程中发出了下面这些语句
# 之一，服务器将在执行该语句之前先提交当前事务：
ALTER TABLE
CREATE INDEX
DROP DATABASE
DROP INDEX
DROP TABLE
LOCK TABLE
RENAME TABLE
SET autocommit = 1 (if not already set to 1)
TRUNCATE TABLE
UNLOCK TABLES (if tables currently are locked)
如果你想知道你正在使用的MySQL版本都有哪些语句会隐含地提交当前事务，请查阅<MySQL参考手册>.

事务提交前，客户连接的正常结束或意外中断也将导致事务结束。此时，服务器会自动回滚该客户正
提交的所有事务。
如果客户程序在与服务器连接意外断开后再自动重建连接，新建的连接将被重置为激活自动提交模式的默认状态。

2.13.2 使用事务保存点
MySQL使你能够对一个事务进行部分回滚。这需要你在事务过程中使用SAVEPOINT语句设置一些称为保存点
(savepoint)的标记。在后续的事务里，如果你想回滚到某个特定的保存点，在ROLLBACK语句里给出该保存点
的名字就可以了。下面的语句演示了这个过程：
CREATE TABLE t (i INT)  ENGINE = InnoDB;
START TRANSACTION;
INSERT INTO t VALUES(1);
SAVEPOINT my_savepoint;
INSERT INTO t VALUES(2);
ROLLBACK TO SAVEPOINT my_savepoint;
INSERT INTO t VALUES(3);
COMMIT;
SELECT * FROM t;
+------+
| i    |
+------+
|    1 |
|    3 |
+------+

2.13.3: 事务的隔离性
  因为MySQL是一个多用户数据库系统，所以不同的客户可能会在同一时间试图访问同一个
  数据表。诸如MyISAM之类的存储引擎使用了数据表级的锁定机制来保证不同的客户不能
  同时修改同一个数据表，但这种做法在更新量比较大的系统上会导致并发性能下降。
  InnoDB存储引擎采用了另一种策略，它使用了数据行级的锁定机制为客户对数据表
  的访问提供了更细致的控制：在某个客户修改某个数据行的同时，另一个客户可以读取
  和修改同一个数据表里的另一个数据行。如果有两个客户想同时修改某个数据行，先锁定
  该数据行的那个客户将可以先修改它。这比数据表级的锁定机制提供了更好的并发性能。
  不过，这里还有一个问题： 一个客户的事务在何时才能看到另一个客户的事务做出的修改：
  
	InnoDB存储引擎实现的事务隔离级别机制能够让客户控制他们想看到其他事务作的哪些修改。
	它提供了多种不同的隔离级别以允许或预防在多个事务同时运行时可能发生的各种各样的问题，
	如下所示：
	-- 脏读(dirty read): 指某个事务所作出的修改在它尚未被提交时就可以被其他事务看到。
											其他事务会认为数据行已经被修改了，但对数据行作出修改的那个
											事务还有可能被回滚，这将导致数据库里的数据发生混乱。
  -- 不可重复读取(nonrepeatable read): 只同一个事务使用同一条SELECT语句每次读取到的结果
  										不一样。比如说，如果有一个事务执行了两次同一个SELECT语句，但另一个
  										事务在SELECT语句的两次执行之间修改了一些数据行，就会发生这种问题。
  -- 幻影数据行(phantom row): 指某个事务突然看到了一个它以前没有见过数据行。比如说，如果
  										某个事务刚执行完一条SELECT语句就有另一个事务插入了一个新数据行，前
  										一个事务再执行同一条SELECT语句时就可能多看到一个新的数据行，那就是
  										一个幻影数据行。
为了解决这些问题,InnoDB存储引擎提供了4中隔离级别。这些隔离级别用来确定允许某个事务看到与之
同时执行的其他事务所作出的哪些修改，如下所示：
 -- READ UNCOMMITTED: 允许某个事务看到其他事务尚未提交的数据行改动。
 -- READ COMMITED: 	只允许某个事务看到其他事务已经提交的数据行改动。
 -- REPEATABLE READ: 如果某个事务两次执行同一个SELECT语句，其结果是可重复的。换句话说，即使有
 										 其他事务在同时插入或修改数据行，这个事务所看到的数据行也是一样的。
 -- SERIALIZABLE: 这个隔离级别和REPEATABLE READ很相似，但对事务的隔离更彻底：某个事务正在
 									查看的数据行不允许其他事务修改，直到该事务完成为止。换句话说：如果某个事务
 									正在读取某些数据行，在它完成之前，其他事务将无法对那些数据行修改。

该表列出了这4中隔离级别以及它们是否允许脏读、不可重复读去或幻影数据行等问题。这个表格只适用于
InnoDB存储引擎--REPEATABLE READ隔离级别不能容忍幻影数据行。有些数据库系统的REPEATABLE READ隔离
级别允许出现幻影数据行。
										-- 隔离级别允许的问题 --
-----------------------------------------------------------------------------
隔离级别										脏读				不可重复读				幻影数据行
-----------------------------------------------------------------------------
READ UNCOMMITTED						是							是								是
READ COMMITED								否							是								是
REPEATABLE READ							否							否								否
SERIALIZABLE								否							否								否
-----------------------------------------------------------------------------

InnoDB存储引擎默认使用的隔离级别是REPEATABLE READ	。这可以通过在启动服务器是使用
--transaction-isolation选项或在服务器运行时使用SET TRANSACTION语句来改变。该语句
有3中形式：
SET GLOBAL TRANSACTION ISOLATION LEVEL level;
SET SESSION TRANSACTION ISOLATION LEVEL level;
SET TRANSACTION ISOLATION LEVEL level;

SUPER 权限的客户可以使用SET TRANSACTION 语句改变全局隔离级别的设置，该设置将作用于
此后连接到服务器的任何客户。此外，任何客户都可以修改它自己的事务隔离级别，用
SET SESSION TRANSACTION 语句做出的修改将作用于在与服务器的本次会话里后续的所有事务，
用SET TRANSACTION 语句做出的修改只作用于下一个事务。客户在修改它自己的隔离级别时不
需要任何特殊的权限。

2.13.4 事务问题的非事务解决方案
	在一个不支持事务的环境里，有些事务问题可以想办法解决，有些问题则毫无办法。，下面将
	讨论那些问题可以，那些问题不可以在不使用事务的情况下得到解决。你可以利用这些信息去
	判断是否可以把这里介绍的技巧用在某个应用程序里，以避免因为使用具备事务安全性的数据表
	而增加开销。
		-- 明确的锁定数据表
					把多条语句用LOCK TABLES 和 UNLOCK TABLES 语句括起来就可以把它们当做一个单元来执行：
					锁定需要使用的所有数据表，发出你的语句，解除锁定。这可以防止其他人在你锁定有关数据表
					期间修改它们。利用这种锁定机制完成前面的衬衫库存数量更新操作的过程如下所示：
					(1) 售货员A卖出了3件衬衫并把单据录入了电脑。你的销售管理软件开始更新数据库，它先锁定
					    数据表并选取当前的衬衫库存数量(47):
					    LOCK TABLES inventory WRITE;
					    SELECT quantity FROM inventory WHERE item = 'shirt';
					    这里需要使用WRITES锁，因为整个操作的最终目的是修改inventory数据表，需要对它进行写操作。
					 (2)与此同时，售货员B也卖出了两件衬衫并把单据录入了电脑。第二台电脑里的软件也开始更新数据库，
					    它也是先从锁定数据表开始：
					    LOCK TABLES inventory WRITE;
							具体到这个例子，这条语句将被阻塞，因为售货员A已经锁定那个数据表了。
					 (3) 第一台电脑计算出新的库存数量是47-3=44件，它更新了衬衫件数并解除了锁定：
					     UPDATE inventory SET quantity = 44 WHERE item = 'shirt';
					     UNLOCK TABLES;
					  (4) 在第一台电脑解除了对数据表的锁定之后，第二台电脑的锁定请求成功了，它继续执行
					  		并检查出当前衬衫库存数量是44件：
					  		SELECT quantity FROM inventory WHERE item = 'shirt';
					  (5) 第二台电脑计算出新的库存数量是44-2=42件，它更新了衬衫件数并解除了锁定：
							  UPDATE inventory SET quantity = 42 WHERE item = 'shirt';
							  UNLOCK TABLES;
						就这样，来自两个操作的各语句不再相互混杂，对库存数量的修改也就不会再出现错误了。
						如果你正在使用多个数据表，在执行多语句操作之前必须把它们全部锁定。如果你只从某个
						特定的数据表读取数据，你只需要给它加上一个"读操作"锁就行了，用不着给它加上"写操作"
						锁。("读操作"锁允许其他客户在你使用被锁定数据表时读取它，但不允许对之进行写操作。)
						比如说，假设你有一组查询是用来修改inventory数据表的，你还需要从customer数据表读取一些
						数据。此时，你需要给inventory数据表加上一把"写操作"锁，给customer数据表加上一把"读操作"
						锁:
						LOCK TABLES inventory WRITE, customer READ;
						 ... use the tables here ...
						UNLOCK TABLES;
			
					
		-- 使用相对更新操作，不使用绝对更新操作
					在先明确锁定数据表再更新库存的办法里，整个操作需要两条语句来完成，一条语句用来查询
					当前库存水平，另一条语句用来计算本次销售后的衬衫库存数量并对数据表进行相应的更新。
					让多个客户同时进行的操作互不干扰的另一个办法，是把整个操作压缩成只用一条语句来完成。
					这将消除多语句操作中各条语句之间的彼此依赖。并非所有的操作都可以只用一条语句完成，但
					就刚才那个更新衬衫库存数量的例子而言，这个策略是可行的。只要把计算衬衫库存数量的语句修改
					为使用相对于它的当前值就可以只用一个步骤完成库存更新操作了。如下所示：
					(1) 售货员A卖出了3件衬衫，销售管理软件把衬衫的当前库存数量减去3:
					   UPDATE inventory SET quantity = quantity - 3 WHERE item = 'shirt';
					(2)售货员B卖出了2件衬衫，销售管理软件把衬衫的当前库存数量减去2:
					   UPDATE inventory SET quantity = quantity - 2 WHERE item = 'shirt';
					这个办法的优点是数据库修改时不再需要使用多条语句。这消除了并发问题，所以不在
					需要明确地锁定数据表。如果你打算执行的某个操作与此相似，也许根本用不着借助
					事务机制就可以完成它。
		# 刚才介绍的这两种非事务解决方案可以解决许多实际问题，但他们也有一定的局限性，如下所示:
		  -1. 并非所有的操作都可以被编写成一条相对更新语句。有些问题只有使用多条语句才能解决，你
		      必须考虑和解决随之而来的并发问题。
		  -2. 在多语句操作期间锁定数据表可以避免客户之间相互干扰，但万一在操作过程中出现错误
		      又会发生什么样的事情？ 此时，你肯定希望能够撤销此前已执行完毕的语句对数据库的影响，
		      不让改了一半儿的数据留在数据库里造成数据库的不稳定。令人遗憾的是，虽然数据库锁定机制
		      可以帮助你解决并发问题，，但如果所涉及的数据表不支持事务处理，它们也不能为你的善后
		      恢复工作提供多少帮助。
		  -3 锁定机制需要你锁定和释放数据表。如果你改用了其他的数据表，千万不要忘记对LOCK TABLES
		     语句作相应的修改。
		
#事务数据表和非事务数据表可以混用吗?????????????????????????
  在某次事务中混合使用事务数据表和非事务数据表时允许的，但最终的结果不一定符合你的期望。
对非事务数据表进行操作的语句总是立刻生效，即便是自动提交模式处于禁用状态也是如此。事实上，
非事务数据表永远待在自动提交模式下，每条语句都会在执行完毕后立刻提交。因此，如果你在一个
事务里修改了一个非事务数据表，那么这个修改将无法撤销。


2.14 外键和引用完整性
		 利用外键(foreign key)关系可以在某个数据表里声明与另一个数据表里的某个索引相关联的索引。
		 还可以把你想施加在数据表上的约束条件放到外键关系里，让系统根据这个关系里的规则来维护数据
		 的引用完整性。
		 
		 在MySQL里，InnoDB存储引擎提供了外键支持。
		 
		 相关术语：
		 父表： 包含原始键值得数据表
		 子表： 引用父表中的键值的相关数据表
		 
父表中的键值用来关联两个数据表。具体地说，子表中的某个索引引用父表中的某个索引。子表里的
索引值必须匹配父表中的索引值或是被设置为NULL以表明在父表里不存在与之对应的数据行。子表里
的索引就是所谓的"外键",因为他们存在于父表的外部，但包含指向父表的值。外键关系可以被设置成
不允许使用NULL值，此时所有的外键值都必须匹配父表里的某个值。


2.14.1  外键的创建和使用
在子表里定义一个外键的语法如下所示：
[CONSTRAINT constraint_name]
FOREIGN KEY [fk_name] (index_columns)
REFERENCES tb1_name (index_columns)
[ON DELETE action]
[ON UPDATE action]
[MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]


ALTER TABLE tbl_name
    ADD [CONSTRAINT [symbol]] FOREIGN KEY
    [index_name] (index_col_name, ...)
    REFERENCES tbl_name (index_col_name,...)
    [ON DELETE reference_option]
    [ON UPDATE reference_option]

这个语法本身很完美，但InnoDB存储引擎目前还没有实现所有的子句：
它目前还不支持MATCH子句，即使你给出了一条MATCH子句，它也会被忽略。
有几种action值目前只能被识别出来，但不会有任何效果。(除InnoDB以外
的其他存储引擎在遇到FOREIGN KEY定义时不会报告错误，但会把它整个忽略掉。)


InnoDB存储引擎目前能够识别和支持以下外键定义语法成分：
CONSTRAINT子句： 如果给出，这个子句用来给外键约束关系起一个名字。如果你省略
								了它，InnoDB存储引擎将创建一个名字。
FOREIGN KEY子句： 列出子表里的被索引数据列，它们必须匹配父表里的索引值。fk_name
									是外键的ID.如果你给出了一个fk_name,在InnoDB存储引擎能够为外键自动
									创建一个索引的情况下它将成为那个索引的名字；否则，它将被忽略。
REFERENCES子句：列出父表和父表中的索引数据列的名字，子表里的外键将引用这个子句所列出
								的父表数据列，在REFERENCES子句的index_columns部分列出的数据列的个数必须与
								在FOREIGN KEY子句的index_columns部分列出的数据列的个数相同。
ON DELETE子句： 用来设定在父表里的数据行被删除时子表应该发生什么事。如果没有ON DELETE子句，
								其默认的行为是拒绝从父表里删除仍有子表数据行在引用它们的数据行。如果你想明确地
								指定一种action值，请使用以下语句之一：
								-- ON DELETE NO ACTION 和 ON DELETE RESTRICT 子句： 它们的含义与省略ON DELETE
								   子句一样。(有些数据库系统提供了延迟检查功能，而NO ACTION是一种延迟检查。在MySQL里，
								   外键约束条件是被立刻检查的，所以NO ACTION 和 RESTRICT 的含义完全一样。)
								-- ON DELETE CASCADE 子句：在删除父表数据行时，子表里与之相关的数据行也将被删除。
									 本质上，删除效果将从父表蔓延到子表。这样一来，你只需删除父表里的数据行并让InnoDB存储引擎
									 负责从子表删除相关的数据行，就可以完成一个涉及多个数据表的删除操作了。
								-- ON DELETE SET NULL子句：	在删除父表数据行时，子表里与之相关联的索引列将被设置为NULL.
								   如果你打算使用这个选项，就必须把外键定义里列出的所有被编制索引的子表数据列定义为允许
								   NULL值。(使用这个动作的一个隐含限制是你不能把外键定义为PRIMARY KEY,因为主键不允许为NULL。)
								-- ON DELETE SET DEFAULT子句：这个子句可以被识别出来，但目前尚未实现；InnoDB存储引擎在遇到
									 这个子句时将报告一个错误。
ON UPDATE子句：用来设定当父表里的数据行更新时子表应该发生什么事。如果没有ON UPDATE子句，其默认行为是拒绝插入或
               更新其外键值在父表索引里没有任何匹配的子表数据行，并阻止仍有子表数据行在引用这它们的父表索引值
               被更新。可供选择的action值及其效果与ON DELETE子句的相同。

如果你想建立一个外键关系， 请遵守以下指示
		-- 子表必须有这样一个索引。 在定义该索引时，必须首先列出外键数据列。父表必须有这样一个索引：在定义该索引时，
			 必须首先列出REFERENCES子句里的数据列。(换句话说，外键里的数据列在外键关系所涉及的两个数据表里都必须有索引。)，
			 在定义外键关系之前，你必须明确地创建出必要的父表索引。InnoDB存储引擎将自动地在子表里为外键数据列(引用数据列)
			 创建一个索引--如果在你用来创建子表的CREATE TABLE语句里没有包括一个这样的索引的话。不过,由InnoDB存储引擎自动
			 创建的这种索引将是一个非唯一索引，并且只包含外键数据列。如果你想让这个子表索引是一个PRIMARY KEY或UNIQUE索引，
			 或者如果你想让它在外键数据列之外还包括其他数据列，就只能由你本人明确地定义它了。
   -- 父表和子表索引里的对应数据列必须是兼容的数据类型。比如说，你不能让一个INT数据列去匹配一个CHAR数据列。对应的
      字符数据列必须是同样的长度。对应的整数数据列必须是同样的尺寸，并且必须要么都带符号，要么都被定义成UNSIGNED。
   -- 你不能对外键关系里的字符串数据列的前缀编制索引。换句话说：对于字符串数据列，你必须对整个数据列编制索引，不能
      只对它的前几个字符编制索引。

CREATE TABLE parent(
	par_id INT NOT NULL,
	PRIMARY KEY (par_id)
)ENGINE=InnoDB;

CREATE TABLE child(
	par_id INT NOT NULL,
	child_id INT NOT NULL,
	PRIMARY KEY (par_id, child_id),
	FOREIGN KEY (par_id) REFERENCES parent (par_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)ENGINE=InnoDB;


INSERT INTO parent (par_id) VALUES(1), (2), (3);
INSERT INTO child (par_id, child_id) VALUES(1, 1), (1, 2);
INSERT INTO child (par_id, child_id) VALUES(2, 1), (2, 2), (2, 3);
INSERT INTO child (par_id, child_id) VALUES(3, 1);

SELECT * FROM parent;
+--------+
| par_id |
+--------+
|      1 |
|      2 |
|      3 |
+--------+
SELECT * FROM child;
+--------+----------+
| par_id | child_id |
+--------+----------+
|      1 |        1 |
|      1 |        2 |
|      2 |        1 |
|      2 |        2 |
|      2 |        3 |
|      3 |        1 |
+--------+----------+

-- 外键约束效果
mysql> INSERT INTO child (par_id, child_id) VALUES(4, 1);
ERROR 1452 (23000): Cannot add or update a child row: 
a foreign key constraint fails (`ysg_test01`.`child`, 
CONSTRAINT `child_ibfk_1` FOREIGN KEY (`par_id`) 
REFERENCES `parent` (`par_id`) ON DELETE
CASCADE ON UPDATE CASCADE)

--  级联删除效果
mysql> DELETE FROM parent WHERE par_id = 1;
mysql> SELECT * FROM parent;
+--------+
| par_id |
+--------+
|      2 |
|      3 |
+--------+
mysql> SELECT * FROM child;
+--------+----------+
| par_id | child_id |
+--------+----------+
|      2 |        1 |
|      2 |        2 |
|      2 |        3 |
|      3 |        1 |
+--------+----------+

-- 级联更新效果
UPDATE parent SET par_id = 100 WHERE par_id = 2;
mysql> SELECT * FROM parent;
+--------+
| par_id |
+--------+
|      3 |
|    100 |
+--------+
mysql> SELECT * FROM child;
+--------+----------+
| par_id | child_id |
+--------+----------+
|      3 |        1 |
|    100 |        1 |
|    100 |        2 |
|    100 |        3 |
+--------+----------+

mysql> SELECT * FROM child;
+--------+----------+
| par_id | child_id |
+--------+----------+
|   NULL |        1 |
|   NULL |        1 |
|   NULL |        2 |
|   NULL |        2 |
|   NULL |        3 |
|      3 |        1 |
+--------+----------+

如果你查看某个InnoDB数据表都有哪些外键关系，可以使用SHOW CREATE TABLE 或 SHOW TABLE STATUS语句。
如果你在试图创建一个带有外键关系的数据表时遇到问题，可以使用SHOW ENGINE INNODB STATUS语句查看
完整的出错信息。

 
 第3章  数据类型
 
 # 要想使用好MySQL,就必须透彻理解MySQL是如何处理数据的。
 # 本章的重点讨论有两个： 
 		1. MySQL 所能处理的数据值的类型。
 		2. 这些类型在实际应用中需要注意的问题。

3.1 数据值得类别
	# MySQL能够识别和使用的数据值包括数值、字符串值、日期/时间值、坐标值和空值(NULL)。

	字符串值： 尽量使用单引号。
	




-- -------------------------------------------------
CREATE TABLE parent(
	par_id INT NOT NULL,
	PRIMARY KEY (par_id)
)ENGINE=InnoDB;

CREATE TABLE child(
par_id INT NULL,
child_id INT NOT NULL,
UNIQUE (par_id, child_id),
FOREIGN KEY (par_id) REFERENCES parent (par_id)
ON DELETE SET NULL
ON UPDATE SET NULL
)ENGINE=InnoDB;


INSERT INTO parent (par_id) VALUES(1), (2), (3);
INSERT INTO child (par_id, child_id) VALUES(1, 1), (1, 2);
INSERT INTO child (par_id, child_id) VALUES(2, 1), (2, 2), (2, 3);
INSERT INTO child (par_id, child_id) VALUES(3, 1);

mysql> DELETE FROM parent WHERE par_id = 1;
mysql> SELECT * FROM CHILD;
+--------+----------+
| par_id | child_id |
+--------+----------+
|   NULL |        1 |
|   NULL |        2 |
|      2 |        1 |
|      2 |        2 |
|      2 |        3 |
|      3 |        1 |
+--------+----------+



-----------------------------------------------------
#======================================================================
mysql -u root -p
SELECT @@global.sql_mode;
SELECT @@session.sql_mode;
SET sql_mode=''; #给出一个空字符串以清除该值。
SET sql_mode='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SET GLOBAL sql_mode='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SET GLOBAL STORAGE_ENGINE='InnoDB';
SHOW CHARACTER SET LIKE 'utf8%';
SHOW COLLATION LIKE 'utf8%';
SHOW databases;
CREATE DATABASE db_ysg_t01 CHARACTER SET utf8 COLLATE utf8_general_ci;
USE db_ysg_t01;

CREATE TABLE tb_user(
	id bigint PRIMARY KEY AUTO_INCREMENT,
	name varchar(20) UNIQUE CHARACTER SET utf8 COLLATE utf8_general_ci,
	birday datetime 
)ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;
SELECT name FROM tb_user ORDER BY name COLLATE utf8_bin;

ALTER TABLE sampdb.t RENAME TO test.t;



====================================================================
manual page:
13.1.17.2. Using FOREIGN KEY Constraints


CREATE TABLE product (
    category INT NOT NULL, id INT NOT NULL,
    price DECIMAL,
    PRIMARY KEY(category, id)
)   ENGINE=INNODB;

CREATE TABLE customer (
    id INT NOT NULL,
    PRIMARY KEY (id)
)   ENGINE=INNODB;

CREATE TABLE product_order (
    no INT NOT NULL AUTO_INCREMENT,
    product_category INT NOT NULL,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,

    PRIMARY KEY(no),
    INDEX (product_category, product_id),
    INDEX (customer_id),

    FOREIGN KEY (product_category, product_id)
      REFERENCES product(category, id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (customer_id)
      REFERENCES customer(id)
)   ENGINE=INNODB;

-------------------------------------------------------
ALTER TABLE tbl_name
    ADD [CONSTRAINT [symbol]] FOREIGN KEY
    [index_name] (index_col_name, ...)
    REFERENCES tbl_name (index_col_name,...)
    [ON DELETE reference_option]
    [ON UPDATE reference_option]
====================================================================













