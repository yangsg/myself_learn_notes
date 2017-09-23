**useful online resource**
* 鸟哥的 Linux 私房菜  http://cn.linux.vbird.org/linux_basic/linux_basic.php
* nixCraft             https://www.cyberciti.biz/faq/


* help man info  --help
```
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

```
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

```bash
man shutdown
shutdown -h now  #equivalent to `shutdown -h +0` #立刻关机
shutdown -h 20:25  #系统在今天的 20:25 分会关机，若在21:25才下达此指令，则隔天才关机
shutdown -h +10    #系统再过十分钟后自动关机
shutdown -r now    #系统立刻重新启动
shutdown -r +30 'The system will reboot'   #再过三十分钟系统会重新启动，并显示后面的讯息给所有在在线的使用者
shutdown -k now 'This system will reboot'  #仅发出警告信件的参数！系统并不会关机啦！吓唬人！

exit   #[ctrl + d]

```

```
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




* install some useful tools
```
yum install bash-completion bash-completion-extras  #https://www.cyberciti.biz/faq/fedora-redhat-scientific-linuxenable-bash-completion/

```

```
yum install screen
```
* ##~/.screenrc
```
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
```bash
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

