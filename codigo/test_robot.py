from gpiozero import Robot
from time import sleep
robby = Robot(left=(7,8), right=(9,10))
robby.forward(0.4)
sleep(5)
robby.right(0.4)
sleep(5)
robby.stop()