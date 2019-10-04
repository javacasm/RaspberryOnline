from gpiozero import Button
button = Button(2)

button.wait_for_press() ## El programa espera hasta que se pulse el boton
print('Me has pulsado')