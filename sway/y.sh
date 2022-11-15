if [[ $(ps aux | grep y.jpg | grep -v grep) ]]; then 
    pkill swaybg
    ~/.config/sway/wall.sh
else
    pkill swaybg
    pkill wall.sh
    swaybg -i ~/.config/sway/y.jpg -m fill
fi

