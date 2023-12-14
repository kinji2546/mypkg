import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64

class PiListener(Node):
    def __init__(self):
        super().__init__('pi_listener')
        self.subscription = self.create_subscription(
            Float64,
            'pi_estimate',
            self.listener_callback,
            10)
        self.subscription  # prevent unused variable warning

    def listener_callback(self, msg):
        self.get_logger().info('Received pi estimate: "%s"' % msg.data)

def main(args=None):
    rclpy.init(args=args)
    pi_listener = PiListener()
    rclpy.spin(pi_listener)

    pi_listener.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
