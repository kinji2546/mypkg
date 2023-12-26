# mypkg
ロボットシステム学で使用したros2  

[![test](https://github.com/kinji2546/mypkg/actions/workflows/test.yml/badge.svg?branch=kada)](https://github.com/kinji2546/mypkg/actions/workflows/test.yml)



# リポジトリ内の主な内容一覧

## talker.py
* パブリッシャのノード.  
* モンテカルロ法を利用してπ（3．14）の近似値を求めて最終的にπ（3．14）に近くなる過程をトピック`/pi_value`を通じて送信する.


## listener.py  
* サブスクライバのノード.  
* トピック`/pi_value`からメッセージを受け取り表示する.

# 実行手順  
## talkerとlistener  
* `ros2 run`で実行する方法
```
端末1$ ros2 run mypkg talker
[INFO] [1703520550.981963577] [pi_calculator]: Publishing: "3.146339"
[INFO] [1703520550.982169611] [pi_calculator]: Publishing: "3.147517"
[INFO] [1703520550.982390703] [pi_calculator]: Publishing: "3.149844"
[INFO] [1703520550.982608643] [pi_calculator]: Publishing: "3.148921"
[INFO] [1703520550.982815924] [pi_calculator]: Publishing: "3.148098"
[INFO] [1703520550.983022342] [pi_calculator]: Publishing: "3.148079"
```
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[コントロールキー＋C]


```
端末2$ $ ros2 run mypkg listener
[INFO] [1703520550.981963577] [pi_listener]: Received pi estimate: "3.1463392728879464"
[INFO] [1703520550.982169611] [pi_listener]: Received pi estimate: "3.1475171530456343"
[INFO] [1703520550.982390703] [pi_listener]: Received pi estimate: "3.1498441091483718"
[INFO] [1703520550.982608643] [pi_listener]: Received pi estimate: "3.1489219159581757"
[INFO] [1703520550.982815924] [pi_listener]: Received pi estimate: "3.1480988659704027"
[INFO] [1703520550.983022342] [pi_listener]: Received pi estimate: "3.1480790646118781"
```
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[コントロールキー＋C]


## 必要なソフトウェア  
* Python  
* ROS2  
## テスト環境  
* Ubuntu 20.04  
 

# 権利関係  
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます. 
* このパッケージのコードの一部は, 下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを, 本人の許可を得て自身の著作としたものです．
* [ryuichiueda/my_slides/robosys_2022/lesson9](https://ryuichiueda.github.io/my_slides/robosys_2022/lesson9.html#/)  
* [ryuichiueda/my_slides/robosys_2022/lesson10](https://ryuichiueda.github.io/my_slides/robosys_2022/lesson10.html#/)  
* [ryuichiueda/my_slides/robosys_2022/lesson11](https://ryuichiueda.github.io/my_slides/robosys_2022/lesson11.html#/) 
* © 2023 Nozaki 
