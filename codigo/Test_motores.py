from gpiozero import Motor
from time import sleep

motorL = Motor(forward = 7, backward = 8)
motorR = Motor(forward = 9, backward = 10)

while True:
    motorL.forward()
    motorR.backward()
    sleep(5)
    motorL.backward()
    motorR.forward()
    sleep(5)

