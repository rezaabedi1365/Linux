
To list the available settings :
```
gsettings list-recursively org.gnome.desktop.remote-desktop.rdp
```

To set the port :
```
gsettings set org.gnome.desktop.remote-desktop.rdp port 1111
```
```
systemctl restart --user gnome-remote-desktop
```
