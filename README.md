# mypkg
ロボットシステム学で使用したros2  

[![test](https://github.com/kinji2546/mypkg/actions/workflows/test.yml/badge.svg?branch=kada)](https://github.com/kinji2546/mypkg/actions/workflows/test.yml)



# リポジトリ内の主な内容一覧

## talker.py
* パブリッシャのノード.  
* モンテカルロ法を利用してπ（3．14）の近似値を求めて最終的にπ（3．14）に近くなる過程をトピック`/pi_setimate`を通じて送信する.


## listener.py  
* サブスクライバのノード.  
* トピック`/pi_setimate`からメッセージを受け取り表示する.

# 実行手順  
## talkerとlistener  
* `ros2 run`で実行する方法
```
端末1$ ros2 run mypkg talker
[INFO] [1702743288.403423539] [pi_calculator]: Publishing: "3.141496"
[INFO] [1702743288.467780713] [pi_calculator]: Publishing: "3.141496"
[INFO] [1702743288.522915170] [pi_calculator]: Publishing: "3.141497"
[INFO] [1702743288.562654672] [pi_calculator]: Publishing: "3.141498"
[INFO] [1702743288.610940721] [pi_calculator]: Publishing: "3.141500"
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[コントロールキー＋C]
```

```
端末2$ $ ros2 run mypkg listener
[INFO] [1702744665.723449651] [pi_listener]: Received pi estimate: "3.140139057118595"
[INFO] [1702744665.724279642] [pi_listener]: Received pi estimate: "3.140227394222938"
[INFO] [1702744665.724911923] [pi_listener]: Received pi estimate: "3.1402731341625545"
[INFO] [1702744665.725478858] [pi_listener]: Received pi estimate: "3.1401762117060237"
[INFO] [1702744665.726335652] [pi_listener]: Received pi estimate: "3.1402031133367845"
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[コントロールキー＋C]
```

## 必要なソフトウェア  
* Python  

## テスト環境  
* Ubuntu 20.04  
 

# 権利関係  
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます.  
