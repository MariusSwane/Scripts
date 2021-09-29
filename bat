#!/bin/bash

BAT=$(acpi -b | acpi -b | cut -f 5 -d " ")

if [[ $BAT < 00:15:00
	]] ; then notify-send "Low battery!" "$BAT" 
fi

