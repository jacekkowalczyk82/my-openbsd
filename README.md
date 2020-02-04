# my-openbsd
my openbsd setup configs and manuals


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
edit file `/etc/rc.conf.local`

```
pkg_scripts="dbus_daemon avahi_daemon"
dbus_enable=YES
#hald_enable=YES

```

Create files `/etc/polkit-1/rules.d/05-restart-stop.rules`

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