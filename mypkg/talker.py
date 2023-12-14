import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import random

class PiCalculator(Node):
    def __init__(self):
        super().__init__('pi_calculator')
        self.publisher_ = self.create_publisher(Float64, 'pi_estimate', 10)
        self.timer = self.create_timer(1.0, self.publish_pi_estimate)

    def calculate_pi(self, num_points):
        inside_circle = 0
        for i in range(num_points):
            x = random.uniform(-1.0, 1.0)
            y = random.uniform(-1.0, 1.0)
            if x**2 + y**2 <= 1.0:
                inside_circle += 1
        return (4 * inside_circle) / num_points

    def publish_pi_estimate(self):
        num_points = 10000
        pi_estimate = self.calculate_pi(num_points)
        msg = Float64()
        msg.data = pi_estimate
        self.publisher_.publish(msg)

def main():
    rclpy.init()
    pi_calculator = PiCalculator()

    rclpy.spin(pi_calculator)

    pi_calculator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
