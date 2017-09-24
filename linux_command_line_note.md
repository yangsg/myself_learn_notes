**useful online resource**
* 鸟哥的 Linux 私房菜  http://cn.linux.vbird.org/linux_basic/linux_basic.php
* nixCraft             https://www.cyberciti.biz/faq/


* help man info  --help
```sh
##help: Display information about builtin commands.
help help
help
help for
help cd
less --help

man man       # hotkey is similar to vim editor
man bash | col -b > bash.mantxt
man 5 man
man –k man    #-k     Equivalent to apropos.
man –f man    #-f     Equivalent to whatis.  The whatis database is created using the command /usr/sbin/makewhatis
man null

info info     # hotkey is similar to emacs editor
info date     # is more detail than `man date`
info date     #date +"%Y-%m-%d %T %z" #example

```

```sh
echo $LANG
echo -e  'a\tb'
locale
LANG=en_US.UTF-8


cal
cal 2017
cal 2 2017
cal 21 2 2017


date
date +"%Y-%m-%d %T %z"  #same as date +"%Y-%m-%d %H:%M:%S %z"
date -u +"%Y-%m-%d %T %z" # -u ：print or set Coordinated Universal Time
date -s "2016-10-23 14:46:58"
date -s "2016-10-29 14:46:58 +0800"
date --set='+2 minutes'  # To set the system clock forward by two minutes
date --set='-5 minutes'


```

```sh
man shutdown
shutdown -h now  #equivalent to `shutdown -h +0` #立刻关机
shutdown -h 20:25  #系统在今天的 20:25 分会关机，若在21:25才下达此指令，则隔天才关机
shutdown -h +10    #系统再过十分钟后自动关机
shutdown -r now    #系统立刻重新启动
shutdown -r +30 'The system will reboot'   #再过三十分钟系统会重新启动，并显示后面的讯息给所有在在线的使用者
shutdown -k now 'This system will reboot'  #仅发出警告信件的参数！系统并不会关机啦！吓唬人！

exit   #[ctrl + d]

```

```sh
ls
ls -1         #across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C
ls -l
ls -ld dir01  #list directories themselves, not their contents
ls -l --full-time
ls -al --time-style=+"%Y-%m-%d %T %z"
ls --color=auto

##删除不规则文件名的一个例子：
ls –li
find . -inum 52771 -exec rm -i {} \;


ls -lid / /. /..

ls -l /lib/modules/$(uname -r)/kernel/fs #查看你的Linux支持的文件系统有哪些
cat /proc/filesystems  #系统目前已加载到内存中支持的文件系统有

```

```sh
cd        #cd $HOME
cd .
cd ..
cd ~      #cd $HOME
cd ~test
cd /usr/src
cd ../lib
cd -  #change directory to previous working directory
```

```sh
cd  /home/test
mkdir dir01
ln -s  dir01  dir01_link    #注意：创建symbolic link文件必须加-s，因为默认是创建hard link
cd dir01_link
pwd         #output: /home/test/dir01_link
pwd -P      #output: /home/test/dir01

readlink  dir01_link   #readlink - print resolved symbolic links or canonical file names



## ln - make links between files
ln -s  dir01  dir01_link    #注意：创建symbolic link文件必须加-s，因为默认是创建hard link
ln a.txt a.txt_hardlink #hard link的限制:不能跨文件系统；不能连接到目录

```


```sh
mkdir -m 711 dir  # ls -ld dir
mkdir -m u=rwx,g=rwx dir_a
mkdir -p dir01/dir02/dir03/dir04
```

```sh
rmdir dir01
rmdir -p dir01/dir02/dir03/dir04
```


```sh
rm -r dir01
rm -rf dir01
rm -i a.txt
\rm -i a.txt #在命令前加反斜杠，可以忽略掉alias的指定参数
```

```sh
mv a.txt b.txt   #rename a.txt to b.txt
mv a.txt dir01   #move a.txt into dir01
mv a.txt b.txt dir01
mv -t dir01  a.txt b.txt

rename .htm .html *.htm       #man rename
```

