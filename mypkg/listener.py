# SPDX-FileCopyrightText: 2023 Nozaki 
# SPDX-License-Identifier: BSD-3-Clause 
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64  # 変更:Int16からFloat64に

def cb(msg):
    node.get_logger().info("Listen: %f" % msg.data)

rclpy.init()
node = Node("pi_listener")  # ノード名変更:pi_listenerに変更
sub = node.create_subscription(Float64, "pi_value", cb, 10)  #トピック名をpi_valueに変更
rclpy.spin(node)
