#/bin/bash

# Start openocd
sudo openocd -f ~/openocd-bin/board/st_nucleo_l1.cfg -c "init; reset; halt"