```sh
basename /usr/bin/sort          #Output "sort"   #man basename
basename include/stdio.h .h     #Output "stdio"

dirname /usr/bin/sort           #Output "/usr/bin"
dirname stdio.h                 #Output "."
```

```sh
cp a.txt b.txt #这种行为会复制(cp)执行者的属性与权限
cp a.txt b.txt dir01
cp -t dir01 a.txt b.txt #-t, --target-directory=DIRECTORY copy all SOURCE arguments into DIRECTORY


```


```sh
cat /etc/issue
cat -A /etc/xinetd.d/rsync # ^I -> [Tab], $ -> ‘\n’(linux), ^M$ -> ‘\r\n’(windows)
cat -n /etc/issue
cat -b /etc/issue  # number nonempty output lines

tac /etc/issue
tac /etc/issue | cat –A  #tac没有cat那么多选项，不过可以通过|管道+cat来解决
```


```sh
nl /etc/issue
nl -b a /etc/issue
nl -b a -n rz  /etc/issue
nl -b a -n rz -w 3 /etc/issue

```


```sh
less /etc/man.config    #有了less命令，可以彻底忘记功能局限的more命令了
less -R  a.txt          #可用于显示一些具有颜色控制字符的文件(显示出颜色)

```

```sh
head /etc/man.config
head -n 20 /etc/man.config
head -n -20 /etc/man.config

tail /etc/man.config
tail -n 20 /etc/man.config
tail -n +100 /etc/man.config
tail -f /var/log/messages                #按[ctrl]+c结束
head -n 20 /etc/man.config | tail -n 10  #显示/etc/man.config的第11到20行

```

```sh
od -t c /usr/bin/passwd
od -t cxC /etc/issue
od -t cdC /etc/issue
od -t cdCxCoC a.txt

```


```sh
touch -d "2 days ago" a.txt  #touch可以改变mtime、atime,但无法将ctime改变为指定值
ls -l --full-time a.txt; ls -l --time=atime --full-time a.txt; ls -l --time=ctime --full-time a.txt;

```

```sh
help umask
umask       #output: 0002 (Displaying the current mask)
umask -S    #output: u=rwx,g=rwx,o=rx
umask 002   #一般账号umask通常为002，见/etc/bashrc
umask 022   #root及系统账号umask通常为022
##default regular file permision:      -rw-rw-rw-
##default regular directory permision: drwxrwxrwx
## 创建文件时：(-rw-rw-rw-) - (-----w--w-) ==> -rw-r--r--
## 创建目录时：(drwxrwxrwx) - (d----w--w-) ==> drwxr-xr-x

##  https://en.wikipedia.org/wiki/Umask
##  Each program (technically called a process) has its own mask, and is able to change its settings using a function call. When the process is a shell, the mask is set with the umask command.
##  https://en.wikipedia.org/wiki/File_system_permissions

```

```sh
chattr +i a.txt    # immutable
chattr -i a.txt    #The operator '+' causes the selected attributes to be added to the existing attributes of the files; '-' causes them to be removed
chattr +a logfile  # append only

lsattr a.txt
lsattr -d dir01
lsattr -R dir01
lsattr -a dir01
lsattr -aR dir01


```

```sh
file ~/.bashrc                      #determine file type
file /usr/bin/passwd
file /var/lib/mlocate/mlocate.db

```

```sh
which ifconfig                   #shows the full path of (shell) commands. #It does this by searching for an executable or script in the directories listed in the environment variable PATH using the same algorithm as bash(1).
which -a ifconfig
which which
which cd  #因为cd是bash builtin自带的，所以which cd找不到,但可以使用type命令
type cd

```

```sh
## locate the binary, source, and manual page files for a command
whereis passwd
whereis -m passwd
cd /usr/bin;         whereis -u -M /usr/man/man1 -S /usr/src -f *

```


