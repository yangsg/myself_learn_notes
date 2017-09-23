**useful online resource**
* 鸟哥的 Linux 私房菜  http://cn.linux.vbird.org/linux_basic/linux_basic.php
* nixCraft             https://www.cyberciti.biz/faq/

```bash
man shutdown
shutdown -h now  #equivalent to `shutdown -h +0` #立刻关机
shutdown -h 20:25  #系统在今天的 20:25 分会关机，若在21:25才下达此指令，则隔天才关机
shutdown -h +10    #系统再过十分钟后自动关机
shutdown -r now    #系统立刻重新启动
shutdown -r +30 'The system will reboot'   #再过三十分钟系统会重新启动，并显示后面的讯息给所有在在线的使用者
shutdown -k now 'This system will reboot'  #仅发出警告信件的参数！系统并不会关机啦！吓唬人！

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

