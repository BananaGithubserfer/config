#!/bin/bash
swayidle \
    timeout 3 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
#swaylock -e --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0.2
swaylock -e --screenshots --clock --indicator-idle-visible --indicator-radius 100 --indicator-thickness 7 --ignore-empty-password --ring-color 000000 --ring-ver-color 000000 --ring-wrong-color 0f0f0f0 --ring-clear-color 0f0f0f --key-hl-color 666666 --text-color ffffff --text-ver-color ffffff --text-wrong-color ffffff --text-clear-color ffffff --text-caps-lock-color ffffff --line-uses-inside --inside-color 00000005 --inside-ver-color 00000005 --inside-wrong-color 00000005 --inside-clear-color 00000005 --layout-bg 00000010 --layout-border-color 00000050 --layout-text-color ffffff --separator-color 00000000 --fade-in 0.5 --effect-scale 0.5 --effect-blur 7x3 --effect-greyscale --bs-hl-color ffffff -F


kill %%
