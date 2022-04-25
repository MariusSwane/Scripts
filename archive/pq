#!/bin/bash

chosen=$(beet list -a | rofi -dmenu -i -l 30 | awk -F ' - ' '{print $2}' )

mpc clear
mpc searchadd album "$chosen"
mpc play

bum
