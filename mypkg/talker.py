# SPDX-FileCopyrightText: 2023 Nozaki 
# SPDX-License-Identifier: BSD-3-Clause
import rclpy                     
from rclpy.node import Node      
from std_msgs.msg import Float64 
import random 

rclpy.init()
node = Node("pi_approximator")   
pub = node.create_publisher(Float64, "pi_value", 10)   
inside_circle = 0
total_points = 0

def cb():          
    global inside_circle, total_points
    x, y = random.random(), random.random()  # 単位正方形内にランダムな点を生成
    distance = x**2 + y**2  # 原点からの距離の二乗を計算
    if distance <= 1:
        inside_circle += 1  # 点が単位円の内部にあるかチェック
    total_points += 1
    pi_estimate = 4 * inside_circle / total_points  # πの近似値を計算
    
    msg = Float64() 
    msg.data = pi_estimate 
    pub.publish(msg)  # PIの近似値をパブリッシュ

    # ここでは3.1415で止まる正確な条件は実装していません。
    
    if total_points % 20000 == 0:
        node.get_logger().info('Pi approximate value: %f' % pi_estimate)

node.create_timer(0.5, cb)  
rclpy.spin(node)
