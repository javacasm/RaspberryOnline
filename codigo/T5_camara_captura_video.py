# Ejemplo basico de previsualizacion y captura de video con la camara
# captest_basico_video.py
# Mas detalles en https://projects.raspberrypi.org/en/projects/getting-started-with-picamera

from picamera import PiCamera
from time import sleep

camera = PiCamera()

camera.start_preview()
camera.start_recording('/home/pi/Desktop/video.h264')
sleep(5)
camera.stop_recording()
camera.stop_preview()
