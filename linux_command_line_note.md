**useful online resource**
* 鸟哥的 Linux 私房菜  http://cn.linux.vbird.org/linux_basic/linux_basic.php
* nixCraft             https://www.cyberciti.biz/faq/

* 参考书籍:
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
/etc/init.d/syslog status
/etc/init.d/syslog start
/etc/init.d/syslog stop
/etc/init.d/syslog restart

[root@www ~]# service [service name] (start|stop|restart|...)
[root@www ~]# service --status-all


[root@www ~]# grep -i 'disable' /etc/xinetd.d/*    #那如何得知 super daemon 所管理的服务是否有启动呢？你可以这样做



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

