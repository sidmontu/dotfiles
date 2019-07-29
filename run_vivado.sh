#!/bin/zsh

# Latest versions of Vivado (2018.3 and above) have issues running when your
# system has multiple displays. This script is a weird hack to trick Vivado
# into thinking there's only one display monitor attached to your system.
# Weird, I know. Go figure.

VIVADO_VER=2018.3

Xephyr :2 -screen 1910x1010&
DISPLAY=:2
openbox&
source /opt/Xilinx/Vivado/${VIVADO_VER}/settings64.sh
vivado
