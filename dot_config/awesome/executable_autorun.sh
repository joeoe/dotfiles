#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run /usr/lib/pam_kwallet_init
run /usr/bin/fcitx5
run /usr/bin/picom --dbus
run /usr/bin/synology-drive
run /usr/bin/aw-qt
# run /usr/bin/bitwarden-desktop
# run /usr/bin/flatpak run com.todoist.Todoist
run /usr/bin/easyeffects --gapplication-service
