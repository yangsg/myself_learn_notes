**useful online resource**
* [鸟哥的 Linux 私房菜(第3版)](http://cn.linux.vbird.org/linux_basic/linux_basic.php)
* [鸟哥的 Linux 私房菜(第4版)](http://linux.vbird.org/linux_basic/)
* [Product Documentation for Red Hat Enterprise Linux](https://access.redhat.com/documentation/en/red-hat-enterprise-linux?version=7/)
* [nixCraft](https://www.cyberciti.biz/faq/)

* 参考书籍:
  - [鸟哥的Linux私房菜 基础学习篇(第3版)](http://product.dangdang.com/20866026.html)
  - [鸟哥的Linux私房菜:服务器架设篇(第3版)](http://product.dangdang.com/22787833.html)
  - Linux基础及应用教程(基于CentOS7)

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
## uuidgen - create a new UUID value

uuidgen       #By default uuidgen will generate a random-based UUID if a high-quality  random  number generator is present. Otherwise, it will choose a time-based UUID.
uuidgen -r    #-r, --random  #Generate  a  random-based  UUID.  This method creates a UUID consisting mostly of random bits.  It requires that the operating system have a high quality random number generator, such as /dev/random.
uuidgen -t    #-t, --time #Generate a time-based UUID.  This method creates a UUID based on the system clock plus the system's ethernet hardware address, if present.

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
## -rw-rwxr--+ 1 user01 user01 0 Sep 25 01:41 a.txt    #If the ACL has an ACL_MASK entry, the group permissions correspond to the permissions of the ACL_MASK entry.  Otherwise, if the ACL has no ACL_MASK entry, the group permissions correspond to the permissions of the ACL_GROUP_OBJ entry. for more details, see `man acl' and `man setfacl`
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
## su - run a command with substitute user and group ID
## (Switch User)
## When called without arguments su defaults to running an interactive shell as root.
## It is recommended to always use the --login option (instead it's shortcut -) to avoid side effects caused by mixing environments.

man su
su -                     #same as `su - root`
su                       #same as `su   root`
su - root
su - user01
su   user01
su - user01 -c "date"    #run the date command as user01
su  -s /bin/bash -c "/path/to/your/script"  noLoginUser01  #run a command as a no-login user
exit


## https://en.wikipedia.org/wiki/Sudo
## sudo, sudoedit — execute a command as another user
## (superuser do) (substitute user do) (switch user do)

visudo       #edit /etc/sudoers through `visudo` command
/etc/sudoers
man sudoers
man sudo

sudo yum install tree    #same as `sudo -u root yum install screen`
sudo -u user01 date      #run date command as user01
sudo su -
sudo -k                  #(kill) invalidates the user's cached credentials.
sudo -K                  #-K与-k的区别是-k还有另一种使用方式，即接command: -k command

## https://askubuntu.com/questions/376199/sudo-su-vs-sudo-i-vs-sudo-bin-bash-when-does-it-matter-which-is-used
## https://serverfault.com/questions/619133/is-sudo-su-considered-a-bad-practice
## https://superuser.com/questions/105367/command-sudo-su

## the default password prompt timeout for the sudoers security policy is 5 minutes.

## https://apple.stackexchange.com/questions/10139/how-do-i-increase-sudo-password-remember-timeout
## https://superuser.com/questions/827132/force-sudo-to-forget-password-immediately-after-exit-everytime
## https://superuser.com/questions/559116/expect-and-sudo-timeout

##EXAMPLES
##     Note: the following examples assume a properly configured security policy.
##
##     To get a file listing of an unreadable directory:
##
##           $ sudo ls /usr/local/protected
##
##     To list the home directory of user yaz on a machine where the file system holding ~yaz is not exported as root:
##
##           $ sudo -u yaz ls ~yaz
##
##     To edit the index.html file as user www:
##
##           $ sudo -u www vi ~www/htdocs/index.html
##
##     To view system logs only accessible to root and users in the adm group:
##
##           $ sudo -g adm view /var/log/syslog
##
##     To run an editor as jim with a different primary group:
##
##           $ sudo -u jim -g audio vi ~jim/sound.txt
##
##     To shut down a machine:
##
##           $ sudo shutdown -r +15 "quick reboot"
##
##     To make a usage listing of the directories in the /home partition.  Note that this runs the commands in a sub-shell to make the cd and file redirection work.
##
##           $ sudo sh -c "cd /home ; du -s * | sort -rn > USAGE"


## w - Show who is logged on and what they are doing.
w

## who - show who is logged on
who


## last, lastb - show listing of last logged in users
last

## lastlog - reports the most recent login of all users or of a given user
lastlog


## write - send a message to another user
## write user [ttyname]
write user01
write user01 /dev/pts/4
tty                        #tty - print the file name of the terminal connected to standard input

## wall -- send a message to everybody's terminal.
##  wall [-n] [ message ]
## (write all)

wall "I will shutdown my linux server..."

## mesg - control write access to your terminal
##SYNOPSIS
##       mesg [y|n]

mesg
mesg y
mesg n   #这个 mesg 的功能对 root 传送来的讯息没有抵挡的能力！





## id - print real and effective user and group IDs
## Print user and group information for the specified USER, or (when USER omitted) for the current user.
id
id user01


## lid - Display user's groups or group's users  (注:只有具有superuser privileges才可以执行此命令)
## yum install libuser
lid  user01       #list groups that user01 is contained in
lid  -g  group01  #list users of group01


## groups - print the groups a user is in
## SYNOPSIS
##        groups [OPTION]... [USERNAME]...
## DESCRIPTION
##        Print group memberships for each USERNAME or, if no USERNAME is specified, for the current process (which may differ if the groups database has changed).
groups                 #第一个输出的group为当前的effective group
groups user01
groups user01 user02


## newgrp - log in to a new group
## The newgrp command is used to change the current group ID during a login session. If the optional - flag is given,
## the user's environment will be reinitialized as though the user had logged in, otherwise the current environment, including current working directory, remains unchanged.

newgrp    group02    #log in to group02
newgrp -  group02    #类比 `su - user01`


## useradd [-u uid] [-g login-init-group] [-G supplementary-groups] [-mM] [-c comment] [-d home-dir-with-absolute-path] [-s shell] accountName
##  -m, --create-home   #(联想: mkdir)
##  -M, --no-create-home
##  -e, --expiredate EXPIRE_DATE  #The date on which the user account will be disabled. The date is specified in the format YYYY-MM-DD.
##  -f, --inactive INACTIVE       #The number of days after a password expires until the account is permanently disabled. A value of 0 disables the account as soon as the password has expired, and a value of -1 disables the feature.
##  -r, --system  #Create a system account.
## -o, --non-unique  #Allow the creation of a user account with a duplicate (non-unique) UID. This option is only valid in combination with the -u option.

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
chage -E 0 user01   #Use `chage -E 0 user` command instead for full account locking.
usermod -U  user01  #-U, --unlock  #Note: if you wish to unlock the account (not only access with a password), you should also set the EXPIRE_DATE (for example to 99999, or to the EXPIRE value from /etc/default/useradd).


pkill -KILL -u  user01 # https://www.cyberciti.biz/faq/linux-logout-user-howto/
find / -user user01
userdel  user01
userdel -r  user01  #-r, --remove  Files in the user's home directory will be removed along with the home directory itself and the user's mail spool. Files located in other file systems will have to be searched for and deleted manually.



## passwd [-k] [-l] [-u [-f]] [-d] [-e] [-n mindays] [-x maxdays] [-w warndays] [-i inactivedays] [-S] [--stdin] [username]
passwd -l user01   #-l, --lock  #Note that the account is not fully locked - the user can still log in by other means of authentication such as the ssh pub‐ lic key authentication. Use chage -E 0 user command instead for full account locking.
chage -E 0 user01  #-E, --expiredate EXPIRE_DATE  #Use `chage -E 0 user` command instead for full account locking.
passwd -u user01  #-u, --unlock
echo "1234567" | passwd --stdin  user01  #--stdin  #This option is used to indicate that passwd should read the new password from standard input, which can be a pipe.  
passwd -d  user01  #This is a quick way to delete a password for an account. It will set the named account passwordless. Available to root only.
passwd -e  user01  #-e, --expire  #This is a quick way to expire a password for an account. The user will be forced to change the password during the next login attempt.  Available to root only
passwd -n 3 -x 7 -w 2 -i 1  user01
passwd -S user01  #-S, --status  #This will output a short information about the status of the password for a given account. Available to root user only.  


chage -l user01  #-l, --list #Show account aging information.
chage -d 2017-09-10 user01  #-d, --lastday LAST_DAY  #Set the number of days since January 1st, 1970 when the password was last changed. The date may also be expressed in the format YYYY-MM-DD (or the format more commonly used in your area). If the LAST_DAY is set to 0 the user is forced to change his password on the next log on.
chage -d 0 user01  #If the LAST_DAY is set to 0 the user is forced to change his password on the next log on.
chage -E 2017-10-10 user01  #-E, --expiredate EXPIRE_DATE
chage -E 0 user01  #-E, --expiredate EXPIRE_DATE  #Use `chage -E 0 user` command instead for full account locking.
chage -E -1 user01  #Passing the number -1 as the EXPIRE_DATE will remove an account expiration date.
chage -I 3  user01  #-I, --inactive INACTIVE_days
chage -I -1  user01 #Passing the number -1 as the INACTIVE will remove an account's inactivity.
chage -m -1  user01  #-m, --mindays MIN_DAYS  #Set the minimum number of days between password changes to MIN_DAYS. A value of zero for this field indicates that the user may change his/her password at any time.
chage -M 7  user01 #-M, --maxdays MAX_DAYS #Passing the number -1 as MAX_DAYS will remove checking a password's validity.
chage -W 2  user01 #-W, --warndays WARN_DAYS


## groupadd [-g gid] [-r]  groupName
groupadd  group01
groupadd -r  group01  #-r, --system  #Create a system group.

## groupmod [-g gid] [-o] [-n newName] group
## -o, --non-unique  #When used with the -g option, allow to change the group GID to a non-unique value.
groupmod -g 1010 group01
groupmod -n  groupName01  group01  #rename 'group01' to 'groupName01'


## CAVEATS
##        You may not remove the primary group of any existing user. You must remove the user before you remove the group.
##        You should manually check all file systems to ensure that no files remain owned by this group.

groupdel group01


## gpasswd [-A user01,user02...] [-M user03,user04...] [-a user05] [-d user06] groupname
gpasswd  group01  #gpasswd called by a group administrator with a group name only prompts for the new password of the group. If a password is set the members can still use newgrp(1) without a password, and non-members must supply the password.
gpasswd -a user01  group01  #-a, --add user  #Add the user to the named group.
gpasswd -d user01  group01  #-d, --delete user #Remove the user from the named group.
gpasswd -A  user01,user02  group01  #-A, --administrators user,...  #Set the list of administrative users.
gpasswd -M  user01,user02  group01  #-M, --members user,...  #Set the list of group members.


## chsh - change your login shell
chsh -l                   #cat /etc/shells
chsh -s /bin/bash         #change login shell of the current user (普通用户可以使用此命令修改自己的login shell)
chsh -s /bin/bash user01  #change login shell of user01


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
chmod --reference a.txt b.txt   #--reference=RFILE  #use RFILE's mode instead of MODE values


```

```sh
##   ACL ENTRIES
##       The setfacl utility recognizes the following ACL entry formats (blanks inserted for clarity):
##
##       [d[efault]:] [u[ser]:]uid [:perms]
##              Permissions of a named user. Permissions of the file owner if uid is empty.
##       [d[efault]:] g[roup]:gid [:perms]
##              Permissions of a named group. Permissions of the owning group if gid is empty.
##       [d[efault]:] m[ask][:] [:perms]
##              Effective rights mask
##       [d[efault]:] o[ther][:] [:perms]
##              Permissions of others.
##
##       Whitespace between delimiter characters and non-delimiter characters is ignored.
## Proper ACL entries including permissions are used in modify and set operations. (options -m, -M, --set and --set-file).  Entries without the perms field are used for deletion of entries (options -x and -X).
## For uid and gid you can specify either a name or a number.
## The perms field is a combination of characters that indicate the permissions: read (r), write (w), execute (x), execute only if the file is a directory or already has execute permission for some user (X).  Alternatively, the perms field can be an octal digit (0-7).


##   AUTOMATICALLY CREATED ENTRIES
##       Initially,  files  and directories contain only the three base ACL entries for the owner, the group, and others. There are some rules that need to be satisfied in order for an ACL to be valid:
##
##       *   The three base entries cannot be removed. There must be exactly one entry of each of these base entry types.
##
##       *   Whenever an ACL contains named user entries or named group objects, it must also contain an effective rights mask.
##
##       *   Whenever an ACL contains any Default ACL entries, the three Default ACL base entries (default owner, default group, and default others) must also exist.
##
##       *   Whenever a Default ACL contains named user entries or named group objects, it must also contain a default effective rights mask.
##
##       To help the user ensure these rules, setfacl creates entries from existing entries under the following conditions:
##
##       *   If an ACL contains named user or named group entries, and no mask entry exists, a mask entry containing the same permissions as the group entry is created. Unless the -n  option  is
##           given, the permissions of the mask entry are further adjusted to include the union of all permissions affected by the mask entry. (See the -n option description).
##
##       *   If  a  Default  ACL  entry  is  created, and the Default ACL contains no owner, owning group, or others entry, a copy of the ACL owner, owning group, or others entry is added to the
##           Default ACL.
##
##       *   If a Default ACL contains named user entries or named group entries, and no mask entry exists, a mask entry containing the same permissions as the default Default ACL's group  entry
##           is  added.  Unless  the  -n  option  is given, the permissions of the mask entry are further adjusted to include the union of all permissions affected by the mask entry. (See the -n
##           option description).
##
##EXAMPLES
##       Granting an additional user read access
##              setfacl -m u:lisa:r file
##
##       Revoking write access from all groups and all named users (using the effective rights mask)
##              setfacl -m m::rx file
##
##       Removing a named group entry from a file's ACL
##              setfacl -x g:staff file
##
##       Copying the ACL of one file to another
##              getfacl file1 | setfacl --set-file=- file2
##
##       Copying the access ACL into the Default ACL
##              getfacl --access dir | setfacl -d -M- dir




## ACL_MASK        The ACL_MASK entry denotes the maximum access rights that can be granted by entries of type ACL_USER, ACL_GROUP_OBJ, or ACL_GROUP.

man acl      # there's no book explaining the acl clearly. so the only best way to learn acl and setfacl is to read the manual page.
man setfacl
setfacl -b a.txt   #-b, --remove-all  #Remove all extended ACL entries. The base ACL entries of the owner, group and others are retained.
setfacl -k dir01   #-k, --remove-default  #Remove the Default ACL. If no Default ACL exists, no warnings are issued.


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

tar -zxvf resource.tar.gz --strip-components=1 -C /tmp/resource
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

- [Given two directory trees, how can I find out which files differ?](https://stackoverflow.com/questions/4997693/given-two-directory-trees-how-can-i-find-out-which-files-differ)
```sh
diff --brief -r  dir1/ dir2/
diff --brief -Nr dir1/ dir2/
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


```sh
service atd status      #/bin/systemctl status   atd.service    #<-centos7
service atd stop        #/bin/systemctl stop     atd.service      #<-centos7
service atd start       #/bin/systemctl start    atd.service     #<-centos7
service atd restart     #/bin/systemctl restart  atd.service   #<-centos7

##WARNING
##       atd won't work if its spool directory is mounted via NFS even if no_root_squash is set.

## /var/spool/at         The directory for storing jobs; this should be mode 700, owner root.
## /var/spool/at/spool   The directory for storing output; this should be mode 700, owner root.
## /etc/at.allow, /etc/at.deny determine who can use the at system.

##       at and batch read commands from standard input or a specified file which are to be executed at a later time, using /bin/sh.
##
##       at      executes commands at a specified time.
##       atq     lists the user's pending jobs, unless the user is the superuser; in that case, everybody's jobs are listed.  The format of the output lines (one for each job) is: Job number, date, hour, queue, and username.
##       atrm    deletes jobs, identified by their job number.
##       batch   executes commands when system load levels permit; in other words, when the load average drops below 0.8, or the value specified in the invocation of atd.


man at.allow            #查看/etc/at.allow (白名单), /etc/at.deny (黑名单)的规则与优先级等信息
man atd
man at                  #

##     For  both  at  and  batch,  commands are read from standard input or the file specified with the -f option and executed.  The working directory, the environment (except for the variables BASH_VERSINFO, DISPLAY, EUID, GROUPS,
##     SHELLOPTS, TERM, UID, and _) and the umask are retained from the time of invocation.

##     An  at  -  or  batch  -  command  invoked  from  a  su(1)  shell  will  retain  the  current userid.  The user will be mailed standard error and standard output from his commands, if any.  Mail will be sent using the command
##     /usr/sbin/sendmail.  If at is executed from a su(1) shell, the owner of the login shell will receive the mail.

[root@localhost ~]# at now + 1 minutes
at> /bin/echo helloworld > /dev/pts/10   #It's better to use absolute path to run a command
at> cd /tmp
at> /bin/echo $(pwd) > /dev/pts/10
at> <EOT>

[root@localhost ~]# batch
at> cd /tmp
at> /bin/echo $(pwd) > /dev/pts/10
at> <EOT>


at -f /tmp/myscript.sh  midnight
at -f /tmp/myscript.sh  noon
at -f /tmp/myscript.sh  teatime   # teatime is 4pm

at 18:30
at -f /tmp/myscript.sh  2017-02-28
at -f /tmp/myscript.sh  18:30 2017-02-28
at -f /tmp/myscript.sh  6:30am 2017-02-28
at -f /tmp/myscript.sh  6:30pm 2017-02-28
at -f /tmp/myscript.sh  4am   today
at -f /tmp/myscript.sh  4pm   tomorrow
at -f /tmp/myscript.sh  tomorrow

at -f /tmp/myscript.sh  now + 3 minutes
at -f /tmp/myscript.sh  now + 3 hours
at -f /tmp/myscript.sh  now + 3 days
at -f /tmp/myscript.sh  now + 3 weeks
at -f /tmp/myscript.sh  4pm + 3 days    #run a job at 4pm three days from now
at -f /tmp/myscript.sh  10am Jul 31     #run a job at 10:00am on July 31     #cat /usr/share/doc/at-3.1.13/timespec


atq       #same as `at -l`
at -c 2         #-c   #cats the jobs listed on the command line to standard output
at -m -f /tmp/myscript.sh  now + 3 minutes        #-m    #Send mail to the user when the job has completed even if there was no output.
## atrm [-V] job [job...]      #same as `at -r`   
atrm  2         #2 is a job number
for i in `atq | awk '{print $1}'`;do atrm $i;done     #You can run this command to remove all the jobs at the atq  #https://unix.stackexchange.com/questions/53144/remove-all-at-jobs


```

```sh
service crond status  #Linux 系统上面原本就有非常多的例行性工作，因此这个系统服务是默认启动的。

## /etc/cron.allow    /etc/cron.deny

## When executing commands, any output is mailed to the owner of the crontab (or to the user specified in the MAILTO environment variable in the  crontab,  if  such  exists).  Any job output can also be sent to syslog by using the -s option.

##   Cron checks these files and directories:
##
##   /etc/crontab
##          system  crontab.   Nowadays  the  file is empty by default.  Originally it was usually used to run daily, weekly, monthly jobs.  By default these jobs are now run through anacron
##          which reads /etc/anacrontab configuration file.  See anacrontab(5) for more details.
##
##   /etc/cron.d/
##          directory that contains system cronjobs stored for different users.
##
##   /var/spool/cron
##          directory that contains user crontables created by the crontab command.


man crond
man 5 crontab
man crontab

## crontab - maintains crontab files for individual users

##OPTIONS
##     -u     Appends the name of the user whose crontab is to be modified.  If this option is not used, crontab examines "your" crontab, i.e., the crontab of the person executing the command.
##            Note that su(8) may confuse crontab, thus, when executing commands under su(8) you should always use the -u option.  If no crontab exists for a particular user, it is created for
##            him the first time the crontab -u command is used under his username.
##
##     -l     Displays the current crontab on standard output.
##
##     -r     Removes the current crontab.
##
##     -e     Edits  the current crontab using the editor specified by the VISUAL or EDITOR environment variables.  After you exit from the editor, the modified crontab will be installed auto‐
##            matically.
##
##     -i     This option modifies the -r option to prompt the user for a 'y/Y' response before actually removing the crontab.


## man 5 crontab
##代表意义  分钟 小时 日期 月份 周  指令
##数字范围  0-59 0-23 1-31 1-12 0-7 呀就指令啊
##      The time and date fields are:
##
##              field          allowed values
##              -----          --------------
##              minute         0-59
##              hour           0-23
##              day of month   1-31
##              month          1-12 (or names, see below)
##              day of week    0-7 (0 or 7 is Sunday, or use names)

##   A field may contain an asterisk (*), which always stands for "first-last".
##
##   Ranges of numbers are allowed.  Ranges are two numbers separated with a hyphen.  The specified range is inclusive.  For example, 8-11 for an
##
##   Lists are allowed.  A list is a set of numbers (or ranges) separated by commas.  Examples: "1,2,5,9", "0-4,8-12".
##
##   Step values can be used in conjunction with ranges.  Following a range with "/<number>" specifies skips of the number's value through the range.  For example, "0-23/2" can be used in the 'hours' field to specify command exe‐
##   cution for every other hour (the alternative in the V7 standard is "0,2,4,6,8,10,12,14,16,18,20,22").  Step values are also permitted after an asterisk, so if specifying a job to be run every two hours, you can use "*/2".

##EXAMPLE CRON FILE
##       # use /bin/sh to run commands, no matter what /etc/passwd says
##       SHELL=/bin/sh
##       # mail any output to `paul', no matter whose crontab this is
##       MAILTO=paul
##       #
##       CRON_TZ=Japan
##       # run five minutes after midnight, every day
##       5 0 * * *       $HOME/bin/daily.job >> $HOME/tmp/out 2>&1
##       # run at 2:15pm on the first of every month -- output mailed to paul
##       15 14 1 * *     $HOME/bin/monthly
##       # run at 10 pm on weekdays, annoy Joe
##       0 22 * * 1-5    mail -s "It's 10pm" joe%Joe,%%Where are your kids?%
##       23 0-23/2 * * * echo "run 23 minutes after midn, 2am, 4am ..., everyday"
##       5 4 * * sun     echo "run at 5 after 4 every sunday"
##
##       30 4 1,15 * 5   echo "每月1日和15日以及每个周5的的4:30(注意：周和日是或的关系)"
##
##Jobs in /etc/cron.d/
##       The jobs in cron.d and /etc/crontab are system jobs, which are used usually for more than one user, thus, additionaly the username is needed.  MAILTO on the first line is optional.
##
##EXAMPLE OF A JOB IN /etc/cron.d/job
##       #login as root
##       #create job with preferred editor (e.g. vim)
##       MAILTO=root
##       * * * * * root touch /tmp/file

##EXTENSIONS
##       These special time specification "nicknames" which replace the 5 initial time and date fields, and are prefixed with the '@' character, are supported:
##
##       @reboot    :    Run once after reboot.
##       @yearly    :    Run once a year, ie.  "0 0 1 1 *".
##       @annually  :    Run once a year, ie.  "0 0 1 1 *".
##       @monthly   :    Run once a month, ie. "0 0 1 * *".
##       @weekly    :    Run once a week, ie.  "0 0 * * 0".
##       @daily     :    Run once a day, ie.   "0 0 * * *".
##       @hourly    :    Run once an hour, ie. "0 * * * *".



man anacrontab
man anacron
##anacron - runs commands periodically
##     Anacron  is  used to execute commands periodically, with a frequency specified in days.  Unlike cron(8), it does not assume that the machine is running continuously.  Hence, it can be used on machines that are not running 24
##     hours a day to control regular jobs as daily, weekly, and monthly jobs.
##
##     Anacron reads a list of jobs from the /etc/anacrontab configuration file (see anacrontab(5)).  This file contains the list of jobs that Anacron controls.  Each job entry specifies a period in days,  a  delay  in  minutes,  a
##     unique job identifier, and a shell command.
##
##OPTIONS
##      -s     Serializes execution of jobs.  Anacron does not start a new job before the previous one finished.



##----------------------start>>>---------------------------------------------------------------------
##---centos7----
[root@localhost ~]# cat /etc/cron.d/0hourly
# Run the hourly jobs
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
01 * * * * root run-parts /etc/cron.hourly

##-------------------middle-----------------------------------------

[root@localhost ~]# cat /etc/cron.hourly/0anacron
#!/bin/sh
# Check whether 0anacron was run today already
if test -r /var/spool/anacron/cron.daily; then
    day=`cat /var/spool/anacron/cron.daily`
fi
if [ `date +%Y%m%d` = "$day" ]; then
    exit 0;
fi

# Do not run jobs when on battery power
if test -x /usr/bin/on_ac_power; then
    /usr/bin/on_ac_power >/dev/null 2>&1
    if test $? -eq 1; then
    exit 0
    fi
fi
/usr/sbin/anacron -s

##-------------------middle-----------------------------------------

[root@localhost ~]# ls /var/spool/anacron/                       #This directory is used by Anacron for storing timestamp files.
cron.daily  cron.monthly  cron.weekly
[root@localhost ~]# cat  /var/spool/anacron/*
20170927
20170911
20170921

##-------------------middle-----------------------------------------

[root@localhost ~]# cat /etc/anacrontab
# /etc/anacrontab: configuration file for anacron

# See anacron(8) and anacrontab(5) for details.

SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
# the maximal random delay added to the base delay of the jobs
RANDOM_DELAY=45
# the jobs will be started during the following hours only
START_HOURS_RANGE=3-22

#period in days   delay in minutes   job-identifier   command
1       5       cron.daily              nice run-parts /etc/cron.daily
7       25      cron.weekly             nice run-parts /etc/cron.weekly
@monthly 45     cron.monthly            nice run-parts /etc/cron.monthly

##----------------------end<<<---------------------------------------------------------------------


##资源分配不均的问题
##如果每个流程都在同一个时间启动的话，那么在某个时段时，我的系统会变的相当的繁忙，所以，这个时候就必须要分别设定啦！我可以这样做：
[root@study ~]# vim /etc/crontab
1,6,11,16,21,26,31,36,41,46,51,56 * * * * root CMD1
2,7,12,17,22,27,32,37,42,47,52,57 * * * * root CMD2
3,8,13,18,23,28,33,38,43,48,53,58 * * * * root CMD3
4,9,14,19,24,29,34,39,44,49,54,59 * * * * root CMD4

1-59/5 * * * * root CMD1
2-59/5 * * * * root CMD2
3-59/5 * * * * root CMD3
4-59/5 * * * * root CMD4


[test@localhost ~]$ crontab -e    #/var/spool/cron/test  #cron 执行的每一项工作都会被纪录到 /var/log/cron 这个登录档中
20 8 * * *  /usr/bin/echo hello world > /dev/pts/3

[test@localhost ~]$ crontab -l
## 如果删除当个job, 应该使用`crontab -e`命令来编辑/var/spool/cron/test,删除该job对应的哪一行，
## 如果删除当前用户的所有jobs, 则可以使用 `crontab -r` 命令
[test@localhost ~]$ crontab -r   #相当于删除 /var/spool/cron/test



```

```sh

## fork and exec：过程调用的流程

man bash  #/JOB CONTROL   #/fg \[jobspec]   #/bg \[jobspec ...]

## If  a command is terminated by the control operator &, the shell executes the command in the background in a subshell.
## The shell does not wait for the command to finish, and the return status is 0.

## If  the  operating  system  on which bash is running supports job control, bash contains facilities to use it.
## Typing the suspend character (typically ^Z, Control-Z) while a process is running causes that process to be stopped and returns control to bash.
##
## There are a number of ways to refer to a job in the shell.  The character % introduces a job specification (jobspec).  Job number n may be referred to as %n.
## The symbols %% and %+ refer to the shell's notion of the current job, which is the last job stopped while it was in the foreground or started in the  background.
## The  previous job  may  be  referenced using %-.  If there is only a single job, %+ and %- can both be used to refer to that job.


##   fg [jobspec]
##          Resume jobspec in the foreground, and make it the current job.  If jobspec is not present, the shell's notion of the current job is used.  The return value is that of the command
##          placed  into  the foreground, or failure if run when job control is disabled or, when run with job control enabled, if jobspec does not specify a valid job or jobspec specifies a
##          job that was started without job control.

##   bg [jobspec ...]
##          Resume each suspended job jobspec in the background, as if it had been started with &.  If jobspec is not present, the shell's notion of the current  job  is  used.   bg  jobspec
##          returns 0 unless run when job control is disabled or, when run with job control enabled, any specified jobspec was not found or was started without job control.


tar -zpcf  /tmp/etc.tar.gz  /etc   &
jobs
fg %1
C-z           #stty -a
bg %1

help jobs
jobs -l   #-l        lists process IDs in addition to the normal information
jobs -r   #-r        restrict output to running jobs
jobs -s   #-s        restrict output to stopped jobs

help kill   #type -a kill #which -a kill
man kill

man bash   #/kill -l

##   kill [-s sigspec | -n signum | -sigspec] [pid | jobspec] ...
##   kill -l [sigspec | exit_status]
##          Send the signal named by sigspec or signum to the processes named by pid or jobspec.  sigspec is either a case-insensitive signal name such as SIGKILL (with or  without  the  SIG
##          prefix)  or a signal number; signum is a signal number.  If sigspec is not present, then SIGTERM is assumed.  An argument of -l lists the signal names.  If any arguments are sup‐
##          plied when -l is given, the names of the signals corresponding to the arguments are listed, and the return status is 0.  The exit_status argument to -l  is  a  number  specifying
##          either  a signal number or the exit status of a process terminated by a signal.  kill returns true if at least one signal was successfully sent, or false if an error occurs or an
##          invalid option is encountered.

kill -l      #-l, --list [signal]  #Print a list of signal names, or convert signal given as argument to a name.  The signals are found in /usr/include/linux/signal.h
kill -l 15
kill -15 %2  #same as `kill -SIGTERM %2` #same as `kill -TERM %2`     #15 is default  (以正常步骤结束一项工作)
kill -9  %2  #same as `kill -SIGKILL %2

man killall
## killall - kill processes by name
##DESCRIPTION
##     killall sends a signal to all processes running any of the specified commands.  If no signal name is specified, SIGTERM is sent.
##
##     Signals can be specified either by name (e.g.  -HUP or -SIGHUP) or by number (e.g.  -1) or by option -s.
##
##     If the command name is not regular expression (option -r) and contains a slash (/), processes executing that particular file will be selected for killing, independent of their name.
##
##     killall returns a zero return code if at least one process has been killed for each listed command, or no commands were listed and at least one process matched the -u and -Z search
##     criteria.  killall returns non-zero otherwise.
##
##     A killall process never kills itself (but may kill other killall processes).

killall -9 httpd       # 强制终止所有以 httpd 启动的程序
kill -i -9 bash        # 依次询问每个 bash 程序是否需要被终止运作！


man nice

##  nice - run a program with modified scheduling priority
##
##  SYNOPSIS
##         nice [OPTION] [COMMAND [ARG]...]
##  DESCRIPTION
##         Run COMMAND with an adjusted niceness, which affects process scheduling.  With no COMMAND, print the current niceness.
##         Niceness values range from -20 (most favorable to the process) to 19 (least favorable to the process).
##
##         Mandatory arguments to long options are mandatory for short options too.
##
##         -n, --adjustment=N
##                add integer N to the niceness (default 10)


##  一般来说， PRI 与 NI 的相关性如下：
##  PRI(new) = PRI(old) + nice
##  不过你要特别留意到，如果原本的 PRI 是 50 ，并不是我们给予一个 nice = 5 ，
##  就会让 PRI 变成 55 喔！ 因为 PRI 是系统『动态』决定的，所以，
##  虽然 nice 值是可以影响 PRI ，不过， 最终的 PRI 仍是要经过系统分析后才会决定的。
##
##  此外，你必须要留意到：
##  root 可随意调整自己或他人程序的 Nice 值，且范围为 -20 ~ 19 ；
##  一般用户仅可调整自己程序的 Nice 值，且范围仅为 0 ~ 19 (避免一般用户抢占系统资源)；
##  一般使用者仅可将 nice 值越调越高，例如本来 nice 为 5 ，则未来仅能调整到大于 5；

nice -n -5 vi &


##   renice - alter priority of running processes
##
##  SYNOPSIS
##         renice [-n] priority [-gpu] identifier...
##
##  DESCRIPTION
##         renice  alters  the  scheduling  priority of one or more running processes.  The first argument is the priority value to be used.  The other arguments are interpreted as process IDs (by
##         default), process group IDs, user IDs, or user names.  renice'ing a process group causes all processes in the process group to have their scheduling priority altered.  renice'ing a user
##         causes all processes owned by the user to have their scheduling priority altered.
##
##  OPTIONS
##         -n, --priority priority
##                Specify the scheduling priority to be used for the process, process group, or user.  Use of the option -n or --priority is optional, but when used it must be the first argument.
##
##         -g, --pgrp pgid...
##                Force the succeeding arguments to be interpreted as process group IDs.
##
##         -u, --user name_or_uid...
##                Force the succeeding arguments to be interpreted as usernames or UIDs.
##
##         -p, --pid pid...
##                Force the succeeding arguments to be interpreted as process IDs (the default).

## 整个 nice 值是可以在父程序 --> 子程序之间传递的呢！

renice 10 18625    #same as  `renice -n 10 18625`




## nohup - run a command immune to hangups, with output to a non-tty
## (no hangup)
##SYNOPSIS
##       nohup COMMAND [ARG]...
##       nohup OPTION
##
##    If standard input is a terminal, redirect it from /dev/null.  If standard output is a terminal, append output to 'nohup.out' if possible, '$HOME/nohup.out' otherwise.  If standard error
##    is a terminal, redirect it to standard output.  To save output to FILE, use 'nohup COMMAND > FILE'.
##
##    NOTE: your shell may have its own version of nohup, which usually supersedes the version described here.  Please refer to your shell's documentation for details  about  the  options  it
##    supports.

[root@study ~]# vim sleep500.sh
#!/bin/bash
/bin/sleep 500s
/bin/echo "I have slept 500 seconds."

[root@study ~]# chmod a+x sleep500.sh
[root@study ~]# nohup ./sleep500.sh &



```

```sh
## free - Display amount of free and used memory in the system
##DESCRIPTION
##     free  displays  the  total  amount  of free and used physical and swap
##     memory in the system, as well as the buffers and caches used by the
##     kernel. The information is gathered by parsing /proc/meminfo.

free
free -h
free -hs 5  #-s, --seconds seconds  #Continuously display the result delay seconds apart.  You may actually specify any floating point number for delay, usleep(3) is used for microsecond resolution delay times.


```

```sh
## uptime - Tell how long the system has been running.
##
## DESCRIPTION
##        uptime  gives a one line display of the following information.
##        The current time, how long the system has been running, how many users are currently logged on,
##        and the system load averages for the past 1, 5, and 15 minutes.
##
##        This is the same information contained in the header line displayed by w(1).
##
##        System load averages is the average number of processes that are either
##        in a runnable or uninterruptable state.  A process in a runnable state
##        is either using the CPU or waiting to  use the  CPU.   A process in uninterruptable state is waiting for
##        some I/O access, eg waiting for disk.  The averages are taken over the three time intervals.
##        Load averages are not normalized for the number of CPUs in a system, so a load average of 1 means a single CPU system is loaded all the time
##        while on a 4 CPU system it means it was idle 75% of the time.

uptime

##FILES
##       /var/run/utmp     information about who is currently logged on
##       /proc              process information
```


```sh
## dmesg - print or control the kernel ring buffer
##
##SYNOPSIS
##       dmesg [options]
##
##       dmesg --clear
##       dmesg --read-clear [options]
##       dmesg --console-level level
##       dmesg --console-on
##       dmesg --console-off
##
##DESCRIPTION
##       dmesg is used to examine or control the kernel ring buffer.
##
##       The default action is to read all messages from kernel ring buffer.

dmesg

```

```sh
## netstat - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
## NOTES
##        This program is obsolete.  Replacement for netstat is ss.  Replacement for netstat -r is ip route.  Replacement for netstat -i is ip -s link.  Replacement for netstat -g is ip maddr.

man netstat     #注：netstat命令已经被废弃
netstat
netstat -tulnp   #找出目前系统上已在监听的网络联机及其 PID


https://security.stackexchange.com/questions/51767/does-connection-that-use-0-0-0-0-in-foreign-address-secured
## -----------------------------------------------------------------------------------------------------------------
## Proto Recv-Q Send-Q     Local Address               Foreign Address             State       PID/Program name
## tcp        0      0     127.0.0.1:5555              0.0.0.0:*                   LISTEN
## -----------------------------------------------------------------------------------------------------------------
## All this is indicating is that the process listening on that address and port
## has 'requested' the ability to receive connections from any IP address on any
## port. Until a connection is made the process appears as being connected to
## nothing in this way (asterisk).



## https://superuser.com/questions/240105/netstat-a-command-difference-between-0-0-0-0-and-127-0-0-1
##   Listening on 0.0.0.0 means that the program is listening on all IPv4 addresses assigned to the machine,
##   whereas 127.0.0.1 is the loopback address, only accessible from the same machine.

## https://serverfault.com/questions/78048/whats-the-difference-between-ip-address-0-0-0-0-and-127-0-0-1

## https://serverfault.com/questions/228629/is-there-an-official-name-to-the-0-0-0-0-ip-address
## https://tools.ietf.org/html/rfc5735#section-3
## 0.0.0.0/0, which covers every IP on the Internet, is different from 0.0.0.0/32
## or just 0.0.0.0, which is what the OP seemed to be asking about.  0.0.0.0 is
## INADDR_ANY, which is primarily used when accept(2)ing to allow incoming
## connections regardless of the destination IP address, while 0.0.0.0/0 is "all
## addresses" (most commonly used in routing when specifying a default gateway,
## and in firewalls when specifying default rules), and 0.0.0.0/32 is "the
## unspecified address" (used most commonly in application-level programming to
## say, "this address is wrong/uninitialized").




https://baike.baidu.com/item/INADDR_ANY/1493998?fr=aladdin
https://zhidao.baidu.com/question/560066724.html
http://www.cnblogs.com/lemon-flm/p/7396536.html
## ::: 这三个: 的前两个”::“，是“0:0:0:0:0:0:0:0”的缩写，相当于IPv6的“0.0.0.0”，就是本机的所有IPv6地址，第三个:是IP和端口的分隔符
http://bbs.csdn.net/topics/390895715
## 0.0.0.0的意思是任意地址。表示本机的时候，0.0.0.0代表本机所有可用地址；当外部地址用的时候，表示所有网络地址

## https://askubuntu.com/questions/174387/what-does-the-asterisk-in-the-netstat-output-mean
It is a wildcard meaning "any".
For example, in the third line:
------------------------------------------------------------------------------
tcp        0      0 *:smtp                  *:*                     LISTEN
------------------------------------------------------------------------------
## The first *, in *:smtp, means the process is listening on all of the IP addresses the machine has.
## The second *, in *:*, means connections can come from any IP address.
## The third *, in *:*, means the connection can originate from any port on the remote machine.

## https://en.wikipedia.org/wiki/Netstat
## Statistics provided[edit]
## Netstat provides statistics for the following:
##
## Proto - The name of the protocol (TCP or UDP).
## Local Address - The IP address of the local computer and the port number being used.
##                 The name of the local computer that corresponds to the IP address and
##                 the name of the port is shown unless the -n parameter is specified.
##                 An asterisk (*) is shown for the host if the server is listening on all interfaces.
##                 If the port is not yet established, the port number is shown as an asterisk.
##
## Foreign Address - The IP address and port number of the remote computer to which the socket
##                   is connected. The names that corresponds to the IP address and the port are
##                   shown unless the -n parameter is specified. If the port is not yet established,
##                   the port number is shown as an asterisk (*).
## State - Indicates the state of a TCP connection. The possible states are as follows:
##                   CLOSE_WAIT, CLOSED, ESTABLISHED, FIN_WAIT_1, FIN_WAIT_2, LAST_ACK, LISTEN, SYN_RECEIVED, SYN_SEND, and TIME_WAIT.
##                   For more information about the states of a TCP connection, see RFC 793.


```

```sh
##       fuser - identify processes using files or sockets
##
##SYNOPSIS
##       fuser [-fuv] [-a|-s] [-4|-6] [-c|-m|-n space] [ -k [-i] [-M] [-w] [-SIGNAL] ] name ...
##       fuser -l
##       fuser -V
##
##DESCRIPTION
##       fuser displays the PIDs of processes using the specified files or file systems.  In the default display mode, each file name is followed by a letter denoting the type of access:
##
##              c      current directory.
##              e      executable being run.
##              f      open file.  f is omitted in default display mode.
##              F      open file for writing.  F is omitted in default display mode.
##              r      root directory.
##              m      mmap'ed file or shared library.
##
##       fuser returns a non-zero return code if none of the specified files is accessed or in case of a fatal error.  If at least one access has been found, fuser returns zero.
##
##       In  order  to  look up processes using TCP and UDP sockets, the corresponding name space has to be selected with the -n option. By default fuser will look in both IPv6 and IPv4 sockets.
##       To change the default, behavior, use the -4 and -6 options.  The socket(s) can be specified by the local and remote port, and the remote address.  All fields are optional, but commas in
##       front of missing fields must be present:
##
##       [lcl_port][,[rmt_host][,[rmt_port]]]
##
##       Either symbolic or numeric values can be used for IP addresses and port numbers.
##
##       fuser outputs only the PIDs to stdout, everything else is sent to stderr.

man fuser   #fuser：藉由档案(或文件系统)找出正在使用该档案的程序
fuser -uv .
fuser -mvu .
fuser -mvu  /proc

```

```sh

## lsof - list open files

##  lsof ：列出被程序所开启的档案文件名

man lsof    #/EXAMPLES

lsof  #列出目前系统上面所有已经被开启的档案与装置
lsof -u root -a -U     #仅列出关于 root 的所有程序开启的 socket 档案
lsof +d /dev           #列出目前系统上面所有的被启动的周边装置
lsof -u root | grep bash   #秀出属于 root 的 bash 这支程序所开启的档案



```

```sh
##        pidof -- find the process ID of a running program.
##
## SYNOPSIS
##        pidof [-s] [-c] [-n] [-x] [-m] [-o omitpid[,omitpid..]]  [-o omitpid[,omitpid..]..]  program [program..]
##
## DESCRIPTION
##        Pidof finds the process id's (pids) of the named programs. It prints those id's on the standard output. This program is on some systems used in run-level change scripts, especially when
##        the system has a System-V like rc structure. In that case these scripts are located in /etc/rc?.d, where ? is the runlevel. If the system has a start-stop-daemon (8) program that should
##        be used instead.

man pidof
pidof systemd rsyslogd   #列出目前系统上面 systemd 以及 rsyslogd 这两个程序的 PID

```

```sh
## vmstat - Report virtual memory statistics
## vmstat [options] [delay [count]]
## DESCRIPTION
##     vmstat reports information about processes, memory, paging, block IO, traps, disks and cpu activity.
##
##     The  first report produced gives averages since the last reboot.  Additional reports give information on a sampling period of length delay. 
##     The process and memory reports are instanta neous in either case.


[root@study ~]# vmstat [-a] [延迟 [总计侦测次数]] <==CPU/内存等信息
[root@study ~]# vmstat [-fs] <==内存相关
[root@study ~]# vmstat [-S 单位] <==设定显示数据的单位
[root@study ~]# vmstat [-d] <==与磁盘有关
[root@study ~]# vmstat [-p 分割槽] <==与磁盘有关
选项与参数：
 -a ：使用 inactive/active(活跃与否) 取代 buffer/cache 的内存输出信息；
 -f ：开机到目前为止，系统复制 (fork) 的程序数；
 -s ：将一些事件 (开机至目前为止) 导致的内存变化情况列表说明；
 -S ：后面可以接单位，让显示的数据有单位。例如 K/M 取代 bytes 的容量；
 -d ：列出磁盘的读写总量统计表 -p ：后面列出分割槽，可显示该分割槽的读写总量统计表

man vmstat
vmstat
vmstat 1 3   #每秒一次，共计三次
vmstat -d    #系统上面所有的磁盘的读写状态

```

```sh
man ps

## ps - report a snapshot of the current processes.
## (process status)
## ps displays information about a selection of the active processes.  If you want a repetitive update of the selection and the displayed information, use top(1) instead.
##
##       This version of ps accepts several kinds of options:
##
##       1   UNIX options, which may be grouped and must be preceded by a dash.
##       2   BSD options, which may be grouped and must not be used with a dash.
##       3   GNU long options, which are preceded by two dashes.


##EXAMPLES
##       To see every process on the system using standard syntax:
##          ps -e
##          ps -ef
##          ps -eF
##          ps -ely
##
##       To see every process on the system using BSD syntax:
##          ps ax
##          ps axu      #(注:Note that "ps -aux" is distinct from "ps aux".推荐使用`ps axu`)
##
##       To print a process tree:
##          ps -ejH
##          ps axjf
##
##       To get info about threads:
##          ps -eLf
##          ps axms
##
##       To get security info:
##          ps -eo euser,ruser,suser,fuser,f,comm,label       #man ps  #/STANDARD FORMAT SPECIFIERS
##          ps axZ
##          ps -eM
##
##       To see every process running as root (real & effective ID) in user format:
##          ps -U root -u root u
##
##       To see every process with a user-defined format:
##          ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm
##          ps axo stat,euid,ruid,tty,tpgid,sess,pgrp,ppid,pid,pcpu,comm
##          ps -Ao pid,tt,user,fname,tmout,f,wchan
##
##       Print only the process IDs of syslogd:
##          ps -C syslogd -o pid=
##
##       Print only the name of PID 42:
##          ps -q 42 -o comm=

ps -lA
ps -l -2280     #-123   Identical to --pid 123.  #123    Identical to --pid 123.
ps awxo pid,rss,vsz,etime,args --sort=rss
ps jax --sort=uid,-ppid,+pid

```

```sh
man top

##SYNOPSIS
##   top -hv|-bcHiOSs -d secs -n max -u|U user -p pid -o fld -w [cols]

##   SORTING of task window
##
##      For compatibility, this top supports most of the former top sort keys.  Since this is primarily a service to former top users, these commands do not appear on any help screen.
##            command   sorted-field                  supported
##            A         start time (non-display)      No
##            M         %MEM                          Yes
##            N         PID                           Yes
##            P         %CPU                          Yes
##            T         TIME+                         Yes
##
##      Before  using  any  of the following sort provisions, top suggests that you temporarily turn on column highlighting using the `x' interactive command.  That will help ensure that the
##      actual sort environment matches your intent.
##
##      The following interactive commands will only be honored when the current sort field is visible.  The sort field might not be visible because:
##            1) there is insufficient Screen Width
##            2) the `f' interactive command turned it Off
##
##         <  :Move-Sort-Field-Left
##             Moves the sort column to the left unless the current sort field is the first field being displayed.
##
##         >  :Move-Sort-Field-Right
##             Moves the sort column to the right unless the current sort field is the last field being displayed.
##
##      The following interactive commands will always be honored whether or not the current sort field is visible.
##
##         f | F  :Fields-Management
##             These keys display a separate screen where you can change which field is used as the sort column, among other functions.  This can be a convenient way  to  simply  verify  the
##             current sort field, when running top with column highlighting turned Off.
##
##         R  :Reverse/Normal-Sort-Field toggle
##             Using this interactive command you can alternate between high-to-low and low-to-high sorts.
##
##      Note: Field sorting uses internal values, not those in column display.  Thus, the TTY and WCHAN fields will violate strict ASCII collating sequence.

## Startup Defaults
##     The following startup defaults assume no configuration file, thus no user customizations.  Even so, items shown with an asterisk (`*') could be overridden through the command-line.  All
##     are explained in detail in the sections that follow.
##
##         Global-defaults
##            A - Alt display      Off (full-screen)
##          * d - Delay time       1.5 seconds
##          * H - Threads mode     Off (summarize as tasks)
##            I - Irix mode        On  (no, `solaris' smp)
##          * p - PID monitoring   Off (show all processes)
##          * s - Secure mode      Off (unsecured)
##            B - Bold enable      On  (yes, bold globally)
##         Summary-Area-defaults
##            l - Load Avg/Uptime  On  (thus program name)
##            t - Task/Cpu states  On  (1+1 lines, see `1')
##            m - Mem/Swap usage   On  (2 lines worth)
##            1 - Single Cpu       Off (thus multiple cpus)
##         Task-Area-defaults
##            b - Bold hilite      Off (use `reverse')
##          * c - Command line     Off (name, not cmdline)
##          * i - Idle tasks       On  (show all tasks)
##            J - Num align right  On  (not left justify)
##            j - Str align right  Off (not right justify)
##            R - Reverse sort     On  (pids high-to-low)
##          * S - Cumulative time  Off (no, dead children)
##          * u - User filter      Off (show euid only)
##          * U - User filter      Off (show any uid)
##            V - Forest view      On  (show as branches)
##            x - Column hilite    Off (no, sort field)
##            y - Row hilite       On  (yes, running tasks)
##            z - color/mono       On  (show colors)              #键入z可以toggle颜色(红色)

man top
top
top -d 2     #-d ：后面可以接秒数，就是整个程序画面更新的秒数。预设是 5 秒；
top -b -n 2 > /tmp/top.txt      #-b ：以批次的方式执行 top ，还有更多的参数可以使用喔！ 通常会搭配数据流重导向来将批次的结果输出成为档案。#-n ：与 -b 搭配，意义是，需要进行几次 top 的输出结果
top -d 2 -p 14836     #-p ：指定某些个 PID 来进行观察监测而已。




```

[FIREWALLS](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using_firewalls)

[INSTALLING FIREWALLD](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-installing_firewalld)
```sh
yum install firewalld

##----Starting firewalld--start>---------

systemctl unmask firewalld
systemctl start firewalld
systemctl enable firewalld   #To ensure firewalld starts automatically at system start,

##----Starting firewalld--end<---------


##----Stopping firewalld--start>---------

systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld     #To make sure firewalld is not started by accessing the firewalld D-Bus interface and also if other services require firewalld,

##----Stopping firewalld--end<---------

##----Checking If firewalld Is Running--start>---------

systemctl status firewalld     #check if firewalld is running
firewall-cmd --state           #check if firewall-cmd can connect to the daemon   (running)

##----Checking If firewalld Is Running--end>---------

```

[CONFIGURING FIREWALLD](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld)
```sh

man 5 firewalld.zone
man 5 firewalld.service
man 5 firewalld.icmptype

man firewalld  #/DIRECTORIES
/usr/lib/firewalld  #Default/Fallback configuration
/etc/firewalld      #System configuration settings  (The files will overload the default configuration files.)

[root@localhost ~]# ls /etc/firewalld/
firewalld.conf  helpers  icmptypes  ipsets  lockdown-whitelist.xml  services  zones

[root@localhost ~]# ls /usr/lib/firewalld/
helpers  icmptypes  ipsets  services  xmlschema  zones


[root@localhost ~]# firewall-cmd --get-zones     #[--permanent] --get-zones #Print predefined zones as a space separated list.
[root@localhost ~]# firewall-cmd --get-services  #[--permanent] --get-services #Print predefined services as a space separated list.
[root@localhost ~]# firewall-cmd --get-icmptypes  #[--permanent] --get-icmptypes #Print predefined icmptypes as a space separated list.
[root@localhost ~]# firewall-cmd --get-icmptypes | fmt -5

[root@localhost ~]# firewall-cmd --get-default-zone

[root@localhost ~]# firewall-cmd --get-active-zones   #

####firewall-offline-cmd
##    The command-line client firewall-offline-cmd can only be used by the root user
##    to alter the permanent environment. It is not talking to firewalld, but it is
##    using a part of the firewalld core and the I/O backends to alter the
##    configuration. It is not recommended to use this tool while firewalld is
##    active. It could be used, but changes done with the firewall-offline-cmd are
##    not applied immediately to firewalld. The changes are applied to the permanent
##    environment after firewalld was able to detect file changes in the file system.



```
** [Understanding Network Zones](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using_firewalls)
- The zone settings in /etc/firewalld/ are a range of preset settings, which can be quickly applied to a network interface

 zone                         | explanation
------------------------------|----------------------------------------
drop | Any incoming network packets are dropped; there is no reply. Only outgoing network connections are possible.
block | Any incoming network connections are rejected with an icmp-host-prohibited message for IPv4 and icmp6-adm-prohibited for IPv6. Only network connections initiated from within the system are possible.
public | For use in public areas. You do not trust the other computers on the network to not harm your computer. Only selected incoming connections are accepted.
external | For use on external networks with masquerading enabled, especially for routers. You do not trust the other computers on the network to not harm your computer. Only selected incoming connections are accepted.
[dmz](https://baike.baidu.com/item/DMZ/631225?fr=aladdin) | For computers in your demilitarized zone that are publicly-accessible with limited access to your internal network. Only selected incoming connections are accepted.
work | For use in work areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.
home | For use in home areas. You mostly trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.
internal | For use on internal networks. You mostly trust the other computers on the networks to not harm your computer. Only selected incoming connections are accepted.
trusted | All network connections are accepted.

```sh
It is possible to designate one of these zones to be the default zone. When
interface connections are added to NetworkManager, they are assigned to the
default zone. On installation, the default zone in firewalld is set to be the
public zone.
```


```sh

## Protocol names are preferred over service or application names in firewalld

firewall-cmd --get-services               #To list all services available on the system
firewall-cmd --info-service=service-name  #To get the settings of a service
ls /usr/lib/firewalld/services/           #To list only the default predefined services available

##Files in /usr/lib/firewalld/services/ must not be edited. Only the files in /etc/firewalld/services/ should be edited.

ls /etc/firewalld/services/    #To list the system or user-created services, enter the following command as root

##  The files /usr/lib/firewalld/services/ can be used as templates if you want to add or change a service.

firewall-cmd --permanent --new-service=service-name   #To add a new service in a terminal,
firewall-cmd --permanent --new-service-from-file=service-name.xml    #To add a new service using a local file
## You can change the service name with the additional --name=service-name option.

## As soon as service settings are changed, an updated copy of the service is placed into /etc/firewalld/services/.

cp /usr/lib/firewalld/services/service-name.xml /etc/firewalld/services/service-name.xml   #As root, you can enter the following command to copy a service manually

##  firewalld loads files from /usr/lib/firewalld/services in the first place. If
##  files are placed in /etc/firewalld/services and they are valid, then these will
##  override the matching files from /usr/lib/firewalld/services. The overriden
##  files in /usr/lib/firewalld/services will be used as soon as the matching files
##  in /etc/firewalld/services have been removed or if firewalld has been asked to
##  load the defaults of the services. This applies to the permanent environment
##  only. A reload is needed to get these fallbacks also in the runtime
##  environment.


```

```sh
/etc/firewalld/direct.xml
```

```sh
## Configuring the Firewall Using the firewall-cmd Command-Line Tool

firewall-cmd --set-default-zone=zone-name   #Setting the Default Zone

firewall-cmd --version    #check the version
firewall-cmd --help       #view the help output
man firewall-cmd


## To make a command both persistent and take effect immediately, enter the
## command twice: once with the --permanent and once without. This is because
## a firewalld reload takes more time than just repeating a command because it has
## to reload all configuration files and recreate the whole firewall
## configuration. While reloading, the policy for built-in chains is set to DROP
## for security reasons and is then reset to ACCEPT at the end. Service disruption
## is possible during the reload.


## For configuration settings such as the default zone, there is no difference
## between the runtime and permanent environment when using the command-line and GUI tools.


firewall-cmd --get-active-zones             #view the list of active zones with a list of the interfaces currently assigned to them
firewall-cmd --get-zone-of-interface=em1    #find out the zone that an interface, for example, em1, is currently assigned to
firewall-cmd --zone=public --list-interfaces  #find out all the interfaces assigned to a zone, for example, the public zone,
firewall-cmd --zone=public --list-all      # find out all the settings of a zone, for example, the public zone,
firewall-cmd --info-zone=public            #To view the zone information, use the --info-zone option. To get the verbose output with the description and short description, use the additional -v option.
firewall-cmd --get-services           #To view the list of services currently loaded,
firewall-cmd --permanent --get-services    #To list the custom services that have been created but not loaded, # This lists all services, including custom services configured in /etc/firewalld/services/, even if they are not yet loaded.

firewall-cmd --info-service=ftp   #To show the settings of the ftp service 
## To view the settings in permanent configuration mode, use the --permanent option.


## Dropping All Packets (Panic Mode)
firewall-cmd --panic-on        #To start dropping all incoming and outgoing packets, # All incoming and outgoing packets will be dropped. Active connections will be terminated after a period of inactivity; the time taken depends on the individual session timeout values.
firewall-cmd --panic-off    #To start passing incoming and outgoing packets again, #After disabling panic mode, established connections might work again if panic mode was enabled for a short period of time.
firewall-cmd --query-panic  #find out if panic mode is enabled or disabled, #The command prints yes with exit status 0 if enabled. It prints no with exit status 1 otherwise.


firewall-cmd --reload    #To reload the firewall without interrupting user connections (without losing state information),

## A firewall reload involves reloading all configuration files and recreating the
## whole firewall configuration. While reloading, the policy for built-in chains
## is set to DROP for security reasons and is then reset to ACCEPT at the end.
## Service disruption is therefore possible during the reload. Alternatively as
## the root user, send the SIGHUP signal to reload the firewall.

firewall-cmd --complete-reload   #To reload the firewall and interrupt user connections, discarding state information,
                                 # This command should normally only be used in case of severe firewall problems.
                                 # For example, use this command if there are state information problems and no
                                 # connection can be established but the firewall rules are correct.


firewall-cmd --zone=public --add-interface=em1    #To add an interface to a zone (for example, to add em1 to the public zone),
firewall-cmd --permanent --zone=public --add-interface=em1  #To make this setting persistent, repeat the commands adding the --permanent option


## To add an interface to a zone by editing the ifcfg-em1 configuration file (for
## example, to add em1 to the work zone), add the following line to ifcfg-em1 as
## root:
------------------
ZONE=work
------------------
## Note that if you omit the ZONE option, or use ZONE=, or ZONE='', then the default zone will be used.


######Configuring the Default Zone by Editing the firewalld Configuration File
## As root, open /etc/firewalld/firewalld.conf and edit the file as follows:
-------------------------------------------------------------------------------------------------------------
# default zone
# The default zone used if an empty zone string is used.
# Default: public
DefaultZone=home
-------------------------------------------------------------------------------------------------------------
## Reload the firewall by entering the following command as root:
firewall-cmd --reload
## This will reload the firewall without losing state information (that is, TCP
## sessions will not be terminated), but service disruption is possible during the reload.



firewall-cmd --set-default-zone=public     #To set the default zone (for example, to public  #This change will take effect immediately; in this case, it is not necessary to reload the firewall
firewall-cmd --zone=dmz --list-ports       #To list all open ports for a zone (for example, dmz),   #Note that this will not show ports opened as a result of the --add-services command.
firewall-cmd --zone=dmz --add-port=8080/tcp   #To add a port to a zone (for example, to allow TCP traffic to port 8080 to the dmz zone)
firewall-cmd --zone=dmz --add-port=8080/tcp --permanent

firewall-cmd --zone=public --add-port=5060-5061/udp   #To add a range of ports to a zone (for example, to allow the ports from 5060 to 5061 to the public zone
firewall-cmd --zone=public --add-port=5060-5061/udp --permanent`


firewall-cmd --zone=dmz --list-protocols    #To list all open ports for a zone (dmz, for example), #Note that this command does not show protocols opened as a result of the firewall-cmd --add-services command.

firewall-cmd --zone=dmz --add-protocol=esp   #To add a protocol to a zone (for example, to allow ESP traffic to the dmz zone),
firewall-cmd --zone=dmz --add-protocol=esp --permanent


firewall-cmd --zone=dmz --list-source-ports  #To list all open source ports for a zone (for example, the dmz zone) #Note that this command does not show source ports opened as a result of the firewall-cmd --add-services command.

firewall-cmd --zone=dmz --add-source-port=8080/tcp   #To add a source port to a zone (for example, to allow TCP traffic from port 8080 to the dmz zone)
firewall-cmd --zone=dmz --add-source-port=8080/tcp --permanent

firewall-cmd --zone=public --add-source-port=5060-5061/udp  #To add a range of source ports to a zone (for example, to allow the ports from 5060 to 5061 to the public zone)
firewall-cmd --zone=public --add-source-port=5060-5061/udp --permanent


firewall-cmd --zone=work --add-service=smtp  #To add a service to a zone (for example, to allow SMTP to the work zone
firewall-cmd --zone=work --add-service=smtp --permanent

firewall-cmd --zone=work --remove-service=smtp   #To remove a service from a zone (for example, to remove SMTP from the work zone)
firewall-cmd --zone=work --remove-service=smtp --permanent
## This change will not break established connections. If that is your intention,
## you can use the --complete-reload option, but this will break all established
## connections — not just for the service you have removed.


## Adding a Service to a Zone by Editing XML Files
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld


firewall-cmd --zone=external --query-masquerade   #To check if IP masquerading is enabled (for example, for the external zone) # The command prints yes with exit status 0 if enabled. It prints no with exit status 1 otherwise. If zone is omitted, the default zone will be used.

firewall-cmd --zone=external --add-masquerade  #To enable IP masquerading
firewall-cmd --zone=external --add-masquerade --permanent

firewall-cmd --zone=external --remove-masquerade  #To disable IP masquerading,
firewall-cmd --zone=external --remove-masquerade --permanent


######5.3.5.15. Configuring Port Forwarding Using the Command-Line Interface (CLI)
## To forward inbound network packets from one port to an alternative port or
## address, first enable IP address masquerading for a zone (for example,
## external), by entering the following command as root:
firewall-cmd --zone=external --add-masquerade
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=3753 # forward packets to a local port (a port on the same system),
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=3753 --permanent
## In this example, the packets intended for port 22 are now forwarded to port
## 3753. The original destination port is specified with the port option. This
## option can be a port or port range, together with a protocol. The
## protocol, if specified, must be one of either tcp or udp. The new local
## port (the port or range of ports to which the traffic is being forwarded
## to) is specified with the toport option.

## To forward packets to another IPv4 address, usually an internal address,
## without changing the destination port, enter the following command as root:
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toaddr=192.0.2.55
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toaddr=192.0.2.55 --permanent
## In this example, the packets intended for port 22 are now forwarded to the same
## port at the address given with the toaddr. The original destination port is
## specified with the port option. This option can be a port or port range,
## together with a protocol. The protocol, if specified, must be one of either tcp
## or udp. The new destination port (the port or range of ports to which the
## traffic is being forwarded to) is specified with the toport option.

## To forward packets to another port at another IPv4 address, usually an
## internal address, enter the following command as root:
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=2055:toaddr=192.0.2.55
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=2055:toaddr=192.0.2.55 --permanent
## In this example, the packets intended for port 22 are now forwarded to port
## 2055 at the address given with the toaddr option. The original destination port
## is specified with the port option. This option can be a port or port range,
## together with a protocol. The protocol, if specified, must be one of either tcp
## or udp. The new destination port, the port or range of ports to which the
## traffic is being forwarded to, is specified with the toport option.


## 5.3.6. Configuring the Firewall Using XML Files   # https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld


## 5.3.7. Using the Direct Interface




```






```sh
## iptables service
/etc/sysconfig/iptables
/etc/sysconfig/ip6tables

######Comparison of firewalld to system-config-firewall and iptables
## The essential differences between firewalld and the iptables (and ip6tables) services are:
##   1. The iptables service stores configuration in /etc/sysconfig/iptables and
##      /etc/sysconfig/ip6tables, while firewalld stores it in various XML files in
##      /usr/lib/firewalld/ and /etc/firewalld/. Note that the /etc/sysconfig/iptables
##      file does not exist as firewalld is installed by default on Red Hat Enterprise
##      Linux.
##
##   2. With the iptables service, every single change means flushing all the old rules
##      and reading all the new rules from /etc/sysconfig/iptables, while with
##      firewalld there is no recreating of all the rules. Only the differences are
##      applied. Consequently, firewalld can change the settings during runtime without
##      existing connections being lost.


```


[Enhancing the security of the OS with cryptography changes in Red Hat Enterprise Linux 7.4](https://access.redhat.com/blogs/766093/posts/3050871)
```sh
CentOS7.4中tcp_wrappers已经被弃用，所以CentOS7最好不要再使用此技术了。
tcp_wrappers deprecated # https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html-single/7.4_Release_Notes/index.html


https://www.centos.org/docs/5/html/Deployment_Guide-en-US/ch-tcpwrappers.html


[root@localhost ~]# ldd /sbin/sshd | grep libwrap       #查看sshd服务是否支持tcp_wrappers
        libwrap.so.0 => /lib64/libwrap.so.0 (0x00007eff90d2c000)   #如果输出中有这一行，则表示支持tcp_wrappers

(注： the last line of a hosts access file must be a newline character (created by pressing the Enter key))
/etc/hosts.allow  #许可表
/etc/hosts.deny   #拒绝表

TCP Wrappers Configuration Files

To determine if a client is allowed to connect to a service, TCP Wrappers
reference the following two files, which are commonly referred to as hosts
access files:

/etc/hosts.allow
/etc/hosts.deny

##  When a TCP-wrapped service receives a client request, it performs the following
##  steps:
##
##      It references /etc/hosts.allow. — The TCP-wrapped service sequentially parses
##      the /etc/hosts.allow file and applies the first rule specified for that
##      service. If it finds a matching rule, it allows the connection. If not, it
##      moves on to the next step.
##
##      It references /etc/hosts.deny. — The TCP-wrapped service sequentially parses
##      the /etc/hosts.deny file. If it finds a matching rule, it denies the
##      connection. If not, it grants access to the service.
##
##  The following are important points to consider when using TCP Wrappers to
##  protect network services:
##
##      Because access rules in hosts.allow are applied first, they take precedence
##      over rules specified in hosts.deny. Therefore, if access to a service is
##      allowed in hosts.allow, a rule denying access to that same service in
##      hosts.deny is ignored.
##
##      The rules in each file are read from the top down and the first matching rule
##      for a given service is the only one applied. The order of the rules is
##      extremely important.
##
##      If no rules for the service are found in either file, or if neither file
##      exists, access to the service is granted.
##
##      TCP-wrapped services do not cache the rules from the hosts access files, so any
##      changes to hosts.allow or hosts.deny take effect immediately, without
##      restarting network services.



[root@localhost ~]# yum install tcp_wrappers

## https://www.centos.org/docs/5/html/Deployment_Guide-en-US/ch-tcpwrappers.html
man 5 hosts_options     #/ACCESS CONTROL   #/RUNNING OTHER COMMANDS
man 5 hosts_access      #/EXPANSIONS   #/WILDCARDS
man tcpd

--------------------------------------------------------------------
                 daemon_list : client_list [ : shell_command ]
--------------------------------------------------------------------

##----------------------(命令需要使用绝对路径)-----------------------------------------------------------------------------
[root@www ~]# vim /etc/hosts.deny
rsync : ALL: spawn (echo "security notice from host $(/bin/hostname)" ;\
  echo; /usr/sbin/safe_finger @%h ) | \
  /bin/mail -s "%d-%h security" root & \
  : twist ( /bin/echo -e "\n\nWARNING connection not allowed.\n\n" )
##---------------------------------------------------------------------------------------------------

## Shell Commands
##
## Option fields allow access rules to launch shell commands through the following two directives:
##
## spawn — Launches a shell command as a child process. This directive can perform tasks like using /usr/sbin/safe_finger
##         to get more information about the requesting client or create special log files using the echo command.
##
## ##In the following example, clients attempting to access Telnet services from the example.com domain are quietly logged to a special file:
## ---example start>-------------------------------------------
## in.telnetd : .example.com \
##   : spawn /bin/echo `/bin/date` from %h>>/var/log/telnet.log \
##   : allow
## ---example end<-------------------------------------------
##
## twist — Replaces the requested service with the specified command. This directive is often used to set up traps
##         for intruders (also called "honey pots"). It can also be used to send messages to connecting clients.
##         The twist directive must occur at the end of the rule line.
##
## ##In the following example, clients attempting to access FTP services from the example.com domain are sent a message using the echo command:
##
## ---example start>-------------------------------------------
## vsftpd : .example.com \
##   : twist /bin/echo "421 This domain has been black-listed. Access denied!"
## ---example end<-------------------------------------------
```

- [EDITING NETWORK CONFIGURATION FILES](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-Editing_Network_Configuration_Files)
- [CentOS7网络配置和修改网卡名称及常用服务管理命令](http://www.linuxidc.com/Linux/2017-04/143002.htm)
- [CONSISTENT NETWORK DEVICE NAMING](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/ch-Consistent_Network_Device_Naming)
- [CentOS 7 系统网卡命名规则](http://blog.csdn.net/example440982/article/details/53107063)

```sh
## 一致的网络设备名以双字符前缀开始：
en: 表示以太网设备 EtherNet
wl: 表示无线局域网设备 Wireless LAN
ww: 表示无线广域网设备 Wireless WAN

## 随后的第3个字符用于用于区分不同的硬件类型
o: 表示主板板载设备 Onboard device
s: 表示热插拔插槽上的设备 hot-plug Slot
p: 表示PCI总线或USB接口上的设备 PCI Device

举例：
eno16777736: 板载的以太网设备(板载设备索引编号为16777736)
enp0s8:      PCI接口的以太网设备(PCI总线地址0，插槽编号为8)
wlp12s0:     PCI接口的无线以太网设备(PCI总线地址12，插槽编号为0)

```

** Static Network Settings
```sh
[root@localhost ~]# vim /etc/sysconfig/network-scripts/ifcfg-eno16777736
DEVICE=eno16777736
BOOTPROTO=none
ONBOOT=yes
PREFIX=24
IPADDR=192.168.253.131

```



```

```sh
## Makefile的学习资源·：Makefile经典教程(掌握这些足够)   http://blog.csdn.net/ruglcc/article/details/7814546

##  tarball安装
tar -zxvf /root/ntp-4.2.8p3.tar.gz   -C  /usr/local/src/
cd /usr/local/src/ntp-4.2.8p3
vi INSTALL                    #<==记得 README 也要看一下！
./configure --help | less     #<==查询可用的参数有哪些
./configure --prefix=/usr/local/ntp --enable-all-clocks --enable-parse-clocks #<==开始建立Makefile
make clean; make
make check
make install


make uninstall

## 函数库管理
## XXX.a  静态函数库(archive)
## XXX.so 动态函数库(shared object)


##      ldconfig - configure dynamic linker run-time bindings
##
## SYNOPSIS
##        /sbin/ldconfig [ -nNvXV ] [ -f conf ] [ -C cache ] [ -r root ] directory ...
##        /sbin/ldconfig -l [ -v ] library ...
##        /sbin/ldconfig -p
##
## DESCRIPTION
##      ldconfig creates the necessary links and cache to the most recent shared libraries found in the directories specified on the command line, in the file /etc/ld.so.conf, and in the trusted directories (/lib and /usr/lib).  The
##      cache is used by the run-time linker, ld.so or ld-linux.so.  ldconfig checks the header and filenames of the libraries it encounters when determining which versions should have their links updated.
##
##      ldconfig will attempt to deduce the type of ELF libs (i.e., libc5 or libc6/glibc) based on what C libs, if any, the library was linked against.
##
##      Some existing libs do not contain enough information to allow the deduction of their type.  Therefore, the /etc/ld.so.conf file format allows the specification of an expected type.  This is used only for those ELF libs which
##      we  can not work out.  The format is "dirname=TYPE", where TYPE can be libc4, libc5, or libc6.  (This syntax also works on the command line.)  Spaces are not allowed.  Also see the -p option.  ldconfig should normally be run
##      by the superuser as it may require write permission on some root owned directories and files.


## FILES
##        /lib/ld.so          run-time linker/loader
##        /etc/ld.so.conf     File containing a list of colon, space, tab, newline, or comma-separated directories in which to search for libraries.
##        /etc/ld.so.cache    File containing an ordered list of libraries found in the directories specified in /etc/ld.so.conf, as well as those found in /lib and /usr/lib.


man ldconfig


范例一：假设我的 Mariadb 数据库函式库在 /usr/lib64/mysql 当中，如何读进 cache ？
[root@study ~]# vim /etc/ld.so.conf.d/vbird.conf
/usr/lib64/mysql   #这一行新增的啦！

[root@study ~]# ldconfig   #画面上不会显示任何的信息，不要太紧张！正常的！
[root@study ~]# ldconfig -p      #-p     Print the lists of directories and candidate libraries stored in the current cache.


```

```sh
##        ldd - print shared library dependencies
##
## SYNOPSIS
##        ldd [OPTION]... FILE...
##
## DESCRIPTION
##        ldd prints the shared libraries required by each program or shared library specified on the command line.
##
##   Security
##      In  the usual case, ldd invokes the standard dynamic linker (see ld.so(8)) with the LD_TRACE_LOADED_OBJECTS environment variable set to 1, which causes the linker to display the library dependencies.  Be aware, however, that
##      in some circumstances, some versions of ldd may attempt to obtain the dependency information by directly executing the program.  Thus, you should never employ ldd on an untrusted executable, since this may result in the exe‐
##      cution of arbitrary code.  A safer alternative when dealing with untrusted executables is:
##
##          $ objdump -p /path/to/program | grep NEEDED


man ldd
ldd /usr/bin/passwd
ldd -v /lib64/libc.so.6     #使用 -v 这个参数还可以得知该函式库来自于哪一个软件


```


```sh
##    md5sum - compute and check MD5 message digest
##
## SYNOPSIS
##        md5sum [OPTION]... [FILE]...
##
## DESCRIPTION
##        Print or check MD5 (128-bit) checksums.  With no FILE, or when FILE is -, read standard input.

## md5sum / sha1sum / sha256sum

## [root@study ~]# md5sum/sha1sum/sha256sum [-bct] filename
## [root@study ~]# md5sum/sha1sum/sha256sum [--status|--warn] --check filename

md5sum ntp-4.2.8p3.tar.gz
md5sum a.txt b.txt > md5.txt
md5sum --check md5.txt



```


```sh
## daemon的主要分类：

## 依据 daemon 的启动与管理方式来区分:
## - stand alone
## - super daemon
##    * multi-threaded
##    * single-threaded

## 以 daemon 提供服务的的工作状态来区分:
## - signal-control
## - interval-control

man daemon

cat /etc/services

man httpd

ls /var/run/    #/var/run/sshd.pid
cat /var/run/sshd.pid

man service      #which service  #cat /usr/sbin/service

/etc/init.d   #The directory containing System V init scripts.
/etc/sysconfig/* ：各服务的初始化环境配置文件( /etc/sysconfig/syslog, /etc/sysconfig/network)
/etc/xinetd.conf, /etc/xinetd.d/* ：super daemon 配置文件   # super daemon 只是一个统一管理的机制，他所管理的其他 daemon 的配置则写在 /etc/xinetd.d/* 里头喔！ 
/etc/* ：各服务各自的配置文件
/var/lib/* ：各服务产生的数据库  ( /var/lib/mysql/ )
/var/run/* ：各服务的程序之 PID 记录处

Stand alone 的 /etc/init.d/* 启动

/etc/init.d/syslog   # 什么参数都不加的时候，系统会告诉你可以用的参数有哪些
/etc/init.d/syslog status      #service syslog status
/etc/init.d/syslog start       #service syslog start
/etc/init.d/syslog stop        #service syslog stop
/etc/init.d/syslog restart     #service syslog restart

[root@www ~]# service [service name] (start|stop|restart|...)
[root@www ~]# service --status-all

## ----------Super daemon 的启动方式>>>-------------start centos6-------(注：此例子步骤不全，因只为演示Super daemon 的启动方式)--------------------
## CentOS6: http://www.server-world.info/en/note?os=CentOS_6&p=rsynco
## CentOS7: https://www.server-world.info/en/note?os=CentOS_7&p=rsync

[root@www ~]# yum -y install rsync xinetd
[root@www ~]# grep -rn 'disable' /etc/xinetd.d/    #那如何得知 super daemon 所管理的服务是否有启动呢？你可以这样做

## 1. 先修改配置文件成为启动的模样：
[root@www ~]# vim /etc/xinetd.d/rsync
## 请将 disable 那一行改成如下的模样 (原本是 yes 改成 no 就对了)
service rsync
{
##        disable = yes
        disable = no
        flags           = IPv6
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/bin/rsync
        server_args     = --daemon
        log_on_failure  += USERID
}
## 2. 重新启动 xinetd 这个服务
[root@www ~]# /etc/rc.d/init.d/xinetd start   #service xinetd restart

# 3. 观察启动的端口
[root@www ~]# grep 'rsync' /etc/services  <==先看看端口是哪一号

[root@www ~]# netstat -tnlp | grep 873

man xinetd
man xinetd.conf

##默认值配置文件 /etc/xinetd.conf

http://cn.linux.vbird.org/linux_basic/0560daemons_2.php

## ----------Super daemon 的启动方式<<<-------------end centos6-------(注：此例子步骤不全，因只为演示Super daemon 的启动方式)--------------------


```sh
## 配置开机后立即启动服务的方法 ----CentOS6---------------

## 到底我的 Linux 主机是怎么启动的呢？
##     1. 打开计算机电源，开始读取 BIOS 并进行主机的自我测试；
##     2. 透过 BIOS 取得第一个可启动装置，读取主要启动区 (MBR) 取得启动管理程序；
##     3. 透过启动管理程序的配置，取得 kernel 并加载内存且侦测系统硬件；
##     4. 核心主动呼叫 init 程序；
##     5. init 程序开始运行系统初始化 (/etc/rc.d/rc.sysinit)
##     6. 依据 init 的配置进行 daemon start (/etc/rc.d/rc[0-6].d/*)   <------------------------------
##     7. 加载本机配置 (/etc/rc.d/rc.local)`

## chkconfig： 管理系统服务默认启动启动与否
## [root@www ~]# chkconfig --list [服务名称]
## [root@www ~]# chkconfig [--level [0123456]] [服务名称] [on|off]

[root@www ~]# chkconfig --list | less    #列出目前系统上面所有被 chkconfig 管理的服务
[root@www ~]# chkconfig --list | grep '3:on'  #显示出目前在 run level 3 为启动的服务
[root@www ~]# chkconfig --level 345 atd on    #让 atd 这个服务在 run level 为 3, 4, 5 时启动：


## chkconfig 仅是配置启动时默认会启动的服务而已， 所以该服务目前的状态如何是不知道的
[root@www ~]# /etc/init.d/httpd status
[root@www ~]# chkconfig --list httpd
[root@www ~]# chkconfig httpd on; chkconfig --list httpd
[root@www ~]# /etc/init.d/httpd status

##  chkconfig 可以配置开机是否启动，我们也能用来管理 super daemon 的启动与关闭
[root@www ~]# /etc/init.d/rsync status
[root@www ~]# netstat -tlup | grep rsync
[root@www ~]# chkconfig --list rsync
[root@www ~]# chkconfig rsync off; chkconfig --list rsync     #命令`chkconfig rsync off`会将/etc/xinetd.d/rsync文件中disable那一行修改为"disable = yes"
[root@www ~]# /etc/init.d/xinetd restart; netstat -tlup | grep rsync


## -----chkconfig： 配置自己的系统服务-----------start>-----------------------
man chkconfig   #可以查看init.d script的格式要求

## [root@www ~]# chkconfig [--add|--del] [服务名称]
## 选项与参数：
## --add ：添加一个服务名称给 chkconfig 来管理，该服务名称必须在 /etc/init.d/ 内
## --del ：删除一个给 chkconfig 管理的服务

## 举个例子，我们在 /etc/init.d/ 里面创建一个 myvbird 文件，该文件仅是一个简单的服务范例，基本上，没有任何用途.... 对于该文件的必须性是这样的：
##   -- myvbird 将在 run level 3 及 5 启动；
##   -- myvbird 在 /etc/rc.d/rc[35].d 当中启动时，以 80 顺位启动，以 70 顺位结束。
[root@www ~]# vim /etc/init.d/myvbird
#!/bin/bash
# chkconfig: 35 80 70
# description: 没啥！只是用来作为练习之用的一个范例
echo "Nothing" "man chkconfig"

## 基本上，比较重要的是第二行，他的语法是： 『 chkconfig: [runlevels] [启动顺位] [停止顺位] 』其中，
## runlevels 为不同的 run level 状态， 启动顺位 (start number) 与 结束顺位 (stop number)
## 则是在 /etc/rc.d/rc[35].d 内创建以 S80myvbird 及 K70myvbird 为档名的配置方式！

[root@www ~]# chkconfig --list myvbird
[root@www ~]# chkconfig --add myvbird; chkconfig --list myvbird   #`chkconfig --add myvbird`会创建两个文件/etc/rc.d/rc3.d/S80myvbird  /etc/rc.d/rc5.d/S80myvbird
[root@www ~]# chkconfig --del myvbird                             #`chkconfig --del myvbird`会删除两个文件/etc/rc.d/rc3.d/S80myvbird  /etc/rc.d/rc5.d/S80myvbird
[root@www ~]# rm /etc/init.d/myvbird

## -----chkconfig： 配置自己的系统服务-----------end<-----------------------


## ntsysv： 类图形接口管理模式      #我们的 CentOS 还有提供一个更不错用的， 那就是 ntsysv 了！注意喔， chkconfig 很多的 distributions 都存在，但是 ntsysv 则是 Red Hat 系统特有的！
## (注:ntsysv在putty中也是可以使用的)
## [root@www ~]# ntsysv [--level <levels>]
## 选项与参数：
## --level ：后面可以接不同的 run level ，例如 ntsysv --level 35



```


```sh
## -----------------------CentOS7----------------------------------
## systemd 有好处:
   1. 平行处理所有服务，加速开机流程(未相依的服务同时启动)
   2. 一经要求就响应的 on-demand 启动方式 (systemd 全部就是仅有一只 systemd 服务搭配 systemctl 指令来处理, systemd 由于常驻内存，因此任何要求 (on-demand) 都可以立即处理后续的 daemon 启动的任务)
   3. 服务相依性的自我检查(systemd 可以自定义服务相依性的检查, B->A, 则systemd 会自动帮你启动 A 服务)
   4. 依 daemon 功能分类(首先 systemd 先定义所有的服务为一个服务单位 (unit)，并将该 unit 归类到不同的服务类型 (type) 去。
       旧的 init 仅分为 stand alone 与 super daemon 实在不够看，
       systemd 将服务单位 (unit) 区分为 service, socket, target, path, snapshot, timer 等多种不同的类型(type)， 方便管理员的分类与记忆)
   5. 将多个 daemons 集合成为一个群组 (如同 systemV 的 init 里头有个 runlevel 的特色，systemd 亦将许多的功能集合成为一个所谓的 target 项目，
       这个项目主要在设计操作环境的建置， 所以是集合了许多的 daemons，亦即是执行某个 target 就是执行好多个 daemon 的意思！)

   6. 向下兼容旧有的 init 服务脚本

## 虽然如此，不过 systemd 也是有些地方无法完全取代 init 的！包括：
   1. 在 runlevel 的对应上，大概仅有 runlevel 1, 3, 5 有对应到 systemd 的某些 target 类型而已，没有全部对应； 
   2. 全部的 systemd 都用 systemctl 这个管理程序管理，而 systemctl 支持的语法有限制，不像 /etc/init.d/daemon 就是纯脚本可以自定义参数，systemctl 不可自定义参数
   3. 如果某个服务启动是管理员自己手动执行启动，而不是使用 systemctl 去启动的 (例如你自己手动输入 crond 以启动 crond 服务)，那么 systemd 将无法侦测到该服务，而无法进一步管理。 
   4. systemd 启动过程中，无法与管理员透过 standard input 传入讯息！因此，自行撰写 systemd 的启动设定时，务必要取消互动机制～(连透过启动时传进的标准输入讯息也要避免！)


## https://en.wikipedia.org/wiki/Systemd
## https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-managing_services_with_systemd

man systemd
man systemctl
## 书籍： <鸟哥的 Linux 私房菜(第四版)>

ls -l /usr/lib/systemd/system/ | grep -E '(vsftpd|multi|cron)'

[root@study ~]# systemctl status atd.service    #看看目前 atd 这个服务的状态为何？
[root@study ~]# systemctl stop atd.service      #正常关闭这个 atd 服务  #不应该使用 kill 的方式来关掉一个正常的服务喔！否则 systemctl 会无法继续监控该服务的！ 那就比较麻烦。

## 再回到 systemctl status atd.service 的第三行，不是有个 Active 的 daemon 现在状态吗？除了 running 跟 dead 之外， 有没有其他的状态呢？有的～基本上有几个常见的状态：
##    active (running)：正有一只或多只程序正在系统中执行的意思，举例来说，正在执行中的 vsftpd 就是这种模式。
##    active (exited)：仅执行一次就正常结束的服务，目前并没有任何程序在系统中执行。 举例来说，开机或者是挂载时才会进行一次的 quotaon 功能，
##                     就是这种模式！ quotaon 不须一直执行～只须执行一次之后，就交给文件系统去自行处理啰！通常用 bash shell 写的小型服务，大多是属于这种类型 (无须常驻内存)。
##    active (waiting)：正在执行当中，不过还再等待其他的事件才能继续处理。举例来说，打印的队列相关服务就是这种状态！
##                      虽然正在启动中，不过，也需要真的有队列进来 (打印作业) 这样他才会继续唤醒打印机服务来进行下一步打印的功能。
##    inactive：这个服务目前没有运作的意思。

## 既然 daemon 目前的状态就有这么多种了，那么 daemon 的预设状态有没有可能除了 enable/disable 之外，还有其他的情况呢？当然有！
enabled：这个 daemon 将在开机时被执行
disabled：这个 daemon 在开机时不会被执行
static：这个 daemon 不可以自己启动 (enable 不可)，不过可能会被其他的 enabled 的服务来唤醒 (相依属性的服务)
mask：这个 daemon 无论如何都无法被启动！因为已经被强制注销 (非删除)。可透过 systemctl unmask 方式改回原本状态


##--- 练习01--start>--(关闭独立的服务:即不存在相依问题，不会被其他 systemd unit 唤醒)-----------------------------
[root@study ~]# systemctl status chronyd.service
[root@study ~]# systemctl stop chronyd.service
[root@study ~]# systemctl disable chronyd.service
[root@study ~]# systemctl status chronyd.service

##--- 练习01--end<--(关闭独立的服务:即不存在相依问题，不会被其他 systemd unit 唤醒)-----------------------------




##--- 练习02--start>-----(强迫服务注销，不管服务的相依问题,即不理会其他可以唤醒该服务的systemd unit)--------------------------

[root@study ~]# systemctl status cups.service
[root@study ~]# systemctl stop cups.service
[root@study ~]# systemctl disable cups.service
[root@study ~]# netstat -tlunp | grep cups
[root@study ~]# systemctl start cups.socket  #尝试启动 cups.socket 监听客户端的需求喔！
[root@study ~]# systemctl status cups.service cups.socket cups.path  # 确定仅有 cups.socket 在启动，其他的并没有启动的状态！
[root@study ~]# echo "testing" | lp     #尝试使用 lp 这个指令来打印看看？
[root@study ~]# systemctl status cups.service    # 见鬼！竟然 cups 自动被启动了！明明我们都没有驱动他啊！怎么回事啊？

## 上面这个范例的练习在让您了解一下，很多服务彼此之间是有相依性的！cups 是一种打印服务，
## 这个打印服务会启用 port 631 来提供网络打印机的打印功能。 但是其实我们无须一直启动 631 埠口吧？
## 因此，多了一个名为 cups.socket 的服务，这个服务可以在『用户有需要打印时，才会主动唤醒 cups.service 』的意思！
## 因此，如果你仅是 disable/stop cups.service 而忘记了其他两个服务的话，
## 那么当有用户向其他两个 cups.path, cups.socket 提出要求时， cups.service 就会被唤醒！所以，你关掉也没用！

## --强迫服务注销 (mask) 的练习-----------------
## 比较正规的作法是，要关闭 cups.service 时，连同其他两个会唤醒 service 的 cups.socket 与 cups.path 通通关闭，那就没事了！
## 比较不正规的作法是，那就强迫 cups.service 注销吧！透过 mask 的方式来将这个服务注销看看！
[root@study ~]# systemctl stop cups.service
[root@study ~]# systemctl mask cups.service
ln -s '/dev/null' '/etc/systemd/system/cups.service'  # 喔耶～其实这个 mask 注销的动作，只是让启动的脚本变成空的装置而已！
[root@study ~]# systemctl status cups.service
[root@study ~]# systemctl start cups.service
Failed to issue method call: Unit cups.service is masked. # 再也无法唤醒！

## 上面的范例你可以仔细推敲一下～原来整个启动的脚本配置文件被连结到 /dev/null 这个空装置～因此，
## 无论如何你是再也无法启动这个 cups.service 了！ 透过这个 mask 功能，
## 你就可以不必管其他相依服务可能会启动到这个想要关闭的服务了！虽然是非正规，不过很有效！ ^_^

## 那如何取消注销呢？当然就是 unmask 即可啊！ [root@
[root@study ~]# systemctl unmask cups.service
[root@study ~]# systemctl status cups.service      ## 好佳在有恢复正常！

##--- 练习02--end<-----(强迫服务注销，不管服务的相依问题,即不理会其他可以唤醒该服务的systemd unit)--------------------------






####### 透过 systemctl 观察系统上所有的服务
##   那系统上面有多少的服务存在呢？这个时候就得要透过 list-units 及 list-unit-files 来观察了！
## [root@study ~]# systemctl [command] [--type=TYPE] [--all]
##   command:
##      list-units ：依据 unit 列出目前有启动的 unit。若加上 --all 才会列出没启动的。
##      list-unit-files ：依据 /usr/lib/systemd/system/ 内的档案，将所有档案列表说明。
##   --type=TYPE：就是之前提到的 unit type，主要有 service, socket, target 等

[root@study ~]# systemctl    #列出系统上面有启动的 unit    #systemctl 都不加参数，其实预设就是 list-units 的意思！
[root@study ~]# systemctl list-unit-files     #列出所有已经安装的 unit 有哪些？  #使用 systemctl list-unit-files 会将系统上所有的服务通通列出来～而不像 list-units 仅以 unit 分类作大致的说明


[root@study ~]# systemctl list-units --type=service --all   #我不想要知道这么多的 unit 项目，我只想要知道 service 这种类别的 daemon 而已，而且不论是否已经启动，通通要列出来！
[root@study ~]# systemctl list-units --type=service --all | grep cpu   #查询系统上是否有以 cpu 为名的服务？




####### 透过 systemctl 管理不同的操作环境 (target unit)
[root@study ~]# systemctl list-units --type=target --all    #列出跟操作界面比较有关的 target 项目

## 在我们的 CentOS 7.1 的预设情况下，就有 26 个 target unit 耶！而跟操作界面相关性比较高的 target 主要有底下几个：
##    -  graphical.target：就是文字加上图形界面，这个项目已经包含了底下的 multi-user.target 项目！
##    -  multi-user.target：纯文本模式！
##    -  rescue.target：在无法使用 root 登入的情况下，systemd 在开机时会多加一个额外的暂时系统，与你原本的系统无关。
##                      这时你可以取得 root 的权限来维护你的系统。 但是这是额外系统，因此可能需要动到 chroot 的方式来取得你原有的系统喔！再后续的章节我们再来谈！
##    -  emergency.target：紧急处理系统的错误，还是需要使用 root 登入的情况，在无法使用 rescue.target 时，可以尝试使用这种模式！
##    -  shutdown.target：就是关机的流程。
##    -  getty.target：可以设定你需要几个 tty 之类的，如果想要降低 tty 的项目，可以修改这个东西的配置文件！
##
##  正常的模式是 multi-user.target 以及 graphical.target 两个，救援方面的模式主要是 rescue.target 以及更严重的 emergency.target。
##  如果要修改可提供登入的 tty 数量，则修改 getty.target 项目。基本上，我们最常使用的当然就是 multi-user 以及 graphical 啰！


## [root@study ~]# systemctl [command] [unit.target]
## 选项与参数：
## command:
##         get-default ：取得目前的 target
##         set-default ：设定后面接的 target 成为默认的操作模式
##         isolate ：切换到后面接的模式


[root@study ~]# systemctl get-default   #我们的测试机器默认是图形界面，先观察是否真为图形模式，再将默认模式转为文字界面
[root@study ~]# systemctl set-default multi-user.target    #将默认模式转为文字界面
[root@study ~]# systemctl get-default
[root@study ~]# systemctl isolate multi-user.target        #在不重新启动的情况下，将目前的操作环境改为纯文本模式，关掉图形界面
[root@study ~]# systemctl isolate graphical.target         #重新取得图形界面

## 要注意，改变 graphical.target 以及 multi-user.target 是透过 isolate 来处理的！
## 鸟哥刚刚接触到 systemd 的时候，在 multi-user.target 环境下转成 graphical.target 时，
## 可以透过 systemctl start graphical.target 喔！然后鸟哥就以为关闭图形界面即可回到 multi-user.target 的！
## 但使用 systemctl stop graphical.target 却完全不理鸟哥～这才发现错了...在 service 部份用 start/stop/restart 才对，
## 在 target 项目则请使用 isolate (隔离不同的操作模式) 才对！


## 为了方便起见， systemd 也提供了数个简单的指令给我们切换操作模式之用喔！ 大致上如下所示：
[root@study ~]# systemctl poweroff          # 系统关机
[root@study ~]# systemctl reboot            # 重新启动
[root@study ~]# systemctl suspend           # 进入暂停模式
[root@study ~]# systemctl hibernate         # 进入休眠模式
[root@study ~]# systemctl rescue            # 强制进入救援模式
[root@study ~]# systemctl emergency         # 强制进入紧急救援模式


## 关机、重新启动、救援与紧急模式这没啥问题，那么什么是暂停与休眠模式呢？
##   suspend：  暂停模式会将系统的状态数据保存到内存中，然后关闭掉大部分的系统硬件，
##              当然，并没有实际关机喔！ 当用户按下唤醒机器的按钮，系统数据会重内存中回复，
##              然后重新驱动被大部分关闭的硬件，就开始正常运作！唤醒的速度较快。
##   hibernate：休眠模式则是将系统状态保存到硬盘当中，保存完毕后，将计算机关机。
##              当用户尝试唤醒系统时，系统会开始正常运作， 然后将保存在硬盘中的系统状态恢复回来。
##              因为数据是由硬盘读出，因此唤醒的效能与你的硬盘速度有关。





####### 透过 systemctl 分析各服务之间的相依性
## [root@study ~]# systemctl list-dependencies [unit] [--reverse]
## 选项与参数：
## --reverse ：反向追踪谁使用这个 unit 的意思！

## 列出目前的 target 环境下，用到什么特别的 unit
[root@study ~]# systemctl get-default
[root@study ~]# systemctl list-dependencies             #列出当前target依赖哪些systemd unit
[root@study ~]# systemctl list-dependencies --reverse   #列出当前target被哪些systemd unit依赖

## 与 systemd 的 daemon 运作过程相关的目录简介

## 我们在前几小节曾经谈过比较重要的 systemd 启动脚本配置文件在 /usr/lib/systemd/system/, /etc/systemd/system/ 目录下，
## 那还有哪些目录跟系统的 daemon 运作有关呢？ 基本上是这样的：
##    /usr/lib/systemd/system/：使用 CentOS 官方提供的软件安装后，默认的启动脚本配置文件都放在这里，这里的数据尽量不要修改～ 要修改时，请到 /etc/systemd/system 底下修改较佳！
##    /run/systemd/system/：    系统执行过程中所产生的服务脚本，这些脚本的优先序要比 /usr/lib/systemd/system/ 高！
##    /etc/systemd/system/：    管理员依据主机系统的需求所建立的执行脚本，其实这个目录有点像以前 /etc/rc.d/rc5.d/Sxx 之类的功能！执行优先序又比 /run/systemd/system/ 高喔！
##    /etc/sysconfig/*：        几乎所有的服务都会将初始化的一些选项设定写入到这个目录下，举例来说，mandb 所要更新的 man page 索引中，
##                              需要加入的参数就写入到此目录下的 man-db 当中喔！而网络的设定则写在 /etc/sysconfig/network-scripts/ 这个目录内。所以，这个目录内的档案也是挺重要的；
##    /var/lib/：               一些会产生数据的服务都会将他的数据写入到 /var/lib/ 目录中。举例来说，数据库管理系统 Mariadb 的数据库默认就是写入 /var/lib/mysql/ 这个目录下啦！
##    /run/：                   放置了好多 daemon 的暂存档，包括 lock file 以及 PID file 等等。


## 我们知道 systemd 里头有很多的本机会用到的 socket 服务，里头可能会产生很多的 socket file
##  ～那你怎么知道这些 socket file 放置在哪里呢？ 很简单！还是透过 systemctl 来管理！
[root@study ~]# systemctl list-sockets

[root@study ~]# systemctl list-sockets  --all  #Pass --all to see loaded but inactive sockets, too.



####### 网络服务与端口口对应简介
[root@study ~]# cat /etc/services

## 基本上，会产生一个网络监听端口口 (port) 的程序，你就可以称他是个网络服务了！ 那么如何观察网络端口口？就这样追踪啊！
[root@study ~]# netstat -tlunp
[root@study ~]# systemctl list-units --all | grep avahi-daemon   #使用 systemctl 去观察一下，到底有没有 avahi-daemon 为开头的服务呢

## 透过追查，知道这个 avahi-daemon 的目的是在局域网络进行类似网芳的搜寻，
## 因此这个服务可以协助你在区网内随时了解即插即用的装置！ 包括笔记本电脑等，
## 只要连上你的区网，你就能够知道谁进来了。问题是，你可能不要这个协议啊！所以，那就关闭他吧！
[root@study ~]# systemctl stop avahi-daemon.service
[root@study ~]# systemctl stop avahi-daemon.socket
[root@study ~]# systemctl disable avahi-daemon.service avahi-daemon.socket
[root@study ~]# netstat -tlunp
## 一般来说，你的本地服务器至少需要 25 号埠口，而 22 号埠口则最好加上防火墙来管理远程联机登入比较妥当～






####### systemctl 针对 service 类型的配置文件

## systemctl 配置文件相关目录简介
##  现在我们知道服务的管理是透过 systemd，而 systemd 的配置文件大部分放置于 /usr/lib/systemd/system/ 目录内。
##  但是 Red Hat 官方文件指出， 该目录的档案主要是原本软件所提供的设定，建议不要修改！
##  而要修改的位置应该放置于 /etc/systemd/system/ 目录内。
##  举例来说，如果你想要额外修改 vsftpd.service 的话， 他们建议要放置到哪些地方呢？
/usr/lib/systemd/system/vsftpd.service：          官方释出的预设配置文件；
/etc/systemd/system/vsftpd.service.d/custom.conf：在 /etc/systemd/system 底下建立与配置文件相同文件名的目录，但是要加上 .d 的扩展名。
                                                  然后在该目录下建立配置文件即可。另外，配置文件最好附档名取名为 .conf 较佳！
                                                  在这个目录下的档案会『累加其他设定』进入 /usr/lib/systemd/system/vsftpd.service 内喔！
/etc/systemd/system/vsftpd.service.wants/*：      此目录内的档案为链接档，设定相依服务的连结。意思是启动了 vsftpd.service 之后，最好再加上这目录底下建议的服务。
/etc/systemd/system/vsftpd.service.requires/*：   此目录内的档案为链接档，设定相依服务的连结。意思是在启动 vsftpd.service 之前，需要事先启动哪些服务的意思。




## systemctl 配置文件的设定项目简介  #todo
## https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files
[root@study ~]# cat /usr/lib/systemd/system/sshd.service
[root@localhost ~]# cat /usr/lib/systemd/system/sshd.service
[Unit]
Description=OpenSSH server daemon
After=network.target sshd-keygen.service
Wants=sshd-keygen.service

[Service]
EnvironmentFile=/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target


##  两个 vsftpd 运作的实例 (此实例没有在此追加，查看鸟哥的linux私房菜第四版)

[root@study system]# systemctl daemon-reload    #重载 systemd 的脚本配置文件内容

## https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files

## 9.6.5. Working with Instantiated Units
## It is possible to instantiate multiple units from a single template
## configuration file at runtime. The "@" character is used to mark the template
## and to associate units with it. Instantiated units can be started from another
## unit file (using Requires or Wants options), or with the systemctl start
## command. Instantiated service units are named the following way:
###     template_name@instance_name.service

## Where template_name stands for the name of the template configuration file.
## Replace instance_name with the name for the unit instance. Several instances
## can point to the same template file with configuration options common for all
## instances of the unit. Template unit name has the form of:
###     unit_name@.service
## For example, the following Wants setting in a unit file:
###     Wants=getty@ttyA.service,getty@ttyB.service

## first makes systemd search for given service units. If no such units are found,
## the part between "@" and the type suffix is ignored and systemd searches for
## the getty@.service file, reads the configuration from it, and starts the
## services.

## Wildcard characters, called unit specifiers, can be used in any unit
## configuration file. Unit specifiers substitute certain unit parameters and are
## interpreted at runtime. Table 9.14, “Important Unit Specifiers” lists unit
## specifiers that are particularly useful for template units.
man 5 systemd.unit  #/Table 2. Specifiers available in unit files


systemctl show nfs-server.service -p Names    # To find all aliases that can be used for a particular unit,



## -----------------------CentOS7----------------------------------


```
##  [Available systemd Unit Types](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-Managing_Services_with_systemd#tabl-Managing_Services_with_systemd-Introduction-Units-Locations)   `man systemd`

Unit Type                  |  File Extension  |  Description
---------------------------|------------------|-----------------------
Service unit               |  .service        | A system service.
Target unit                |  .target         | A group of systemd units.
Automount unit             |  .automount      | A file system automount point.
Device unit                |  .device         | A device file recognized by the kernel.
Mount unit                 |  .mount          | A file system mount point.
Path unit                  |  .path           | A file or directory in a file system.
Scope unit                 |  .scope          | An externally created process.
Slice unit                 |  .slice          | A group of hierarchically organized units that manage system processes.
Snapshot unit              |  .snapshot       | A saved state of the systemd manager.
Socket unit                |  .socket         | An inter-process communication socket.
Swap unit                  |  .swap           | A swap device or a swap file.
Timer unit                 |  .timer          | A systemd timer.

## Systemd Unit Files Locations
Directory                | Description
-------------------------| ---------------------------------------
/usr/lib/systemd/system/ | Systemd unit files distributed with installed RPM packages. 每个服务最主要的启动脚本设定，有点类似以前的 /etc/init.d 底下的档案
/run/systemd/system/     | Systemd unit files created at run time. This directory takes precedence over the directory with installed service unit files. 系统执行过程中所产生的服务脚本，这些脚本的优先序要比 /usr/lib/systemd/system/ 高！
/etc/systemd/system/     | Systemd unit files created by systemctl enable as well as unit files added for extending a service. This directory takes precedence over the directory with runtime unit files. 管理员依据主机系统的需求所建立的执行脚本，其实这个目录有点像以前 /etc/rc.d/rc5.d/Sxx 之类的功能！执行优先序又比 /run/systemd/system/ 高喔！

```sh
## 也就是说，到底系统开机会不会执行某些服务其实是看 /etc/systemd/system/ 底下的设定，所以该目录底下就是一大堆连结档。
## 而实际执行的 systemd 启动脚本配置文件， 其实都是放置在 /usr/lib/systemd/system/ 底下的喔！因此如果你想要修改某个服务启动的设定，
## 应该要去 /usr/lib/systemd/system/ 底下修改才对！ /etc/systemd/system/ 仅是连结到正确的执行脚本配置文件而已。所以想要看执行脚本设定，
## 应该就得要到 /usr/lib/systemd/system/ 底下去查阅才对！

```

## [Comparison of the service Utility with systemctl](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-services)
service                    | systemctl                                    | Description
---------------------------|----------------------------------------------|----------------------------------------
service name start         | systemctl start name.service                 | Starts a service.
service name stop          | systemctl stop name.service                  | Stops a service.
service name restart       | systemctl restart name.service               | Restarts a service.
service name condrestart   | systemctl try-restart name.service           | Restarts a service only if it is running.
service name reload        | systemctl reload name.service                | Reloads configuration.
service name status        | systemctl status name.service   <br />     systemctl is-active name.service       | Checks if a service is running.
service --status-all       | systemctl list-units --type service --all    | Displays the status of all services.


## [Comparison of the chkconfig Utility with systemctl](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-services)
chkconfig                  | systemctl                                    | Description
---------------------------|----------------------------------------------|----------------------------------------
chkconfig name on          | systemctl enable name.service                | Enables a service.
chkconfig name off         | systemctl disable name.service               | Disables a service.
chkconfig --list name      | systemctl status name.service          <br /> systemctl is-enabled name.service          | Checks if a service is enabled.
chkconfig --list           | systemctl list-unit-files --type service     | Lists all services and checks if they are enabled.
chkconfig --list           | systemctl list-dependencies --after          | Lists services that are ordered to start before the specified unit.
chkconfig --list           | systemctl list-dependencies --before         | Lists services that are ordered to start after the specified unit.



```sh

[root@localhost ~]# systemctl --type help
[root@localhost ~]# systemctl list-units  --state failed
[root@localhost ~]# systemctl reload httpd.service   #this will reload Apache's httpd.conf in the web server, not the apache.service systemd unit file.
[root@localhost ~]# systemctl daemon-reload          #Reload systemd manager configuration. This will rerun all generators (see systemd.generator(7)), reload all unit files,
                                                     #and recreate the entire dependency tree. While the daemon is being reloaded, all sockets systemd listens
                                                     #on behalf of user configuration will stay accessible.

[root@localhost ~]# systemctl show
UnitPath=/etc/systemd/system /run/systemd/system /run/systemd/generator /usr/local/lib/systemd/system /usr/lib/systemd/system /run/systemd/generator.late
[root@localhost ~]# systemctl list-unit-files  | grep getty
[root@localhost ~]# find $(systemctl show | grep 'UnitPath='  | cut -d '=' -f 2)  -name getty.target


man 7 glob



```




```sh

man rpm

rpm -ivh /mnt/Packages/rp-pppoe-3.11-5.el7.x86_64.rpm
rpm -Uvh /mnt/Packages/rp-pppoe-3.11-5.el7.x86_64.rpm
rpm -Fvh /mnt/Packages/rp-pppoe-3.11-5.el7.x86_64.rpm

rpm -ivh /mnt/Packages/rp-pppoe-3.11-5.el7.x86_64.rpm  --test  #--test Do not install the package, simply check for and report potential conflicts.  #使用时机： 想要测试一下该软件是否可以被安装到使用者的 Linux 环境当中，可找出是否有属性相依的问题
rpm -ivh /mnt/Packages/rp-pppoe-3.11-5.el7.x86_64.rpm  --justdb  #--justdb  #Update only the database, not the filesystem.  #使用时机： 由于 RPM 数据库破损或者是某些缘故产生错误时，可使用这个选项来更新软件在数据库内的相关信息。


## [root@study ~]# rpm -qa <==已安装软件  #-a, --all  #Query all installed packages.
## [root@study ~]# rpm -q[licdR] 已安装的软件名称 <==已安装软件
## [root@study ~]# rpm -qf 存在于系统上面的某个文件名 <==已安装软件
## [root@study ~]# rpm -qp[licdR] 未安装的某个文件名 <==查阅RPM档案

rpm -q logrotate     #找出你的 Linux 是否有安装 logrotate 这个软件？
rpm -ql logrotate    #列出上题当中，属于该软件所提供的所有目录与档案  #-l, --list   #List files in package.
rpm -qi logrotate    #列出 logrotate 这个软件的相关说明数据：   #-i, --info  #Display package information, including name, version, and description.  This uses the --queryformat if one was specified.
rpm -qc logrotate    #找出 logrotate 的配置文件  #-c, --configfiles  #List only configuration files (implies -l).
rpm -qd logrotate    #找出 logrotate 的说明档    #-d, --docfiles     #List only documentation files (implies -l).
rpm -qR logrotate    #若要成功安装 logrotate ，他还需要什么档案的帮忙？  #-R, --requires   #List capabilities on which this package depends.
rpm -qf /bin/sh      #找出 /bin/sh 是那个软件提供的？      #-f, --file FILE    #Query package owning FILE.
rpm -qpR filename.i386.rpm   #假设我有下载一个 RPM 档案，想要知道该档案的需求档案  #-p, --package PACKAGE_FILE

## -p, --package PACKAGE_FILE
##     Query an (uninstalled) package PACKAGE_FILE.  The PACKAGE_FILE may be specified as an ftp or http style URL, in which case the package header will be downloaded and queried.  See
##     FTP/HTTP  OPTIONS  for  information  on rpm's internal ftp and http client support. The PACKAGE_FILE argument(s), if not a binary package, will be interpreted as an ASCII package
##     manifest unless --nomanifest option is used.  In manifests, comments are permitted, starting with a '#', and each line of a package manifest file may include  white  space
##     separated glob expressions, including URL's, that will be expanded to paths that are substituted in place of the package manifest as additional PACKAGE_FILE arguments to the query.


## [root@study ~]# rpm -Va
## [root@study ~]# rpm -V 已安装的软件名称
## [root@study ~]# rpm -Vp 某个 RPM 档案的档名
## [root@study ~]# rpm -Vf 在系统上面的某个档案

rpm -V logrotate      #列出你的 Linux 内的 logrotate 这个软件是否被更动过？
rpm -Vf /etc/crontab  #查询一下，你的 /etc/crontab 是否有被更动过？

## CentOS 使用的数字签名系统为 GNU 计划的 GnuPG (GNU Privacy Guard, GPG)  #https://www.gnupg.org/
## [root@study ~]# ll /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
## [root@study ~]# cat /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7    #该数字签名码其实仅是一个随机数而已(公钥)
## [root@study ~]# rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

## 由于不同版本 GPG 密钥档案放置的位置可能不同，不过档名大多是以 GPG-KEY 来说明的，
## 因此你可以简单的使用 locate 或 find 来找寻，如以下的方式来搜寻即可：
[root@study ~]# locate GPG-KEY
[root@study ~]# find /etc -name '*GPG-KEY*'

## 那安装完成之后，这个密钥的内容会以什么方式呈现呢？基本上都是使用 pubkey 作为软件的名称的！
## 那我们先列出密钥软件名称后，再以 -qi 的方式来查询看看该软件的信息为何：
[root@study ~]# rpm -qa | grep pubkey
[root@study ~]# rpm -qi gpg-pubkey-f4a80eb5-53a7ff4b

## 解安装的过程一定要由最上层往下解除(类似"压栈和出栈")

# 找出与 pam 有关的软件名称，并尝试移除 pam 这个软件：
[root@study ~]# rpm -qa | grep pam
[root@study ~]# rpm -e pam

## 由于 RPM 档案常常会安装/移除/升级等，某些动作或许可能会导致 RPM 数据库 /var/lib/rpm/ 内的档案破损。
## 果真如此的话，那你该如何是好？别担心，我们可以使用 --rebuilddb 这个选项来重建一下数据库喔！ 作法如下：
[root@study ~]# rpm --rebuilddb #重建数据库

rpm -q --whatrequires glibc-common    #查询依赖于已安装的'glibc-common'软件包的所有RPM包  #--whatrequires CAPABILITY  #Query all packages that require CAPABILITY for proper functioning.
rpm -q  --whatprovides  vi            #--whatprovides CAPABILITY  #Query all packages that provide the CAPABILITY capability.

rpm -q --scripts  glibc-common     #--scripts      #List the package specific scriptlet(s) that are used as part of the installation and uninstallation processes.
rpm -q --conflicts glibc-common    #--conflicts    #List capabilities this package conflicts with.
rpm -q --obsoletes glibc-common    #--obsoletes    #List packages this package obsoletes.
rpm -q --changelog glibc-common    #--changelog    #Display change information for the package.


##   Database
##       /var/lib/rpm/Basenames
##       /var/lib/rpm/Conflictname
##       /var/lib/rpm/Dirnames
##       /var/lib/rpm/Group
##       /var/lib/rpm/Installtid
##       /var/lib/rpm/Name
##       /var/lib/rpm/Obsoletename
##       /var/lib/rpm/Packages
##       /var/lib/rpm/Providename
##       /var/lib/rpm/Requirename
##       /var/lib/rpm/Sha1header
##       /var/lib/rpm/Sigmd5
##       /var/lib/rpm/Triggername

```

```sh

##    yum - Yellowdog Updater Modified
##
## SYNOPSIS
##    yum [options] [command] [package ...]
##
## DESCRIPTION
##    yum  is an interactive, rpm based, package manager. It can automatically perform system updates, including dependency analysis and obsolete processing based on "repository" metadata. It
##    can also perform installation of new packages, removal of old packages and perform queries on the installed and/or available packages among many other commands/services (see below). yum
##    is similar to other high level package managers like apt-get and smart.

## GENERAL OPTIONS
##    -y, --assumeyes
##           Assume yes; assume that the answer to any question which would be asked is yes.
##           Configuration Option: assumeyes
##
##    -C, --cacheonly
##           Tells yum to run entirely from system cache - does not download or update any headers unless it has to to perform the requested action.
##
##    --enablerepo=repoidglob
##           Enables specific repositories by id or glob that have been disabled in the configuration file using the enabled=0 option.
##           Configuration Option: enabled
##
##    --disablerepo=repoidglob
##           Disables specific repositories by id or glob.
##           Configuration Option: enabled
##
##    --installroot=root
##           Specifies an alternative installroot, relative to which all packages will be installed. Think of this like doing "chroot <root> yum" except using --installroot allows yum to work
##           before  the  chroot is created.  Note: You may also want to use the option --releasever=/ when creating the installroot as otherwise the $releasever value is taken from the rpmdb
##           within the installroot (and thus. will be empty, before creation).
##           Configuration Option: installroot


##    search This  is  used to find packages when you know something about the package but aren't sure of it's name. By default search will try searching just package names and summaries, but
##            if that "fails" it will then try descriptions and url.
##
##            Yum search orders the results so that those packages matching more terms will appear first.
##
##            You can force searching everything by specifying "all" as the first argument.


man yum   #/examples

yum check-update            #检查可更新的所有软件包
yum update                  #下载更新系统已安装的所有软件包  #If run without any packages, update will update every currently installed package.
yum upgrade                 #大规模的版本升级，与yum update不同的是，连旧的被淘汰的包也升级. # this makes it better for distro-version changes, for example: upgrading from somelinux 8.0 to somelinux 9.
yum install package1 [package2] [...]     #安装新软件包
yum update [package1] [package2] [...]        #更新指定的软件包
yum remove | erase package1 [package2] [...]  #移除指定的软件包

yum clean [ packages | metadata | expire-cache | rpmdb | plugins | all ]   #Is used to clean up various things which accumulate in the yum cache directory over time.  More complete details can be found in the Clean Options section below.
yum makecache [fast]   #Is used to download and make usable all the metadata for the currently enabled yum repos. If the argument "fast" is passed, then we just try to make sure the repos.  are  current (much like "yum clean expire-cache").

yum search vim
yum search all vim

yum deplist package1 [package2] [...]   #Produces  a  list  of all dependencies and what packages provide those dependencies for the given packages. As of 3.2.30 it now just shows the latest version of each package that matches (this can be changed by using --showduplicates) and it only shows the newest providers (which can be changed by using --verbose).

yum provides feature1 [feature2] [...]  #Is used to find out which package provides some feature or file. Just use a specific name or a file-glob-syntax wildcards to list the packages available or installed that provide that feature or file.

yum install rpmfile1 [rpmfile2] [...]         # Is  used to install a set of local rpm files. If required the enabled repositories will be used to resolve dependencies.
yum update  rpmfile1 [rpmfile2] [...]         # Is used to update the system by specifying local rpm files. Only the specified rpm files of which an older version is already installed will be installed, the remaining specified packages  will  be  ignored.  If required the enabled repositories will be used to resolve dependencies. 

yum group install  "Development Tools"
yum group update   "Development Tools"
yum group remove   "Development Tools"
yum group list                             #"group list" is used to list the available groups from all yum repos.
yum group info     "Development Tools"     #"group info" is used to give the description and package list of a group (and which type those packages are marked as).

yum repolist [all|enabled|disabled]        #Produces a list of configured repositories. The default is to list all enabled repositories.


##     yum list [all | glob_exp1] [glob_exp2] [...]
##            List all available and installed packages.
##
##     yum list available [glob_exp1] [...]
##            List all packages in the yum repositories available to be installed.
##
##     yum list updates [glob_exp1] [...]
##            List all packages with updates available in the yum repositories.
##
##     yum list installed [glob_exp1] [...]
##            List the packages specified by args.  If an argument does not match the name of an available package, it is assumed to be a shell-style glob and any matches are printed.
##
##     yum list extras [glob_exp1] [...]
##            List the packages installed on the system that are not available in any yum repository listed in the config file.
##
##     yum list distro-extras [glob_exp1] [...]
##            List the packages installed on the system that are not available, by name, in any yum repository listed in the config file.
##
##     yum list obsoletes [glob_exp1] [...]
##            List the packages installed on the system that are obsoleted by packages in any yum repository listed in the config file.
##
##     yum list recent
##            List packages recently added into the repositories. This is often not helpful, but what you may really want to use is "yum list-updateinfo new" from the security yum plugin.

##CLEAN OPTIONS
##    The  following are the ways which you can invoke yum in clean mode. Note that "all files" in the commands below means "all files in currently enabled repositories".  If you want to also
##    clean any (temporarily) disabled repositories you need to use --enablerepo='*' option.
##
##    yum clean expire-cache
##           Eliminate the local data saying when the metadata and mirrorlists were downloaded for each repo. This means yum will revalidate the cache for each repo. next  time  it  is  used.
##           However if the cache is still valid, nothing significant was deleted.
##
##    yum clean packages
##           Eliminate any cached packages from the system.  Note that packages are not automatically deleted after they are downloaded.
##
##    yum clean headers
##           Eliminate all of the header files, which old versions of yum used for dependency resolution.
##
##    yum clean metadata
##           Eliminate all of the files which yum uses to determine the remote availability of packages. Using this option will force yum to download all the metadata the next time it is run.
##
##    yum clean dbcache
##           Eliminate  the  sqlite cache used for faster access to metadata.  Using this option will force yum to download the sqlite metadata the next time it is run, or recreate the sqlite
##           metadata if using an older repo.
##
##    yum clean rpmdb
##           Eliminate any cached data from the local rpmdb.
##
##    yum clean plugins
##           Tell any enabled plugins to eliminate their cached data.
##
##    yum clean all
##           Does all of the above.



FILES
       /etc/yum.conf
       /etc/yum/version-groups.conf
       /etc/yum.repos.d/
       /etc/yum/pluginconf.d/
       /var/cache/yum/


## YUM的主配置文件 /etc/yum.conf ,存放了YUM的基本配置参数
## 在主配置文件中可以设置yum命令使用的代理服务器，例如
[root@localhost ~]# vim /etc/yum.conf   #man yum.conf
##设置代理服务器及其端口号
proxy=http://mycache.mydomain.com:3128
##设置用于yum连接的代理服务器的账户细节
proxy_username=your-yum-user
proxy_password=your-yum-password


## 有关CentOS附加仓库和第三方仓库的详细信息  https://wiki.centos.org/AdditionalResources/Repositories
## About 'enabled' and 'disabled' repository configuration files
##
## Please read man 5 yum.conf, particularly the discussion of enabled=0 versus enabled=1 . A line containing one of these options is recommended for each repository in each .conf file in the
## /etc/yum.repos.d/  directory. This allows the administrator to more clearly specify whether a repository is or is not used for packages. After any edits of these files, in order to clear
##  any cached information, and to make sure the changes are immediately recognized, as root run:
##
##  yum clean all

##仓库配置文件 /etc/yum.repos.d/*.repo
## YUM使用仓库配置文件（文件名以.repo结尾文件）配置仓库的镜像站点地址等配置信息。
## 默认情况下，CentOS在/etc/yum.repos.d/目录下包含6个配置文件。
## 主要的仓库配置文件为CentOS-Base.repo,其余配置文件中的仓库默认均为启用。


## 仓库的启用和禁用
man yum-config-manager
## yum-config-manager - manage yum configuration options and yum repositories
yum-config-manager --enable centosplus  #启用centosplus仓库 #--enable  #Enable the specified repos (automatically saves). To enable all repositories run 'yum-config-manager --enable \*".
yum-config-manager --disable centosplus #禁用centosplus仓库 #--disable #Disable the specified repos (automatically saves). To disable all repositories run "yum-config-manager --disable \*"

## sclo仓库提供了软件的不同版本
## The Software Collections ( SCL ) Repository   https://wiki.centos.org/AdditionalResources/Repositories/SCL
## In order to gain access to SCLs for CentOS, you need to install the CentOS Linux Software Collections release file.
## It is part of the CentOS Extras repository (x86_64 only) and can be installed with this command:
yum install centos-release-scl

## The available collections are mostly tracked   https://wiki.centos.org/SpecialInterestGroup/SCLo/CollectionsList

```

## [SELINUX](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/index)
```sh
####### SELINUX ARCHITECTURE--------------------------------------------
##   SELinux is a Linux security module that is built into the Linux kernel. SELinux
##   is driven by loadable policy rules. When security-relevant access is taking
##   place, such as when a process attempts to open a file, the operation is
##   intercepted in the kernel by SELinux. If an SELinux policy rule allows the
##   operation, it continues, otherwise, the operation is blocked and the process
##   receives an error.
##
##
##   SELinux decisions, such as allowing or disallowing access, are cached. This
##   cache is known as the Access Vector Cache (AVC). When using these cached
##   decisions, SELinux policy rules need to be checked less, which increases
##   performance. Remember that SELinux policy rules have no effect if DAC rules
##   deny access first.


##### SELINUX STATES AND MODES--------------------------------------------
## setenforce - modify the mode SELinux is running in ( Changes made with setenforce do not persist across reboots.)
## setenforce [Enforcing|Permissive|1|0]

## You must reboot and possibly relabel if you change the policy type to have it take effect on the system.
## The corresponding policy configuration for each such policy must be installed in the /etc/selinux/{SELINUXTYPE}/ directories.

man 8 selinux   #/etc/selinux/config  #default: SELINUX=enforcing  SELINUXTYPE=targeted
## 如果改变了政策则需要重新启动；如果由 enforcing 或 permissive 改成 disabled ，
## 或由 disabled 改成其他两个，那也必须要重新启动。这是因为 SELinux 是整合到核心里面去的，
## 你只可以在 SELinux 运作下切换成为强制 (enforcing) 或宽容 (permissive) 模式，不能够直接关闭 SELinux 的！

##       Every confined service on the system has a man page in the following format:
##       <servicename>_selinux(8)
##       For example, httpd has the httpd_selinux(8) man page.


man setenforce
man -k selinux  #Will list all SELinux man pages.


## targeted：针对网络服务限制较多，针对本机限制较少，是预设的政策；

[root@localhost ~]# getenforce
[root@localhost ~]# setenforce 1    #Use Enforcing or 1 to put SELinux in enforcing mode.
[root@localhost ~]# setenforce 0    #Use Permissive or 0 to put SELinux in permissive mode.

[root@localhost ~]# ls -Z    #-Z, --context  #Display security context so it fits on most displays.  Displays only mode, user, group, security context and file name.
-rw-------. root root system_u:object_r:admin_home_t:s0 anaconda-ks.cfg

## role
## object_r：代表的是档案或目录等档案资源，这应该是最常见的啰；
## system_r：代表的就是程序啦！不过，一般使用者也会被指定成为 system_r 喔！

## 类型 (Type) (最重要！)：
## 在预设的 targeted 政策中， Identify 与 Role 字段基本上是不重要的！重要的在于这个类型 (type) 字段！
## 基本上，一个主体程序能不能读取到这个档案资源，与类型字段有关！而类型字段在档案与程序的定义不太相同，分别是：
##   - type：在档案资源 (Object) 上面称为类型 (Type)；
##   - domain：在主体程序 (Subject) 则称为领域 (domain) 了！
## domain 需要与 type 搭配，则该程序才能够顺利的读取档案资源啦！

##     To get security info:
##        ps -eo euser,ruser,suser,fuser,f,comm,label
##        ps axZ
##        ps -eM
##
##        ps -eZ  #same as `ps -eM`

## 那如何观察有没有受限 (confined )呢？ 很简单啊！就透过 ps -eZ 去撷取
[root@study ~]# ps -eZ | grep -E 'cron|bash'
system_u:system_r:crond_t:s0-s0:c0.c1023 863 ?  00:00:00 crond                  #在目前 target 这个政策底下，只有第三个类型 (type) 字段会有影响,我们可以看到， crond 确实是有受限的主体程序
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 2244 tty1 00:00:00 bash   #unconfined_t #bash 因为是本机程序，因此就是不受限 (unconfined_t) 的类型

##   sestatus - SELinux status tool
##   sestatus [-v] [-b]
##   This tool is used to get the status of a system running SELinux.

[root@localhost ~]# sestatus
[root@localhost ~]# sestatus -v   #-v   #Displays the contexts of files and processes listed in the /etc/sestatus.conf file. It also checks whether the file is a symbolic link, if so then the context of the target  file is also shown.
[root@localhost ~]# sestatus -b   #-b   #Display the current state of booleans.

## getsebool - get SELinux boolean value(s)
[root@localhost ~]# getsebool -a   #-a     Show all SELinux booleans.

[root@localhost ~]# yum install setools-console


##    seinfo - SELinux policy query tool
##      seinfo [OPTIONS] [EXPRESSION] [POLICY ...]
## DESCRIPTION
##        seinfo allows the user to query the components of a SELinux policy.

man seinfo
[root@localhost ~]# seinfo    #If no expressions are provided, policy statistics will be printed (see --stats below) #same as `seinfo --stats`
[root@localhost ~]# seinfo --all  #--all  Print all components.
[root@localhost ~]# seinfo -u   #-u[NAME], --user[=NAME]  #Print a list of users or, if NAME is provided, print the user NAME.  With -x, print a list of roles assigned to each displayed user.
[root@localhost ~]# seinfo -r   #-r[NAME], --role[=NAME]  #Print a list of roles or, if NAME is provided, print the role NAME.  With -x, print a list of types assigned to each displayed role.
[root@localhost ~]# seinfo -t   #-r[NAME], --role[=NAME]  #Print a list of roles or, if NAME is provided, print the role NAME.  With -x, print a list of types assigned to each displayed role.
[root@localhost ~]# seinfo -b   #-b[NAME], --bool[=NAME]  #Print a list of conditional booleans or, if NAME is provided, print the boolean NAME.  With -x, print the default state of each displayed conditional boolean.

##       sesearch - SELinux policy query tool
##
##SYNOPSIS
##       sesearch [OPTIONS] RULE_TYPE [RULE_TYPE ...] [EXPRESSION] [POLICY ...]
##
##DESCRIPTION
##       sesearch allows the user to search the rules in a SELinux policy.
##
##RULE TYPE OPTIONS
##       sesearch is capable of searching multiple types of rules. At least one of the following must be provided to specify the desired type(s) of rules to search.
##
##       -A, --allow
##              Search for allow rules.
##
##EXPRESSIONS
##       -s NAME, --source=NAME
##              Find rules with type/attribute NAME as their source.
##
##       -t NAME, --target=NAME
##              Find rules with type/attribute NAME as their target.
##       -b NAME, --bool=NAME
##              Find conditional rules with NAME in their conditional expression.  This option will include rules in both the true and false lists of the conditional.

man sesearch
[root@localhost ~]# sesearch -A -s crond_t | grep spool
[root@localhost ~]# sesearch -A -t user_cron_spool_t | grep crond
[root@localhost ~]# sesearch -A -b fcron_crond




##       semanage - SELinux Policy Management tool
##
##SYNOPSIS
##       semanage {import,export,login,user,port,interface,module,node,fcontext,boolean,permissive,dontaudit}
##                       ...  positional arguments:

man semanage
man semanage-boolean

[root@localhost ~]# semanage boolean -l | grep httpd_enable_homedirs
SELinux boolean                State  Default Description
httpd_enable_homedirs          (off  ,  off)  Allow httpd to enable homedirs

[root@localhost ~]# sesearch -A -b httpd_enable_homedirs

##       setsebool - set SELinux boolean value
##
##SYNOPSIS
##       setsebool [ -PNV ] boolean value | bool1=val1 bool2=val2 ...
##
##DESCRIPTION
##       setsebool  sets the current state of a particular SELinux boolean or a list of booleans to a given value. The value may be 1 or true or on to enable the boolean, or 0 or false or off to disable it.
##
##       Without the -P option, only the current boolean value is affected; the boot-time default settings are not changed.
##
##       If the -P option is given, all pending values are written to the policy file on disk. So they will be persistent across reboots.
##
##       If the -N option is given, the policy on disk is not reloaded into the kernel.
##
##       If the -V option is given, verbose error messages will be printed from semanage libraries.

[root@localhost ~]# setsebool -P httpd_enable_homedirs 1   #-P选项会导致修改被持久化到配置文件中
[root@localhost ~]# getsebool  httpd_enable_homedirs
[root@localhost ~]# setsebool -P httpd_enable_homedirs 0
[root@localhost ~]# getsebool  httpd_enable_homedirs

##现在我们知道 SELinux 对受限的主体程序有没有影响，
##    第一关考虑 SELinux 的三种类型，
##    第二关考虑 SELinux 的政策规则是否放行，
##    第三关则是开始比对 SELinux type 啦！

## 使用 chcon 手动修改档案的 SELinux type
## chcon - change file SELinux security context
##SYNOPSIS
##       chcon [OPTION]... CONTEXT FILE...
##       chcon [OPTION]... [-u USER] [-r ROLE] [-l RANGE] [-t TYPE] FILE...
##
##DESCRIPTION
##       Change the SELinux security context of each FILE to CONTEXT.  With --reference, change the security context of each FILE to that of RFILE.
##

[root@study ~]# ls -Z /etc/hosts
[root@study ~]# chcon -v -t net_conf_t /etc/cron.d/checktime
[root@study ~]# ls -Z /etc/cron.d/checktime
[root@study ~]# chcon -v --reference=/etc/shadow /etc/cron.d/checktime     #类比chown,chgrp,chmod的--reference选项
[root@study ~]# ls -Z /etc/shadow /etc/cron.d/checktime

## 使用 restorecon 让档案恢复正确的 SELinux type
##       restorecon - restore file(s) default SELinux security contexts.
##
##SYNOPSIS
##     restorecon [-R] [-n] [-p] [-v] [-e directory] pathname...
##
##     restorecon -f infilename [-e directory] [-R] [-n] [-p] [-v] [-F]
##
##     This program is primarily used to set the security context (extended attributes) on one or more files.
##
##     It  can  also be run at any other time to correct inconsistent labels, to add support for newly-installed policy or, by using the -n option, to passively check whether the file contexts
##     are all set as specified by the active policy (default behavior).
##
##     If a file object does not have a context, restorecon will write the default context to the file object's extended attributes. If a file object has a context, restorecon will only modify
##     the type portion of the security context.  The -F option will force a replacement of the entire context.
##
##     It is the same executable as setfiles but operates in a slightly different manner depending on its argv[0].
##
##OPTIONS
##       -R, -r change files and directories file labels recursively (descend directories).
##              Note: restorecon reports warnings on paths without default labels only if called non-recursively or in verbose mode.



[root@study ~]# restorecon -Rv /etc/cron.d

## semanage 默认目录的安全性本文查询与修改

## 为什么 restorecon 可以『恢复』原本的 SELinux type 呢？那肯定就是有个地方在纪录每个档案/目录的 SELinux 默认类型啰？
## 没错！是这样～那要如何 (1)查询预设的 SELinux type 以及 (2)如何增加/修改/删除预设的 SELinux type 呢？
## 很简单～透过 semanage 即可！他是这样使用的：

##       semanage-fcontext - SELinux Policy Management file context tool
##
##SYNOPSIS
##     semanage fcontext [-h] [-n] [-N] [-S STORE] [ --add ( -t TYPE -f FTYPE -r RANGE -s SEUSER | -e EQUAL ) FILE_SPEC ) | --delete ( -t TYPE -f FTYPE | -e EQUAL ) FILE_SPEC ) | --deleteall |
##     --extract | --list [-C] | --modify ( -t TYPE -f FTYPE -r RANGE -s SEUSER | -e EQUAL ) FILE_SPEC ) ]
##
##DESCRIPTION
##     semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.   semanage  fcontext  is  used  to   manage  the
##     default file system labeling on an SELinux system.  This command maps file paths using regular expressions to SELinux labels.
##
##OPTIONS
##       -l, --list
##              List records of the specified object type
##       -a, --add
##              Add a record of the specified object type
##       -d, --delete
##              Delete a record of the specified object type
##       -m, --modify
##              Modify a record of the specified object type

[root@study ~]# semanage fcontext -l | grep -E '^/etc |^/etc/cron'    #查询一下 /etc /etc/cron.d 的预设 SELinux type 为何


## -----demo start>---49fdce05-5e62-414f-a61c-09bdf27ff47f---------------------------

## https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/sect-security-enhanced_linux-working_with_selinux-selinux_contexts_labeling_files#sect-Security-Enhanced_Linux-SELinux_Contexts_Labeling_Files-Persistent_Changes_semanage_fcontext
[root@study ~]# mkdir /srv/mycron
[root@study ~]# cp /etc/cron.d/checktime /srv/mycron
[root@study ~]# ls -dZ /srv/mycron /srv/mycron/checktime
[root@study ~]# semanage fcontext -l | grep '^/srv'
[root@study ~]# semanage fcontext -a -t system_cron_spool_t "/srv/mycron(/.*)?"  #use quotation marks around the regular expression: #将 mycron及其下的内容默认值改为 system_cron_spool_t 啰！
[root@study ~]# semanage fcontext -l | grep '^/srv/mycron'

[root@localhost ~]# cat /etc/selinux/targeted/contexts/files/file_contexts.local   #该文件中的entry会被命令'semanage fcontext -a -t system_cron_spool_t "/srv/mycron(/.*)?"'修改

[root@study ~]# restorecon -Rv /srv/mycron
[root@study ~]# ls -dZ /srv/mycron /srv/mycron/*

[root@localhost ~]# semanage fcontext -d "/srv/mycron(/.*)?"
[root@localhost ~]# semanage fcontext -l | grep '^/srv/mycron'
[root@localhost ~]# cat /etc/selinux/targeted/contexts/files/file_contexts.local

## -----demo end<---49fdce05-5e62-414f-a61c-09bdf27ff47f---------------------------


######一个网络服务案例及登录文件协助
## setroubleshoot --> 错误讯息写入 /var/log/messages
troubleshoot 大家都知道是错误克服，因此这个 setroubleshoot
自然就得要启动他啦！这个服务会将关于 SELinux 的错误讯息与克服方法记录到
/var/log/messages 与 /var/log/setroubleshoot/* 里头，所以你一定得要启动这个服务才好
这玩意儿总共需要两个软件，分别是 setroublshoot 与 setroubleshoot-server

原本的 SELinux 信息本来是以两个服务来记录的，分别是 auditd
与 setroubleshootd。既然是同样的信息，因此 CentOS 6.x (含 7.x) 以后将两者整合在
auditd 当中啦！所以，并没有 setroubleshootd 的服务存在了喔！因此，当你安装好了
setroubleshoot-server 之后，请记得要重新启动 auditd，否则 setroubleshootd
的功能不会被启动的。

CentOS 7.x 对 setroubleshootd 的运作方式是：
  1. 先由 auditd 去呼叫 audispd 服务
  2. 然后 audispd 服务去启动 sedispatch 程序
  3. sedispatch 再将原本的 auditd 讯息转成 setroubleshootd 的讯息，进一步储存下来的

[root@localhost ~]# yum install setroubleshoot setroubleshoot-server     #再说一遍，安装完毕最好重新启动 auditd 这个服务喔！
[root@localhost ~]# systemctl list-units  | grep auditd
  auditd.service                                                                      loaded active running   Security Auditing Service

## 在实际试验中，使用`systemctl restart auditd.service`会报依赖相关的错误并失败，但是通过service命令却可以成功stop和restart该auditd服务
[root@localhost ~]# service auditd restart      #https://stackoverflow.com/questions/41053331/ansible-how-to-restart-auditd-service-on-centos-7-get-error-about-dependency

[root@localhost ~]# useradd -s /sbin/nologin ftptest
[root@localhost ~]# echo "myftp123" | passwd --stdin ftptest
[root@localhost ~]# yum install vsftpd
[root@localhost ~]# systemctl start vsftpd.service
[root@localhost ~]# systemctl enable vsftpd.service
[root@localhost ~]# netstat -tulnp

[root@localhost ~]# echo a.txt > a.txt
[root@localhost ~]# mkdir testdir01
[root@localhost ~]# echo b.txt > testdir01/b.txt
[root@localhost ~]# cp -a testdir01 a.txt /var/ftp/pub

[root@localhost ~]# curl ftp://localhost   #先看看 FTP 根目录底下有什么档案存在？
[root@localhost ~]# curl ftp://localhost/pub/ #再往下看看，能不能看到 pub 内的档案呢？#因为是目录，要加上 / 才好！
[root@localhost dir02]# curl ftp://localhost/pub/a.txt
[root@localhost dir02]# vim /var/log/messages
[root@study ~]# sealert -l 3a57aad3-a128-461b-966a-5bb2b0ffa0f9   #后续操作参考<鸟哥的linux私房菜(第4版)>



```

* [网络基础network basic](http://cn.linux.vbird.org/linux_server/0110network_basic_3.php)
```sh
## 以二进制说明 Network 第一个数字的定义：
## Class A : 0xxxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx  ==> NetI_D 的开头是 0
##           |--net--|---------host------------|
## Class B : 10xxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx  ==> NetI_D 的开头是 10
##           |------net-------|------host------|
## Class C : 110xxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx  ==> NetI_D 的开头是 110
##           |-----------net-----------|-host--|
## Class D : 1110xxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx  ==> NetI_D 的开头是 1110
## Class E : 1111xxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx  ==> NetI_D 的开头是 1111
##
## 五种分级在十进制的表示：
## Class A :   0.xx.xx.xx ~ 127.xx.xx.xx
## Class B : 128.xx.xx.xx ~ 191.xx.xx.xx
## Class C : 192.xx.xx.xx ~ 223.xx.xx.xx
## Class D : 224.xx.xx.xx ~ 239.xx.xx.xx
## Class E : 240.xx.xx.xx ~ 255.xx.xx.xx

## Public IP : 公共 IP ，经由 INTERNIC 所统一规划的 IP，有这种 IP 才可以连上 Internet ；
## Private IP : 私有 IP 或保留 IP，不能直接连上 Internet 的 IP ， 主要用于局域网络内的主机联机规划。
## 私有 IP 也分别在 A, B, C 三个 Class 当中各保留一段作为私有 IP 网段，那就是：
## Class A：10.0.0.0    - 10.255.255.255
## Class B：172.16.0.0  - 172.31.255.255
## Class C：192.168.0.0 - 192.168.255.255

## 特殊的 loopback IP 网段
## 这个网段在 127.0.0.0/8 这个 Class A，而且默认的主机 (localhost) 的 IP 是 127.0.0.1 呦！

## 在同一个网段里面，可以透过 IP 广播的方式来达到资料传递的目的。但如果是非同一网段内的数据呢？ 这时就得要透过那个所谓的邮局 (路由器) 的帮忙了！

## [root@www ~]# route
## Destination     Gateway         Genmask         Flags Metric Ref  Use Iface
## 192.168.0.0     *               255.255.255.0   U     0      0      0 eno16777736
## 127.0.0.0       *               255.0.0.0       U     0      0      0 lo
## default         192.168.0.254   0.0.0.0         UG    0      0      0 eno16777736

## [root@www ~]# route -n
## Destination     Gateway         Genmask         Flags Metric Ref  Use Iface
## 192.168.0.0     0.0.0.0         255.255.255.0   U     0      0      0 eno16777736
## 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0      0 lo
## 0.0.0.0         192.168.0.254   0.0.0.0         UG    0      0      0 eno16777736

##  IP 与 MAC：链结层的 ARP 与 RARP 协定
## 当我们想要了解某个 IP 其实是设定于某张以太网络卡上头时，我们的主机会对整个区网发送出 ARP 封包，
## 对方收到 ARP 封包后就会回传他的 MAC 给我们，我们的主机就会知道对方所在的网卡，那接下来就能够开始传递数据啰。
## 如果每次要传送都得要重新来一遍这个 ARP 协定那不是很烦？因此，当使用 ARP
## 协议取得目标 IP 与他网卡卡号后， 就会将该笔记录写入我们主机的 ARP table
## 中 (内存内的数据) 记录 20 分钟

## 在 Linux 环境下
[root@localhost ~]# ip a
[root@localhost ~]# ip addr show eno16777736
[root@localhost ~]# ifconfig eno16777736
[root@localhost ~]# ifconfig

## 在 Windows 环境下
## C:\Documents and Settings\admin..> ipconfig /all
## 以太网适配器 本地连接:
##
##    连接特定的 DNS 后缀 . . . . . . . :
##    本地链接 IPv6 地址. . . . . . . . : fb80::328a:b40a:45f3:ffb1%10
##    自动配置 IPv4 地址  . . . . . . . : 169.254.255.177
##    子网掩码  . . . . . . . . . . . . : 255.255.0.0
##    默认网关. . . . . . . . . . . . . :


##       arp - manipulate the system ARP cache
##NOTE
##       This program is obsolete. For replacement check ip neigh.  (该命令已被废弃)
##
##DESCRIPTION
##       Arp manipulates or displays the kernel's IPv4 network neighbour cache. It can add entries to the table, delete one or display the current content.
##
##       ARP stands for Address Resolution Protocol, which is used to find the media access control address of a network neighbour for a given IPv4 Address.


## [root@www ~]# arp -[nd] hostname
## [root@www ~]# arp -s hostname(IP) Hardware_address
## 选项与参数：
## -n ：将主机名以 IP 的型态显示
## -d ：将 hostname 的 hardware_address 由 ARP table 当中删除掉
## -s ：设定某个 IP 或 hostname 的 MAC 到 ARP table 当中
[root@www ~]# arp
[root@www ~]# arp -n
## Address            HWtype  HWaddress           Flags Mask    Iface
## 192.168.1.100      ether   00:01:03:01:02:03      C          eno16777736
## 192.168.1.240      ether   00:01:03:01:DE:0A      C          eno16777736
## 192.168.1.254      ether   00:01:03:55:74:AB      C          eno16777736

[root@localhost ~]# arp -d 192.168.253.254                     #将 192.168.253.254 的 hardware_address 由 ARP table 当中删除掉
[root@localhost ~]# arp -s 192.168.253.254 00:50:56:fe:47:ff   #将 192.168.253.254 那部主机的网卡卡号直接写入 ARP 表格中

man ip-neighbour
[root@localhost ~]# ip neighbour   #Shows the current neighbour table in kernel.


```

>ICMP 的全名是『 Internet Control Message Protocol, 因特网讯息控制协议 』。
>基本上，ICMP 是一个错误侦测与回报的机制，最大的功能就是可以确保我们网络的联机状态与联机的正确性！
>ICMP 也是网络层的重要封包之一，不过，这个封包并非独立存在，而是纳入到 IP
>的封包中！也就是说， ICMP 同样是透过 IP 封包来进行数据传送的啦！因为在 Internet
>上面有传输能力的就是 IP 封包啊！ ICMP 有相当多的类别可以侦测与回报，底下是比较常见的几个 ICMP 的类别 (Type)：

类别代号 | 类别名称与意义
-------- | ------------------------------
0 | Echo Reply (代表一个响应信息)
3 | Destination Unreachable (表示目的地不可到达)
4 | Source Quench (当 router 的负载过高时，此类别码可用来让发送端停止发送讯息)
5 | Redirect (用来重新导向路由路径的信息)
8 | Echo Request (请求响应消息)
11 | Time Exceeded for a Datagram (当数据封包在某些路由传送的现象中造成逾时状态，此类别码可告知来源该封包已被忽略的讯息)
12 | Parameter Problem on a Datagram (当一个 ICMP 封包重复之前的错误时，会回复来源主机关于参数错误的讯息)
13 | Timestamp Request (要求对方送出时间讯息，用以计算路由时间的差异，以满足同步性协议的要求)
14 | Timestamp Reply (此讯息纯粹是响应 Timestamp Request 用的)
15 | Information Request (在 RARP 协议应用之前，此讯息是用来在开机时取得网络信息)
16 | Information Reply (用以响应 Infromation Request 讯息)
17 | Address Mask Request (这讯息是用来查询子网 mask 设定信息)
18 | Address Mask Reply (响应子网 mask 查询讯息的)

>特权埠口 (Privileged Ports)

> 在我们的 Linux 环境下，各网络服务与 port number 的对应默认给他写在 /etc/services 档案内喔！ 底下鸟哥列出几个常见的 port number 与网络服务的对应：

端口 | 服务名称与内容
---- | -----------------
20 | FTP-data，文件传输协议所使用的主动数据传输端口
21 | FTP，文件传输协议的命令通道
22 | SSH，较为安全的远程联机服务器
23 | Telnet，早期的远程联机服务器软件
25 | SMTP，简单邮件传递协议，用在作为 mail server 的埠口
53 | DNS，用在作为名称解析的领域名服务器
80 | WWW，这个重要吧！就是全球信息网服务器
110 | POP3，邮件收信协议，办公室用的收信软件都是透过他
443 | https，有安全加密机制的WWW服务器

```
另外一点比较值得注意的是，小于 1024 以下的埠口要启动时， 启动者的身份必须要是
root 才行，所以才叫做特权埠口嘛！这个限制挺重要的，大家不要忘记了喔！
不过如果是 client 端的话，由于 client 端都是主动向 server 端要数据， 所以
client 端的 port number 就使用随机取一个大于 1024 以上且没有在用的 port number。
```

```
如果以 OSI 七层协议来说，每一层(对于防火墙)可以抵挡的数据有：

第二层：可以针对来源与目标的 MAC 进行抵挡；
第三层：主要针对来源与目标的 IP ，以及 ICMP 的类别 (type) 进行抵挡；
第四层：针对 TCP/UDP 的埠口进行抵挡，也可以针对 TCP 的状态 (code) 来处理。
```

- 网络参数与配置文件对应关系

所需网络参数 | 主要配置文件名 | 重要参数
------------ | -------------- | --------------------------
IP <br />Netmask<br />DHCP<br />Gateway等  | /etc/sysconfig/network-scripts/ifcfg-eno16777736 | DEVICE=网卡的代号<br /> BOOTPROTO=是否使用 dhcp<br /> HWADDR=是否加入网卡卡号(MAC)<br /> IPADDR=就是IP地址<br /> NETMASK=只网络屏蔽啦<br /> ONBOOT=要不要默认启动此接口<br /> GATEWAY=就是通讯闸啦<br /> NM_CONTROLLED=额外的网管软件<br /> 鸟哥建议取消这个项目！
主机名 | /etc/sysconfig/network | NETWORKING=要不要有网络<br /> NETWORKING_IPV6=支持IPv6否？<br /> HOSTNAME=你的主机名
DNS IP | /etc/resolv.conf | nameserver DNS的IP
私有 IP 对应的主机名 | /etc/hosts | 私有IP 主机名 别名


- [Interface Configuration Files](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s1-networkscripts-interfaces.html)
- [连上 Internet](http://cn.linux.vbird.org/linux_server/0130internet_connect_2.php)
```
man 5 nm-settings-ifcfg-rh  #查看网络配置参数

## 除此之外，还有些档案或许你也应该要知道一下比较好呦！
cat /etc/services    #这个档案则是记录架构在 TCP/IP 上面的总总协议，包括 http, ftp, ssh, telnet 等等服务所定义的 port number ，都是这个档案所规划出来的。如果你想要自定义一个新的协议与 port 的对应，就得要改这个档案了；
cat /etc/protocols   #这个档案则是在定义出 IP 封包协议的相关数据，包括 ICMP/TCP/UDP 这方面的封包协议的定义等。

## 网络方面的启动指令的话，可以记得几个简单的指令即可喔！
/etc/init.d/network restart    #这个 script 最重要！因为可以一口气重新启动整个网络的参数！ 他会主动的去读取所有的网络配置文件，所以可以很快的恢复系统默认的参数值。
ifup eth0 (ifdown eth0)        #启动或者是关闭某张网络接口。可以透过这个简单的 script 来处理喔！ 这两个 script 会主动到 /etc/sysconfig/network-scripts/ 目录下， 读取适当的配置文件来处理啊！ (例如 ifcfg-eth0)。


## 那么要修改的四个档案与相关的启动脚本，以及重新启动后需要用啥指令观察的重点，鸟哥再次的使用一个简单的表格来说明，
## 你只要记得这几个表格内的重要档案与指令，以后在修改网络参数时，就不会出现错误了！

```
修改的参数 | 配置文件与重要启动脚本 | 观察结果的指令
---------- | ---------------------- | ------------------
IP相关参数 | /etc/sysconfig/network-scripts/ifcfg-eth0 <br /> /etc/init.d/network restart | ifconfig (IP/Netmask) <br /> route -n (gateway)
DNS | /etc/resolv.conf | dig www.google.com
主机名 | /etc/hostname <br /> /etc/hosts | hostname (主机名) <br /> ping $(hostname) <br /> reboot

```sh
## 手动配置固定IP参数
man 5 nm-settings-ifcfg-rh  #查看网络配置参数
[root@localhost ~]# vim /etc/sysconfig/network-scripts/ifcfg-eno16777736
TYPE=Ethernet
BOOTPROTO=none #启动该网络接口时，使用何种协议？ 如果是手动给予 IP 的环境，请输入 static 或 none ，如果是自动取得 IP 的时候， 请输入 dhcp (不要写错字，因为这是最重要的关键词！)
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
IPV6_FAILURE_FATAL=no
NAME=eno16777736
UUID=c47ff46d-5b90-4e24-8d58-bb0f671b88d2
DEVICE=eno16777736  #这个设定值后面接的装置代号需要与文件名 (ifcfg-eth0) 那个装置代号相同才行！否则可能会造成一些装置名称找不到的困扰。
ONBOOT=yes

IPADDR=192.168.253.132
GATEWAY=192.168.253.2   #代表的是『整个主机系统的 default gateway』， 所以，设定这个项目时，请特别留意！不要有重复设定的情况发生喔！也就是当你有 ifcfg-eth0, ifcfg-eth1.... 等多个档案，只要在其中一个档案设定 GATEWAY 即可
#HWADDR=00:0c:29:86:ec:97  #(只有一张网卡时可以不用设定HWADDR,当多张网卡时必须设定HWADDR) #MAC-address is the hardware address of the Ethernet device in the form AA:BB:CC:DD:EE:FF. This directive must be used in machines containing more than one NIC to ensure that the interfaces are assigned the correct device names regardless of the configured load order for each NIC's module. This directive should not be used in conjunction with MACADDR.

[root@localhost ~]# systemctl restart network.service    #重启network.service,使/etc/sysconfig/network-scripts/ifcfg-eno16777736修改生效

[root@localhost ~]# ip a   #检查ip修改是否成功并生效
[root@localhost ~]# route -n #检查default gateway修改是否成功并生效

```


- [DNS{1,2}](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s1-networkscripts-interfaces.html)
- [How to configure static DNS on CentOS or Fedora](http://ask.xmodulo.com/configure-static-dns-centos-fedora.html)
```sh
## 修改DNS服务器
[root@localhost ~]# vim /etc/resolv.conf  #注意：如果打算手动在/etc/resolv.conf中配置DNS,就不要在ifcfg-x文件中配置DNS1，DNS2等参数，以免/etc/resolv.conf被ifcfg-x文件中的配置覆盖
nameserver 192.168.253.2 #关键字nameserver用于指定DNS服务器,最多指定3个DNS服务器，每个DNS服务器占一行，行的顺序决定了DNS的查询顺序
nameserver 192.168.253.3

```

- [CentOS 7 主机名的修改](http://www.linuxidc.com/Linux/2014-11/109238.htm)
```sh
man hostname
[root@localhost ~]# vim /etc/hostname
centos7   #注：务必保持仅有这一行配置，删除其他的配置行(可以保留空白行)

修改完主机名称后，还应该相应的修改/etc/hosts文件,以便让主机能顺利解析到该主机名
本地域名解析配置文件
本地域名解析数据库配置文件/etc/hosts,通常也称Host表文件。
[root@localhost ~]# vim /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.253.132 centos7.vbird centos7

## 重新启动电脑后
[root@www ~]# hostname
[root@www ~]# ping centos7
[root@www ~]# ping centos7.vbird

```
- [The /etc/host.conf file](http://www.tldp.org/LDP/solrhe/Securing-Optimizing-Linux-RH-Edition-v1.3/chap5sec39.html)
- [Managing Hosts](https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-network-config-hosts.html)
```sh
vi /etc/host.conf
##           # Lookup names via DNS first then fall back to /etc/hosts.
##           order bind,hosts
##           # We have machines with multiple IP addresses.
##           multi on
##           # Check for IP address spoofing.
##           nospoof on


## Warning (/etc/hosts)
##   Do not remove the localhost entry. Even if the system does not have a network
##   connection or have a network connection running constantly, some programs need
##   to connect to the system via the localhost loopback interface.

##Tip (/etc/host.conf)
##  To change lookup order, edit the /etc/host.conf file. The line order hosts,
##  bind specifies that /etc/hosts takes precedence over the name servers. Changing
##  the line to order bind, hosts configures the system to resolve hostnames and IP
##  addresses using the name servers first. If the IP address cannot be resolved
##  through the name servers, the system then looks for the IP address in the
##  /etc/hosts file.

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

