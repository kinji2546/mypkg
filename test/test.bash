#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause

# 変数定義
DIR=~/ros2_ws
PKG_NAME=mypkg # ROS2パッケージ名を変更してください
LAUNCH_FILE=talk_listen.launch.py # プログラム専用の適切なローンチファイル名に変更してください
LOG_FILE=/tmp/${PKG_NAME}_test.log
TIMEOUT_DURATION=15 # 期待する出力をキャッチするために必要な時間

# 引数がある場合、指定されたディレクトリを使用
[ "$1" != "" ] && DIR="$1"

# ROS2 ワークスペースの準備
source /opt/ros/foxy/setup.bash # ROS2環境を準備するために適切なROS2バージョンをsourceしてください
cd $DIR
colcon build --packages-select $PKG_NAME

# 環境をsourceする
source $DIR/install/setup.bash

# ローンチファイルを実行しログに出力、その後出力をチェック
pwd
timeout $TIMEOUT_DURATION ros2 launch $PKG_NAME $LAUNCH_FILE > $LOG_FILE

# 出力値の確認 - ここでPiの近似として3.14を使っていますが、必要に応じて調整してください
grep "data: 3.14" $LOG_FILE
if [ $? -eq 0 ]; then
    echo "Test passed: Pi estimate found in log."
    exit 0
else
    echo "Test failed: Pi estimate not found in log."
    exit 1
fi
