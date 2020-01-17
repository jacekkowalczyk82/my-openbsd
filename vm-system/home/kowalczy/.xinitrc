xset -b 
setxkbmap pl 

exec nitrogen --restore & 
exec compton -b & 

while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `uptime |awk -F "load" '{print $2}' |cut -d " " -f 5 `; Up: `uptime |cut -d "," -f 1 |awk -F "up" '{print $2}'`"; sleep 1; done & 


exec dwm 