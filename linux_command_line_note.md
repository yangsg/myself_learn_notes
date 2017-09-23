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
ln -s  dir01  dir01_link
cd dir01_link
pwd         #output: /home/test/dir01_link
pwd -P      #output: /home/test/dir01

readlink  dir01_link   #readlink - print resolved symbolic links or canonical file names
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
cp a.txt b.txt #这种行为会复制(cp)执行者的属性与权限
cp a.txt b.txt dir01
cp -t dir01 a.txt b.txt #-t, --target-directory=DIRECTORY copy all SOURCE arguments into DIRECTORY


```

```sh
basename /usr/bin/sort          #Output "sort"   #man basename
basename include/stdio.h .h     #Output "stdio"

dirname /usr/bin/sort           #Output "/usr/bin"
dirname stdio.h                 #Output "."
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

* 阿里开源镜像(centos7) http://mirrors.aliyun.com/
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

