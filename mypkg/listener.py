# SPDX-FileCopyrightText: 2023 Nozaki 
# SPDX-License-Identifier: BSD-3-Clause 
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64  # この行を変更: Int16からFloat64に

def cb(msg):
    node.get_logger().info("Listen: %f" % msg.data)  # ログ出力のフォーマットを`%f`に変更

rclpy.init()
node = Node("pi_listener")  # ノード名変更: listenerからpi_listenerに変更しても良い
sub = node.create_subscription(Float64, "pi_value", cb, 10)  # サブスクリプションの型をFloat64に、トピック名をpi_valueに変更
rclpy.spin(node)
