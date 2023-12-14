import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import random

class PiCalculator(Node):

    def __init__(self):
        super().__init__('pi_calculator')
        self.publisher_ = self.create_publisher(Float64, 'pi_estimate', 10)
        timer_period = 1  # seconds
        self.timer = self.create_timer(timer_period, self.publish_pi_estimate)
        self.total_points = 0
        self.inside_circle = 0

    def calculate_pi(self, num_points):
        for _ in range(num_points):
            x, y = random.random(), random.random()
            if x**2 + y**2 <= 1.0:
                self.inside_circle += 1
            self.total_points += 1
        return (4 * self.inside_circle) / self.total_points

    def publish_pi_estimate(self):
        pi_estimate = self.calculate_pi(1000000)
        msg = Float64()
        msg.data = pi_estimate
        self.publisher_.publish(msg)
        self.get_logger().info('Publishing: "%f"' % msg.data)

def main(args=None):
    rclpy.init(args=args)
    pi_calculator = PiCalculator()
    rclpy.spin(pi_calculator)
    pi_calculator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
