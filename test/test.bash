#!/bin/bash
# SPDX-FileCopyrightText: 2023 Nozaki
# SPDX-License-Identifier: BSD-3-Clause

# 引数があればそのディレクトリに、なければホームディレクトリに設定
dir=~
[ "$1" != "" ] && dir="$1"

# ROS 2ワークスペースに移動し、ビルドする
cd "$dir/ros2_ws" && colcon build --packages-select mypkg

# 環境をソース
#source "$dir/ros2_ws/install/setup.bash"
source $dir/.bashrc

# ノードを10秒間ランチしてログに出力、その後ログを解析する
timeout 560 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
# ログファイルを解析し、「3.141」が含まれている場合は 0 を返す
grep -q '3.1415' /tmp/mypkg.log && echo "Found '3.1415' in the log." || echo "Did not find '3.1415' in the log."
  
