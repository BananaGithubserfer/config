#!/bin/bash
exec swayidle -w \
		timeout 300 'swaylock -f -e --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 5 --fade-in 0.2' \
        timeout 315 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
        before-sleep 'swaylock -f -e --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0.2'
