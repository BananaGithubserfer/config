if [[ $(ps aux | grep y2.png | grep -v grep) ]]; then 
    pkill swaybg
    ~/.config/sway/wall.sh
else
    pkill swaybg
    pkill wall.sh
    swaybg -i ~/.config/sway/y2.png -m fit -c "#0e433b"
fi

