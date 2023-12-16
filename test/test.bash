#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause

DIR=~
PKG_NAME=mypkg
LAUNCH_FILE=talk_listen.launch.py
LOG_FILE=/tmp/${PKG_NAME}_test.log
TIMEOUT_DURATION=20

[ "$1" != "" ] && DIR="$1"

# source /opt/ros/foxy/setup.bash
cd $DIR/ros2_ws
colcon build --packages-select $PKG_NAME

source $DIR/ros2_ws/install/setup.bash

ros2 launch $PKG_NAME $LAUNCH_FILE > $LOG_FILE 2>&1 &
echo $?
sleep $TIMEOUT_DURATION
pkill -f 'ros2 launch'

grep "pi estimate:" $LOG_FILE | grep "3.14"
if [ -e $LOG_FILE ]; then
  echo "Log Fileあるよ."
fi
  #  echo "Test passed: Pi estimate found in log."
   # exit 0
#else
 #   echo "Test failed: Pi estimate not found in log."
  #  exit 1
#fi
