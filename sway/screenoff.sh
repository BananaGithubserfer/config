#!/bin/bash
swayidle \
    timeout 1 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' 
