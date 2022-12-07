# !/bin/bash

artist=$(mpc list albumartist | rofi -dmenu -i -l 30)

# Exit if none chosen.
[ -z "$artist" ] && exit

album=$(mpc find albumartist "$artist" |
	cut -d '/' -f 3 |
	uniq |
	#sed "s/^/$artist - /" |
	rofi -dmenu -i -l 30)
	
# Go back to artists if none chosen
[ -z "$album" ] && 
artist=$(mpc list albumartist | rofi -dmenu -i -l 30)

mpc clear
mpc findadd album "$album"
mpc play

bum
