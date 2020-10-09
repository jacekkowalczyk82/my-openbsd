# my-openbsd

my openbsd setup configs and manuals

## Internet Resources 

* https://sohcahtoa.org.uk/openbsd.html
* https://www.youtube.com/watch?v=XmMlE5QVJ08
* https://www.patreon.com/posts/18039949
* https://www.gabsoftware.com/tutorials/tutorial-how-to-install-openbsd-6-1-step-by-step/


## Install OpenBSD to USB stick using qemu

* Create a KVM machine and install the openBSD to the virtual disk img file

```
mkdir openbsd
cd openbsd/
wget https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.iso
# I have a 64GB usb sandisk (the real size is a bit less ~ 57GB)
qemu-img create openBSD.img 56G
sudo qemu-system-x86_64  -smp 2 -m 2048 -enable-kvm -usb -hda openBSD.img -cdrom ./install66.iso
```

* After installing the base system I booted it, configureed and added additional software 

```
sudo qemu-system-x86_64  -smp 2 -m 2048 -enable-kvm -usb -hda openBSD.img
```

* At the end I installed it to USB stick 

```
sudo dd if=openBSD.img of=/dev/sdb bs=256k status=progress
```


## Install mate desktop 


```
pkg_add mate-desktop mate-notification-daemon mate-terminal mate-panel mate-session-manager mate-icon-theme mate-control-center mate-calc caja pluma 
pkg_add mate
pkg_add dbus
#pkg_add hal

```

* Install additional software 

```
pkg_add sudo 
pkg_add vim nano git curl mc chromium 
```

* Edit file `/etc/rc.conf.local`

```
xenodm_flags=                                                                                                                                                           
pkg_scripts="dbus_daemon avahi_daemon"                                                                                                                                  
dbus_enable=YES                                                                                                                                                         
#hald_enable=YES    

```

* Create files `/etc/polkit-1/rules.d/05-restart-stop.rules`

```
polkit.addRule (function(action,subject) {
    if (action.id == "org.freedesktop.consolekit.system.stop" || 
        action.id == "org.freedesktop.consolekit.system.stop-multiple-users" ||
        action.id == "org.freedesktop.consolekit.system.restart" || 
        action.id == "org.freedesktop.consolekit.system.restart-multiple-users" 
        && subject.isInGroup ("users")) {
        return polkit.Result.YES;
    }
});
```


## System update 

```
sudo syspatch 
sudo pkg_add -u 
```

## Install DWM 

```
sudo pkg_add dwm dmenu st sakura neofetch scrot
sudo pkg_add compton 

```





# Install OpenBSD 6.7 at thinkpad x240 

### Prepare USB stick 

```
sudo dd if=install67.fs of=/dev/sda bs=1m

```

### Post install steps / configuation and packages 

* Install pase packages 

```
su -
pkg_add sudo git nano mc rsync 

```

* Edit `/etc/sudoers`  and uncomment:

```
%wheel  ALL=(ALL) SETENV: ALL
```

* Add to `.profile` file

```
export ENV=$HOME/.kshrc
```

* Create `~/.kshrc` file:

```
. /etc/ksh.kshrc

HISTFILE="$HOME/.ksh_history"
HISTSIZE=5000
```

* Install Firmware 

```
sudo fw_update -a

```


* Create file `/etc/hostname.iwm0` with WiFi configuration

```
join <MY_SSID>_5G wpakey <MY_SECRET_PIN>
join <MY_SSID> wpakey <MY_SECRET_PIN>
join <MY_SSID>_EXT wpakey <MY_SECRET_PIN>
join <MY_SSID>_5G_EXT wpakey <MY_SECRET_PIN>

dhcp
```

* Connect to wifi 

```
sudo ifconfig iwm0 nwid <SSID> wpakey <SECRET>
sudo dhclient iwm0
```

* Install GUI packages 

```
sudo pkg_add mate-desktop mate-notification-daemon mate-terminal mate-panel mate-session-manager mate-icon-theme mate-control-center mate-calc caja pluma  
sudo pkg_add mate eom 
sudo pkg_add dbus

sudo pkg_add chromium firefox

```

* Edit file `/etc/rc.conf.local`

```
xenodm_flags=
pkg_scripts="dbus_daemon avahi_daemon"
dbus_enable=YES
```

* Create file `/etc/polkit-1/rules.d/05-restart-stop.rules`

```
polkit.addRule (function(action,subject) {
    if (action.id == "org.freedesktop.consolekit.system.stop" || 
        action.id == "org.freedesktop.consolekit.system.stop-multiple-users" ||
        action.id == "org.freedesktop.consolekit.system.restart" || 
        action.id == "org.freedesktop.consolekit.system.restart-multiple-users" 
        && subject.isInGroup ("users")) {
        return polkit.Result.YES;
    }
});

```

* Edit `/etc/X11/xenodm/Xsetup_0` and comment all and set 

```
xset b off

```

* Create .xinitrc file

```
exec mate-session

```

* Link .xsesion to .xinitrc

```
ln -s .xinitrc .xsession
```

* `sudo reboot`


## Install development environment for blogging with jekyll

```
sudo pkg_add ruby


sudo gem27 install bundler jekyll
#gem27 install bundler jekyll
cd <jekyll blog repository>
bundle27 config set path 'vendor/bundle'
bundle27 install
bundle27 exec jekyll serve

# diff tool 
sudo pkg_add kompare 

```

# Install DWM 

* Packages 

```
sudo pkg_add dwm st sakura dmenu neofetch nitrogen scrot compton

```

* Configure `.xinitrc` file

```
## DWM 
xset -b 
setxkbmap pl 

#exec xrandr -s 1280x720 & 
exec nitrogen --restore & 
exec compton -b & 

while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `uptime |awk -F "load" '{print $2}' |cut -d " " -f 5 `; Up: `uptime |cut -d "," -f 1 |awk -F "up" '{print $2}'`"; sleep 1; done & 


exec dwm 


```
