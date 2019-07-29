#!/usr/bin/zsh

Xephyr :2 -screen 1910x1010&
DISPLAY=:2
openbox&
source /opt/Xilinx/Vivado/2018.3/settings64.sh
xterm
# vivado
