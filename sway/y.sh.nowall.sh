if [[ $(ps aux | grep y.jpg | grep -v grep) ]]; then 
    pkill swaybg
    swaybg -i ~/.config/sway/wallpapers/photo_2022-11-21_17-38-39.jpg -m fill
else
    pkill swaybg
    pkill wall.sh
    swaybg -i ~/.config/sway/y.jpg -m fill
fi

