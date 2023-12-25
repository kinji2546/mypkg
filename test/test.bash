#!/bin/bash
# SPDX-FileCopyrightText: 2023 Nozaki
# SPDX-License-Identifier: BSD-3-Clause

# 引数があればそのディレクトリに、なければホームディレクトリに設定
dir=~
[ "$1" != "" ] && dir="$1"

# ROS 2ワークスペースに移動し、ビルドする
cd "$dir/ros2_ws" && colcon build --packages-select mypkg

# 環境をソース
source "$dir/ros2_ws/install/setup.bash"

# ノードを10秒間ランチしてログに出力、その後ログを解析する
timeout 20 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
# ログファイルを解析し、「3.141」が含まれている場合は 0 を返す
if grep -q '3.141' /tmp/mypkg.log; then
  echo "Found '3.141' in the log."
  exit 0
else
  echo "Did not find '3.141' in the log."
  exit 1
fi
