#!/bin/sh

CURR_STATE=$(setxkbmap -query | grep cmk_ed_us)
PATH="/home/lovro/Lovro/CarePackage/Dreymar/BigBagKbdTrixXKB-master/my-scripts"

if [ -z "$CURR_STATE" ]
then
    $PATH/buci-colemak-with-extend.sh
else
    $PATH/us-layout.sh
fi

