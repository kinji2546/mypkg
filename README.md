# mypkg
ロボットシステム学で使用したros2  

[![test](https://github.com/kinji2546/mypkg/actions/workflows/test.yml/badge.svg?branch=kada)](https://github.com/kinji2546/mypkg/actions/workflows/test.yml)



# リポジトリ内のノード,ファイル一覧

## talker.py
* パブリッシャのノード.  
* モンテカルロ法を利用してπ（3．14）の近似値を求めて最終的にπ（3．14）に近くなる過程トピック`/pi_setimate`を通じて送信する.

## listener.py
* サブスクライバのノード.  
* トピック`/pi_setimate`からメッセージを受け取り表示する.

# 実行手順
## talkerとlistener
* `ros2 run`で実行する方法
端末1$ ros2 run mypkg talker
端末2$ ros2 run mypkg listener
