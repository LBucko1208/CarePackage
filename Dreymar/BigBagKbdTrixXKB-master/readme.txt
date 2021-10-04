1. Prebacis ovaj folder negdje na Linux
2. U terminalu pokrenes komandu "./install-dreymar-xmod.sh"
<<<<<<< HEAD
3. "bash setxkb.sh -a 4n us us" (-a za trajno rjesenje)
=======
3a. (privremeno) "setxkbmap -model pc104 -layout us -variant colemak -option lv5:caps_switch_lock,misc:extend -v 9"
3b. (trajno) u /etc/default/keyboard namjestiti podatke isto kao ispod
    !! JOS PROVJERITI JE LI RADI !!

    MODEL="pc104"
    LAYOUT="us"
    VARIANT="colemak"
    OPTION="lv5:caps_switch_lock,misc:extend"

>>>>>>> e3c08daa09f5a7a4211c482c8c81ab527aed1a83
