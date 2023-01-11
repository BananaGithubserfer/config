#!/bin/bash
swayidle \
    timeout 3 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
#swaylock -e --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0.2
swaylock -e --screenshots --clock --indicator-idle-visible 	--indicator-radius 100 	--indicator-thickness 7 --ignore-empty-password --ring-color 000000 --ring-ver-color 12488B --ring-wrong-color C01C28 --ring-clear-color A2734C --key-hl-color 12488B --text-color ffffff --text-ver-color ffffff --text-wrong-color ffffff --text-clear-color ffffff --text-caps-lock-color A2734C --line-uses-inside --inside-color 00000005 --inside-ver-color 00000005 --inside-wrong-color 00000005 --inside-clear-color 00000005 --layout-bg 00000010 --layout-border-color 00000010 --layout-text-color ffffff --separator-color 00000000 --fade-in 0.5 --effect-scale 0.5 --effect-blur 7x3 --effect-scale 2 -F


kill %%