```sh
## locate reads one or more databases prepared by updatedb(8) and writes file names matching at least one of the PATTERNs to standard output, one per line.
locate -i 'BASHRC'
locate 'bashrc'
locate -b '\bashrc'

```



```sh
man find
find /tmp -name core -type f -print0 | xargs -0 /bin/rm –f  #注意-name在-type前（优化），-print0
find . -type f -exec file '{}' \; #这里的single quote和semicolon起转义作用，避免shell将其当做script punctuation.

ls -li
find . -inum 52771 -exec rm -i '{}' \;

find / -mtime 0  #将过去系统上面 24 小时内有更动过内容 (mtime) 的文件列出

                   4
                 <--->
                   -4|----|----|----|----|---->
<-----|----|----|+4
<-----|----|----|----|----|----|----|----|
      7    6    5    4    3    2    1    now

find /var -mtime +4     #  +4代表大於等於5天前的档名
find /var -mtime -4     #  -4代表小於等於4天内的文件档名
find /var -mtime 4      #  4则是代表4-5那一天的文件档名



find /home -user test
find / -nouser
find /var -type s
find / -name passwd
find / -size +1000k
find / -perm +7000
find . -perm -664

```


```sh
## useradd [-u uid] [-g login-init-group] [-G supplementary-groups] [-mM] [-c comment] [-d home-dir-with-absolute-path] [-s shell] accountName
##  -m, --create-home   #(联想: mkdir)
##  -M, --no-create-home
##  -e, --expiredate EXPIRE_DATE  #The date on which the user account will be disabled. The date is specified in the format YYYY-MM-DD.
##  -f, --inactive INACTIVE       #The number of days after a password expires until the account is permanently disabled. A value of 0 disables the account as soon as the password has expired, and a value of -1 disables the feature.
##  -r, --system  #Create a system account.

## UID:
## 0  root(system administrator)
## 1~499  system account,  1~99 distribution system account, 100~499 customized system account
## 500~65535  regular account

man useradd
useradd user01
useradd -m user01
useradd -m -g initGroup01 user01
useradd -m  -d  /home/user01  user01
useradd -G  group01,group02,group03 user01
useradd -d /www -M webmaster
useradd -M -s /sbin/nologin  noLoginUser01  #https://superuser.com/questions/77617/how-can-i-create-a-non-login-user
su  noLoginUser01 -s /bin/bash  -c "date"
useradd -m -e 2017-10-10 user01    # echo $(($(date --date="2017/10/10" +%s)/86400+1))
useradd -r systemAccount01

useradd -D
cat /etc/default/useradd
cat /etc/login.defs


## usermod [-c comment] [-g login-init-group-name-or-number] [-e expiredate] [-f inactiveDays] [-LU] [-s shell] accountName
## -d, --home HOME_DIR  #If the -m option is given, the contents of the current home directory will be moved to the new home directory, which is created if it does not already exist. If the current home directory does not exist the new home directory will not be created.
## -m, --move-home   #This option is only valid in combination with the -d (or --home) option. If the current home directory does not exist the new home directory will not be created. #usermod will try to adapt the ownership of the files and to copy the modes, ACL and extended attributes, but manual changes might be needed afterwards.

usermod -a -G group01,group02  user01  #append user01 to these groups: {group01, group02}  #-a, --append
usermod    -G group01,group02  user01  #all of the supplementary groups that user01 joined is only the two: group01,group02
usermod -e  2017-10-10  user01
usermod -f  3           user01  # 3 days #-f, --inactive INACTIVE  #grep user01 /etc/shadow
usermod -L  user01  #-L, --lock    #Note: if you wish to lock the account (not only access with a password), you should also set the EXPIRE_DATE to 1.
usermod -U  user01  #-U, --unlock  #Note: if you wish to unlock the account (not only access with a password), you should also set the EXPIRE_DATE (for example to 99999, or to the EXPIRE value from /etc/default/useradd).


pkill -KILL -u  user01 # https://www.cyberciti.biz/faq/linux-logout-user-howto/
find / -user user01
userdel  user01
userdel -r  user01  #-r, --remove  Files in the user's home directory will be removed along with the home directory itself and the user's mail spool. Files located in other file systems will have to be searched for and deleted manually.


```
```text
FILES
       /etc/passwd
       /etc/shadow
       /etc/group
       /etc/gshadow
       /etc/default/useradd
       /etc/skel/
       /etc/login.defs
           Shadow password suite configuration.

```


