#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause

# 環境変数をチェックして適切に設定する
if [ -z "$GITHUB_WORKSPACE" ]; then
  echo "GITHUB_WORKSPACE が設定されていません。CI環境外で実行している可能性があります。"
  LOG_FILE="$(pwd)/mypkg_test.log"  # ローカル環境でのフォールバック
else
  LOG_FILE="${GITHUB_WORKSPACE}/mypkg_test.log"  # CI環境でのパス
fi

DIR=~
PKG_NAME=mypkg
LAUNCH_FILE=talk_listen.launch.py
LOG_FILE=/tmp/mypkg_test.log
TIMEOUT_DURATION=20

[ "$1" != "" ] && DIR="$1"
# ROS 2 foxyのセットアップ
#source /opt/ros/foxy/setup.bash
# ワークスペースに移動してビルド
cd $DIR/ros2_ws
colcon build 

# ビルドしたパッケージのセットアップ
#source $DIR/kako/ros2_ws/install/setup.bash
source $dir/.bashrc
# テスト用ランチファイルの実行とログの出力
ros2 launch mypkg talk_listen.launch.py > "$LOG_FILE"

# ランチファイルが時間内に完了するのを待機
sleep $TIMEOUT_DURATION
pkill -f 'ros2 launch'

# 出力値の確認 - ここでPiの近似値として3.14
grep "pi estimate:" $LOG_FILE | grep "3.14"
if [ $? -eq 0 ]; then
    echo "Test passed: Pi estimate found in log."
    exit 0
else
    echo "Test failed: Pi estimate not found in log."
    exit 1
fi
