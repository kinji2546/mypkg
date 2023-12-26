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

# 実行手順と一部結果
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
但し数値は変わる.プログラムを終わらせるときは[Ctrl＋C]


```
端末2$ ros2 run mypkg listener
[INFO] [1703520550.981963577] [pi_listener]: Received pi estimate: "3.1463392728879464"
[INFO] [1703520550.982169611] [pi_listener]: Received pi estimate: "3.1475171530456343"
[INFO] [1703520550.982390703] [pi_listener]: Received pi estimate: "3.1498441091483718"
[INFO] [1703520550.982608643] [pi_listener]: Received pi estimate: "3.1489219159581757"
[INFO] [1703520550.982815924] [pi_listener]: Received pi estimate: "3.1480988659704027"
[INFO] [1703520550.983022342] [pi_listener]: Received pi estimate: "3.1480790646118781"
```
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[Ctrl＋C]


* `ros2 launch`で実行する方法
```
$ ros2 launch mypkg talk_listen.launch.py
[INFO] [launch]: All log files can be found below /home/qxyt56fr/.ros/log/2023-12-26-14-00-36-023717-VAIO-12168
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [talker-1]: process started with pid [12170]
[INFO] [listener-2]: process started with pid [12172]
[talker-1] [INFO] [1703566836.386711687] [pi_calculator]: Publishing: "4.000000"
[listener-2] [INFO] [1703566836.404032024] [pi_listener]: Received pi estimate: "4.0"
[talker-1] [INFO] [1703566836.404186601] [pi_calculator]: Publishing: "3.466667"
[talker-1] [INFO] [1703566836.404480300] [pi_calculator]: Publishing: "3.428571"
[talker-1] [INFO] [1703566836.410153428] [pi_calculator]: Publishing: "3.052308"
[talker-1] [INFO] [1703566836.410448738] [pi_calculator]: Publishing: "3.042735"
[talker-1] [INFO] [1703566836.410741796] [pi_calculator]: Publishing: "3.068783"
[talker-1] [INFO] [1703566836.411030866] [pi_calculator]: Publishing: "3.093596"
[talker-1] [INFO] [1703566836.411320338] [pi_calculator]: Publishing: "3.098851"
[talker-1] [INFO] [1703566836.412182321] [pi_calculator]: Publishing: "3.106061"
[talker-1] [INFO] [1703566836.412461592] [pi_calculator]: Publishing: "3.094474"
[talker-1] [INFO] [1703566836.413321168] [pi_calculator]: Publishing: "3.099099"
[talker-1] [INFO] [1703566836.413566759] [pi_calculator]: Publishing: "3.089616"
[talker-1] [INFO] [1703566836.413782315] [pi_calculator]: Publishing: "3.103914"
[talker-1] [INFO] [1703566836.414352904] [pi_calculator]: Publishing: "3.128205"
[talker-1] [INFO] [1703566836.414789966] [pi_calculator]: Publishing: "3.141463"
[talker-1] [INFO] [1703566836.415250241] [pi_calculator]: Publishing: "3.131243"
[listener-2] [INFO] [1703566836.423961303] [pi_listener]: Received pi estimate: "3.106060606060606"
[listener-2] [INFO] [1703566836.425561064] [pi_listener]: Received pi estimate: "3.0944741532976825"
[listener-2] [INFO] [1703566836.427250504] [pi_listener]: Received pi estimate: "3.092436974789916"
[listener-2] [INFO] [1703566836.427740802] [pi_listener]: Received pi estimate: "3.0984126984126985"
[listener-2] [INFO] [1703566836.429421557] [pi_listener]: Received pi estimate: "3.099099099099099"
[listener-2] [INFO] [1703566836.430279537] [pi_listener]: Received pi estimate: "3.089615931721195" 
```
以下同じように出力される.
但し数値は変わる.プログラムを終わらせるときは[Ctrl＋C]

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