```sh
chown test a.txt  b.txt
chown -R test workspace
chown -R test:test workspace
chown --reference a.txt  b.txt    #change user and group of b.txt to the same as a.txt

chgrp test workspace
chgrp -R test workspace  #-R, --recursive
chgrp -R test a.txt b.txt
chgrp --reference a.txt  b.txt    #change group of b.txt to the same as a.txt

```

```sh
chmod 644 .bashrc
chmod u=rwx,go=rx .bashrc   #[ugoa]
chmod a+w .bashrc
chmod a-x .bashrc
chmod -R a-x dir01 #-R, --recursive

```


```sh
## (Unix Name) print system information
uname -a    #man uname
uname -r


##  FSG lsb_release v2.0 prints certain LSB (Linux Standard Base) and Distribution information.

yum provides lsb_release   #search which package contains the lsb_release command
lsb_release –a  # yum install epel-release; yum install redhat-lsb

```


```sh
## df - report file system disk space usage
## 由于 df 主要读取的数据几乎都是针对一整个文件系统，因此读取的范围主要是在 Superblock 内的信息， 所以这个命令显示结果的速度非常的快速！
df    #df的全名为disk free (see wikipedia)
df -h
df –aT  #将系统内的所有特殊文件格式及名称都列出来(包括系统特有的/proc等文件系统)
df -h /etc  #列出/etc下面可用的磁盘容量(df回自动分析该目录或文件所在分区，并将该分区的容量显示出来)
df –ih

```

```sh
## du - estimate file space usage
du -s dir01    #常用，du的全名为disk usage
du -a dir01
du -h dir01
du -h a.txt  #注意du和ls –l中所谓文件大小概念上的差异
ls -l a.txt


```

```sh
## 解压windows上的zip文件用unzip,相应压缩软件为zip.针对windows的rar有unrar
man gzip
gzip a.txt  #a.txt will be replaced by a.txt.gz by default
gzip -c a.txt > a.txt.gz #压缩且保留源文件
gzip -d a.txt.gz #解压
gzip -cd old.gz | gzip > new.gz  #If you want to recompress concatenated files to get better compression, do
cat a.txt b.txt | gzip > entire.gz
zcat a.txt.gz

##  Multiple compressed files can be concatenated. In this case, gunzip will extract all members at once. For example:
gzip -c file1  > foo.gz
gzip -c file2 >> foo.gz

```


```sh
bzip2 -c a.txt > a.txt.bz2 #压缩，这种方式的好处是自己定义目标文件名而不是按默认的规则，和gzip用法类似
bzip2 a.txt  #压缩
bzip2 -z a.txt #压缩
bzip2 -k a.txt #压缩，保留input文件,即a.txt
bzip2 -d a.txt.bz2 #解压
bzip2 -dk a.txt.bz2 #解压，保留input文件, 即a.txt.bz2
bzcat a.txt.bz2

```


```sh
tar -zcvf dir01.tar.gz  dir01
tar -ztvf dir01.tar.gz
tar -zxvf dir01.tar.gz

tar -jpcv -f etc.tar.bz2 /etc
tar -jtv -f etc.tar.bz2
tar -jpPcv -f etc.tar.bz2 /etc   #将文件(根)目录也备份下来
tar -jxv -f dir01.tar.bz2
tar -jxv -f dir01.tar.bz2  -C /tmp

## 仅解开单一文件
tar -jtv -f etc.tar.bz2 | grep 'shadow'
tar -jxv -f etc.tar.bz2 etc/shadow


tar -jcv  -f /root/system.tar.bz2 --exclude=/root/etc*  --exclude=/root/system.tar.bz2  /etc /root
tar -jcv -f /root/etc.newer.then.passwd.tar.bz2  --newer-mtime="2008/09/29" /etc/*
tar -cvf  - /etc | tar -xvf -


tar -jcv -f /backups/backup-system-20091130.tar.bz2 \
 --exclude=/root/*.bz2 --exclude=/root/*.gz --exclude=/home/loop* \
 /etc /home /var/spool/mail /var/spool/cron /root

```


