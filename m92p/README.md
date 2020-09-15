


```
pkg_add mate-desktop mate-notification-daemon mate-terminal mate-panel mate-session-manager mate-icon-theme mate-control-center mate-calc caja pluma 
pkg_add mate
pkg_add dbus


```


* edit file `/etc/rc.conf.local`

```
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
