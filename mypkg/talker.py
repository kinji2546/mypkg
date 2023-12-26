import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import random

# ROS2クライアントライブラリの初期化
rclpy.init()

# ノードのインスタンスを作成
node = Node("pi_approximator")

# パブリッシャーを作成
publisher = node.create_publisher(Float64, 'pi_value', 10)

# グローバル変数を初期化
inside_circle = 0
total_points = 0
should_continue = True

def cb():
    global inside_circle, total_points, should_continue
    # ランダムな点を生成
    x, y = random.random(), random.random()
    distance = x**2 + y**2
    
    # 点が単位円内にあるか判定
    if distance <= 1:
        inside_circle += 1
    total_points += 1
    
    # πの近似値を計算
    pi_estimate = 4 * inside_circle / total_points

    # πの近似値をパブリッシュ
    msg = Float64()
    msg.data = pi_estimate
    publisher.publish(msg)

    # πが所定の範囲内にあるかチェック
    if 3.14150 < pi_estimate <= 3.14159:
        node.get_logger().info(f'Pi approximate value in range (3.14150, 3.14159]: {pi_estimate}')
        node.get_logger().info('Publishing stopped.')
        should_continue = False  # 処理を中断するフラグを更新
        timer.cancel()  # タイマーコールバックをキャンセル
        rclpy.shutdown()  # ROS2 のループを停止
    if total_points % 20000 == 0:
        node.get_logger().info(f'Pi approximate value: {pi_estimate}')

# タイマーを作成してコールバック関数を定期的に実行
timer = node.create_timer(0.5, cb)

# ウェイト可能なイベントやタイマーがなくても定期的にループから抜けるためのタイムアウトを設定
timeout = 0.1  # 0.1秒

try:
    # should_continueがTrueである間、イベントループを実行
    while should_continue:
        # タイムアウトを指定してイベントループを1回だけ処理
        rclpy.spin_once(node, timeout_sec=timeout)
finally:
    # プログラム終了前にリソースを適切に解放
    node.destroy_timer(timer)
    node.destroy_node()
    rclpy.shutdown()
