#!/bin/bash
#swaylock -e --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0.2
faillock --user $USER --reset
swaylock -e --screenshots --clock --indicator-idle-visible  --indicator-radius 100  --indicator-thickness 7 --ignore-empty-password --ring-color 000000 --ring-ver-color 12488B --ring-wrong-color C01C28 --ring-clear-color A2734C --key-hl-color 12488B --text-color ffffff --text-ver-color ffffff --text-wrong-color ffffff --text-clear-color ffffff --text-caps-lock-color A2734C --line-uses-inside --inside-color 00000050 --inside-ver-color 00000050 --inside-wrong-color 00000050 --inside-clear-color 00000050 --layout-bg 00000050 --layout-border-color 00000050 --layout-text-color ffffff --separator-color 00000000 --fade-in 0.5 --effect-scale 0.5 --effect-blur 7x3 --effect-greyscale -F --bs-hl-color C01C28 &
sleep 2 && loginctl hibernate

