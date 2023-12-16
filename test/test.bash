#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause

DIR=~
PKG_NAME=mypkg
LAUNCH_FILE=talk_listen.launch.py
LOG_FILE=/tmp/${PKG_NAME}_test.log
TIMEOUT_DURATION=20

[ "$1" != "" ] && DIR="$1"

# ROS 2 foxyのセットアップ
source /opt/ros/foxy/setup.bash

# ワークスペースに移動してビルド
cd $DIR/ros2_ws
colcon build --packages-select $PKG_NAME

# ビルドしたパッケージのセットアップ
source $DIR/ros2_ws/install/setup.bash

# テスト用ランチファイルの実行とログの出力
ros2 launch $PKG_NAME $LAUNCH_FILE > $LOG_FILE 2>&1 &

# ランチファイルが時間内に完了するのを待機
sleep $TIMEOUT_DURATION
pkill -f 'ros2 launch'

# 出力値の確認 - ここでPiの近似値として3.14を使っていますが、必要に応じて調整してください
grep "pi estimate:" $LOG_FILE | grep "3.14"
if [ $? -eq 0 ]; then
    echo "Test passed: Pi estimate found in log."
    exit 0
else
    echo "Test failed: Pi estimate not found in log."
    exit 1
fi