```sh
man unix2dos
unix2dos a.txt  #Convert and replace a.txt
unix2dos a.txt b.txt     #Convert and replace a.txt. Convert and replace b.txt.
unix2dos -n a.txt e.txt  #Convert a.txt and write to e.txt.

unix2dos a.txt -c iso b.txt   #Convert and replace a.txt in ASCII conversion mode.  Convert and replace b.txt in ISO conversion mode.
unix2dos -c mac a.txt         #Convert a.txt from Unix to Mac format. equivalent to `unix2mac a.txt`
unix2dos -k a.txt             #Convert and replace a.txt while keeping original date stamp.



man dos2unix
dos2unix a.txt  #Convert and replace a.txt
dos2unix a.txt b.txt   #Convert and replace a.txt. Convert and replace b.txt
dos2unix -n a.txt e.txt   #Convert a.txt and write to e.txt

dos2unix a.txt -c iso b.txt   #Convert and replace a.txt in ascii conversion mode. Convert and replace b.txt in ISO conversion mode
dos2unix -c mac a.txt         #Convert a.txt from Mac to Unix format. equivalent to `mac2unix a.txt`
```

```sh
##  iconv - convert text from one character encoding to another
iconv --help
iconv -f ISO-8859-15 -t UTF-8 < input.txt > output.txt   #Convert text from the ISO 8859-15 character encoding to UTF-8
echo abc ß α € àḃç | iconv -f UTF-8 -t ASCII//TRANSLIT   #The next example converts from UTF-8 to ASCII, transliterating when possible

iconv -f UTF-8 -t GB2312 a.txt.utf8 -o a.txt.big5
iconv -f utf8 -t big5 vi.utf8 | iconv -f big5 -t gb2312 | iconv -f gb2312 -t utf8 -o vi.gb.utf8  #将繁体的 utf8转换为简体的utf8

```


```sh
## Display information about command type.

help type
type ls
type -t ls
type -a ls

#在命令前加”\”符号，表示执行原始的ls命令而不是其alias. 如”\ls”
```


* ----variable----
```sh
echo $PATH
echo ${PATH}
version=$(uname -r)

PATH=$PATH:/home/bin
PATH="$PATH":/home/bin
PATH=${PATH}:/home/bin

export PATH
unset myname

cd /lib/modules/`uname -r`/kernel
cd /lib/modules/$(uname -r)/kernel   #推荐这种写法，因为括号容易分辨，不像反单引号那样容易与引号混淆

echo "hello\"world"
echo hello\"world

ls -l  `locate crontab`
echo `locate crontab`

work=~/workspace
cd $work

printenv
env
declare -i number=$RANDOM*10/32768 ; echo $number #man bash

## bash中不只有环境变量，还有一些与bash操作接口有关的变量，以及用户自己定义的变量存在。


## Set or unset values of shell options and positional parameters.
set
echo $-   #output: himBH

export
export JAVA_HOME=/usr/java/jdk1.5.0_07/bin/java
export JAVA_HOME

## 环境变量与自定义变量的差异在于该变量是否会被子进程所继续引用

```

```sh
locale
locale -a

```

```sh
read atest
echo $atest
read -p "Please keyin your name:"  -t 30 name
echo $name


```

