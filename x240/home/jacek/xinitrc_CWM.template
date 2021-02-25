#!/bin/ksh
export ENV=$HOME/.kshrc

## XFCE
# exec startxfce4

# ## MATE
# exec mate-session

# ## i3wm
#exec /usr/local/bin/i3
 
## DWM 
#xset -b 
#setxkbmap pl 

##exec xrandr -s 1280x720 & 
#exec nitrogen --restore & 
## exec compton -b & 
#while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `uptime |awk -F "load" '{print $2}' |cut -d " " -f 5 `; Up: `uptime |cut -d "," -f 1 |awk -F "up" '{print $2}'`"; sleep 1; done & 
#exec dwm 

## CWM experiments
#xsetroot -solid grey &
#exec xterm -bg black -fg white +sb &
#exec xterm -geometry 150x50+100+100 & 
#exec nitrogen --restore &
#while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `uptime |awk -F "load" '{print $2}' |cut -d " " -f 5 `; Up: `uptime |cut -d "," -f 1 |awk -F "up" '{print $2}'`"; sleep 1; done & 
#exec cwm


## CWM 

xset b off
setxkbmap pl 

exec ~/bin/barstarter.sh & 
exec xsetroot -solid grey &
exec xterm -geometry 150x50+100+100 &
exec nitrogen --restore &
exec cwm
