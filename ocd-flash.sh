#/bin/bash

if ["$1" -eq ""] ; then

echo "Enter filename!"

else

# Start openocd
sudo openocd -f ~/openocd-bin/board/st_nucleo_l1.cfg -c "init; program "$1" verify; reset; exit"

fi