```sh
注：typeset命令已经被废弃，请使declare用

## Set variable values and attributes.
## -r        to make NAMEs readonly(该变量不可被更改内容，也不能重设，如果你不小心将变量设置为”只读”，通常得要注销再登录才能复原该变量的类型了)

help declare
declare
sum=100+200+50
declare -i sum=100+200+50
declare -x sum
export | grep sum
declare +x sum #让sum变成环境变量的自定义变量
declare -p sum


var[1]="small min"
var[2]="big min"
var[3]="nice min"
echo "${var[1]}, ${var[2]}, ${var[3]}}"  #一般来说，建议直接以${数组}的方式来读取，会比较正确无误


```



```sh
## Define or display aliases.

help  alias
alias
alias ll='ls -l --color=auto'
\rm a.txt
unalias ll

```

```sh
## Display or manipulate the history list.

history
history  20
history -a myhist_file
history -w myhist_file
history -w

```

```text
命令运行的顺序可以这样看：
1.  以相对/绝对路径运行命令，例如『 /bin/ls 』或『 ./ls 』；
2.  由 alias 找到该命令来运行；
3.  由 bash 内建的 (builtin) 命令来运行；
4.  透过 $PATH 这个变量的顺序搜寻到的第一个命令来运行。
如果想要了解命令搜寻的顺序，其实透过 type -a ls 也可以查询的到啦

```

```sh
## Execute commands from a file in the current shell.

help source
help .
source ~/.bashrc    #~/.bashrc是取得login或non-login shell时都会读取的文件
source /etc/profile

```

```sh
## (setting tty) stty - change and print terminal line settings

tty    # teletypewriter

stty -a
stty erase ^h

##终端机设置相关命令和文件：stty set  /ect/inputrc
```



```sh
##  (redirect)数据重定向；
stdin  0
stdout 1
stderr 2
<
<<    #here document
>     #If the file does not exist it is created; if it does exist it is truncated to zero size.
>>    #append
2>
2>>
&>    #stdout and stderr
&>>


find /home -name .bashrc > list_right 2> list_error
find /home -name .bashrc 2> /dev/null
find /home -name .bashrc  &> list_right_with_error
cat > catfile < ~/.bashrc
cat > catfile << "eof"

```

```sh
## 特殊的文件/dev/null /dev/zero

NAME
       null, zero - data sink

DESCRIPTION
       Data written to a null or zero special file is discarded.

       Reads from the null special file always return end of file (i.e., read(2) returns 0), whereas reads from zero always return bytes containing zero (\0 characters).

       null and zero are typically created by:

              mknod -m 666 /dev/null c 1 3
              mknod -m 666 /dev/zero c 1 5
              chown root:root /dev/null /dev/zero

FILES
       /dev/null
       /dev/zero

NOTES
       If these devices are not writable and readable for all users, many programs will act strangely.


```

```sh
##  命令执行的判断依据 ; && ||
##   类似程序中的复合语句或表达式

sync; sync; shutdown -h now
echo $?   # 显示命令回传码
ls /tmp/abc || mkdir /tmp/abc && touch /tmp/abc/hehe
ls /tmp/vbirding && echo "exist" || echo "not exist"   #假定式

```

```text
## 管道命令：|
 其实这个管线命令『 | 』仅能处理经由前面一个命令传来的正确信息，也就是 standard output 的信息，对于 stdandard error 并没有直接处理的能力。
每个管线后面接的第一个数据必定是『命令』喔！而且这个命令必须要能够接受 standard input 的数据才行

```

```sh
## cut grep      sort uniq wc           tee 双向重定向
## tr col join paste expand unexpand

## cut - remove sections from each line of files
echo $PATH | cut -d ':' -f 5           #N      N'th byte, character or field, counted from 1
echo $PATH | cut -d ':' -f 3,5
echo $PATH | cut -d ':' -f 3-5
echo $PATH | cut -d ':' -f 3-
echo $PATH | cut -d ':' -f -5
export | cut -c  12-


```

```sh
alias grep='grep --color=auto'
last | grep root
last | grep -v root
grep -nC 2 '5' a.txt

```


