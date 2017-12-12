- [How to Install MariaDB on CentOS 7](https://www.linode.com/docs/databases/mariadb/how-to-install-mariadb-on-centos-7)
- [Installing MariaDB 10 on CentOS 7 / RHEL 7](https://mariadb.com/resources/blog/installing-mariadb-10-centos-7-rhel-7)

- [About MariaDB](https://mariadb.org/about/)
- [Download](https://mariadb.org/download/)
- [downloads.mariadb.org](https://downloads.mariadb.org/)
- [ariaDB 10.2.10 Stable](https://downloads.mariadb.org/mariadb/10.2.10/)

- [Downloads Setting up MariaDB Repositories](https://downloads.mariadb.org/mariadb/repositories/#mirror=neusoft)
- [Installing MariaDB RPM Files](https://mariadb.com/kb/en/library/rpm/)
- [Installing MariaDB with yum](https://mariadb.com/kb/en/library/yum/)

```
On yum-based distributions, the only MariaDB user set up is root, and there is no password. You can use the mysql_secure_installation script to set the root password.
For compatibility, the service name and port are by default the same as MySQL: mysql and 3306. Binaries are also named the same: mysqld for the server and mysql for the client.
After installation you can start MariaDB with sudo /etc/init.d/mysql start or sudo service mysql start
```

```bash
[root@localhost ~]# vim /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.2 CentOS repository list - created 2017-11-18 04:39 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1

[root@localhost ~]# yum install MariaDB-server MariaDB-client


```



