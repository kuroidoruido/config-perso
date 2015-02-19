#!/bin/sh
killall conky
conky -c ~/.conky/k49DesktopInfo/conkyrc
conky -c ~/.conky/harmanttan/Transparent/Celsius/Comfortable/conkyrc
conky -c ~/.conky/k49Music/conkyrc_desktop
sleep 2 && conky -c ~/.conky/k49LineCalendar/conkyrc