```sh
cat /etc/passwd | sort
cat /etc/passwd | sort -t ':' -k 3
cat /etc/passwd | sort -t ':' -k 3 -n


##  因为uniq是比较相邻的行，所以通常需要先做sort处理
last | cut -d ' ' -f1 | sort | uniq
last | cut -d ' ' -f1 | sort | uniq -c


last | grep [a-zA-Z] | grep -v 'wtmp' | wc -l

```


```sh
## tee可以让standard output转存一份到文件内并将同样的数据继续送到屏幕去处理。
ls -l /home  |  tee ~/homefile |  less
ls -l / | tee -a ~/homefile | less

```


```sh
##  tr - translate or delete characters

man tr  # info tr
cat a.txt | tr -s '\n'   # Convert each sequence of repeated newlines to a single newline
echo 'hello       world     yes   I         know'  | tr -s ' '
echo 'hello       world     yes   I         know'  | tr -s ' ' '-'
echo 'hello       world     yes   I         know'  | tr -t ' ' '-'
cat a.txt | tr -d '\0'  #Remove all zero bytes

echo 'a b c' | tr  -cs '[:alnum:]'  '[\n*]'

```

```text
## http://stackoverflow.com/questions/10638382/what-is-a-reverse-line-feed
A reverse line feed makes the cursor go back up to the previous line. A regular line feed makes the cursor go to the next line.
Edit: ThePower is correct, these terms originate from the days of line printers, "feed" meaning to feed the paper through the printer, in this case by one line, and reverse line feed moving the paper backwards by one line.
```


```sh
## col - filter reverse line feeds from input

man foo | col -b > foo.mantxt
```


```sh
##  join - join lines of two files on a common field

##在join之前，你所需要处理的文件应该要事先经过排序(sort)处理
join -t ':' -1 4 /etc/passwd  -2 3 /etc/group

```

```sh
##  paste - merge lines of files

paste /etc/passwd  /etc/shadow
cat /etc/group |  paste /etc/passwd  /etc/shadow  - | head -n 3


```

```sh
## expand - convert tabs to spaces
## unexpand - convert spaces to tabs

```


```sh
## split - split a file into pieces

cd /tmp; split -b 300k /etc/termcap  termcap
cat termcap* >> termcapback



```


```sh
## xargs - build and execute command lines from standard input

man xargs

```


```text
##  关于减号 - 的用途
管线命令在 bash 的连续的处理程序中是相当重要的！另外，在 log file 的分析当中也是相当重要的一环， 所以请特别留意！另外，在管线命令当中，常常会使用到前一个命令的 stdout 作为这次的 stdin ， 某些命令需要用到文件名 (例如 tar) 来进行处理时，该 stdin 与 stdout 可以利用减号 "-" 来替代， 举例来说：

tar -cvf - /home | tar -xvf -

上面这个例子是说：『我将 /home 里面的文件给他打包，但打包的数据不是纪录到文件，而是传送到 stdout； 经过管线后，将 tar -cvf - /home 传送给后面的 tar -xvf - 』。后面的这个 - 则是取用前一个命令的 stdout， 因此，我们就不需要使用 file 了！这是很常见的例子喔！注意注意！

```




* install some useful tools
```sh
yum install bash-completion bash-completion-extras  #https://www.cyberciti.biz/faq/fedora-redhat-scientific-linuxenable-bash-completion/

```

```sh
yum install screen
```
* ##~/.screenrc
```text
hardstatus alwayslastline "%{.bW}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %Y-%m-%d %c"
shell "bash"
startup_message off
vbell off
altscreen on
attrcolor b ".I"
defbce "on"
termcapinfo xterm* 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
term screen-256color
```

* 阿里开源镜像(centos7) https://mirrors.aliyun.com/
```sh
##  --- for centos base --
## step 1: back up
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
## step 2: download XXX.repo file
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
## step 3: clean and make cache
yum clean all
yum makecache

##  --- for epel--
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup
mv /etc/yum.repos.d/epel-testing.repo /etc/yum.repos.d/epel-testing.repo.backup

wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
```

#hotkeys
[ctrl + c]
[ctrl + d]
[tab][tab]

