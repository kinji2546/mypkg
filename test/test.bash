#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause

DIR=~/ros2_ws
PKG_NAME=mypkg
LAUNCH_FILE=talk_listen.launch.py 
LOG_FILE=/tmp/${PKG_NAME}_test.log
TIMEOUT_DURATION=20

[ "$1" != "" ] && DIR="$1"

source /opt/ros/foxy/setup.bash
cd $DIR
colcon build --packages-select $PKG_NAME

source $DIR/install/setup.bash


timeout $TIMEOUT_DURATION "ros2 launch $PKG_NAME $LAUNCH_FILE" > $LOG_FILE

# 出力値の確認 - ここでPiの近似として3.14を使っていますが、必要に応じて調整してください
grep "data: 3.14" $LOG_FILE
if [ $? -eq 0 ]; then
    echo "Test passed: Pi estimate found in log."
    exit 0
else
    echo "Test failed: Pi estimate not found in log."
    exit 1
fi
