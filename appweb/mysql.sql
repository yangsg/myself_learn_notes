
create database mydb01;
show databases;
GRANT ALL ON mydb01.* TO 'test'@'localhost';
use mydb01;

create table t_employee(
id bigint primary key auto_increment, 
name varchar(20),
salary double,
age int)ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table t_user(
id bigint primary key auto_increment,
name varchar(20) unique,
sex char(1) not null,
birthday date not null,
email varchar(50) unique not null 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

===================================================================================================

bin/mysqld_safe --user=mysql &
bin/mysqladmin --u=root -p shutdown

/binmysql -u test -p
./bin/mysql -u root -p



create database mydb01;
show databases;
GRANT ALL ON mydb01.* TO 'test'@'localhost';
use mydb01;

create table t_employee(
id bigint primary key auto_increment,
name varchar(20),
salary double,
age int)ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table t_user(
id bigint primary key auto_increment,
name varchar(20) unique,
salary double,
sex char(1),
desciption varchar(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



















