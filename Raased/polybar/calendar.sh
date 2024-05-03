#!/bin/sh
 
YAD_WIDTH=500  # 222 is minimum possible value
YAD_HEIGHT=400 # 193 is minimum possible value
DATE="$(date +"%a %d %H:%M")"
 
case "$1" in
--popup)
 
    yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons --posx=585\
        --title="calendar" --borders=0 >/dev/null &
    ;;
*)
    echo "Calendar"
    ;;
esac
 
 
