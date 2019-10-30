# Tema 5 - Programando con Raspberry Pi

En este tema veremos como programar con nuestra Raspberry Pi.

## Programación en la Raspberry Pi

Existen distintas alternativas, dependiendo de los conocimientos previos, para programar en la Raspberry Pi.

[Vídeo: Programación con Raspberry Pi](https://youtu.be/vpWt8iOGArM)

* Scratch: para gente sin conocimientos previos de programación
* Python: lenguaje profesional, se necesitan otras habilidades (manejo de editores,...)
* Shell script: creando ficheros scripts podemos automatizar tareas

Existen diversas distribuciones destinadas completamente a usar la Raspberry como entorno de programación, algunos de ellos nos permiten aprender de una forma sencilla otros lenguajes.

Principalmente están pensados para facilitar la instalación de los entornos, que suele ser lo más complicado

* [Coder](https://googlecreativelab.github.io/coder/) Instala un servidor con todo lo necesario para montar un aula de aprendizaje de programación web

	Tiene varios [proyectos](https://googlecreativelab.github.io/coder-projects/) de diferente complejidad, con tutoriales

* [WebIDE](https://learn.adafruit.com/webide?view=all) Entorno Web que permite programar en Python, Ruby, Javascript y otros lenguajes

![WebIDE](https://cdn-learn.adafruit.com/assets/assets/000/002/173/medium800/adafruit_products_Using2.jpg)

## Scratch

Es un entorno de programación gráfico que nos permite hacer programas usando bloques.

Podemos probarlo [online](https://scratch.mit.edu/projects/editor/), y además nuestra Raspberry incluye diferentes versiones en forma de aplicaciones para las versiones 1, 2 y 3

![scratch](./images/scratch.png)


Está pensado para enseñar a programar sin la complejidad de la sintaxis.


* [Code.org](Code.org)

Sin duda para empezar a programar lo mejor es empezar por Code

![code](./images/code.png)

### Scratch en nuestra Raspberry Pi

La imagen Raspbian trae instalada la versión de Scratch, en las últimas versiones ya está disponible Scratch 3

![Usando Scratch en Raspberry Pi](./images/ScratchRaspberry.png)

[Vídeo sobre cómo programar con Scratch en Raspberry Pi](https://youtu.be/6veM85OpsKI)

Para usar la aplicación Scratch 3, es necesario una gran cantidad de RAM, al menos 1Gb sólo para la aplicación por lo que no se recomienda de momento su uso salvo en la Raspberry 4 con al menos 2 Gb de RAM

[Vídeo de Scratch 3 en un Raspberry 4](https://youtu.be/mMYKjVri3QI) 

## Shell Script

Los scripts son ficheros donde introducimos distintas órdenes que se irán ejecutando de forma consecutiva una tras otra

Vamos a ver algunos ejemplos de cómo utilizarlos junto con la cámara. Para ellos usaremos algunos de los comandos que tenemos para usar la cámara

### Usando la cámara

Empezaremos conectando la cámara

![Camara de Raspberry Pi](./images/camara.jpg)

La cámara tiene su propio conector, junto al conector HDMI

Para conectarla pondremos el cable de la manera que se ve en la imagen

![Cable de la Cámara](./images/Pi-camera-Socket.jpg)


Antes de poder utilizarla tenemos que activarla

		sudo raspi-config


![Configuración para activar la cámara](./images/activaCamara.png)

Necesitamos reiniciar para que arranquen adecuadamente los drivers.

Podemos probarla con este comando

        raspistill -v -o test.jpg
        
Que mostrará lo que enfoca la cámara durante 5 segundos y luego guardará una imagen en el fichero test.jpg


Tenemos 2 aplicaciones para usar la cámara

		raspistill


Tomará imágenes fijas

		raspivid

grabará un vídeo

### Imágenes estáticas

Si queremos cambiar el retardo con el se captura, usamos la opción -t indicando el tiempo en milisegundos:

		raspistill -o myimage.jpg -t 3000

Este programa tiene muchas opciones que podemos ver:

		raspistill | less
		-?, --help
		: This help information
		-w, --width
		: Set image width <size>
		-h, --height : Set image height <size>
		-q, --quality : Set jpeg quality <0 to 100>
		-o, --output : Output filename <filename>
		-v, --verbose : Output verbose information during run
		-t, --timeout : Time (in ms) before taking picture
		(if not specified, set to 5s)
		-th, --thumb
		: Set thumbnail parameters (x:y:quality)
		-d, --demo
		: Run a demo mode
		-e, --encoding : Output format (jpg, bmp, gif, png)
		-tl, --timelapse : Timelapse mode. Takes a picture every <t>ms
		-p, --preview : Preview window settings <'x,y,w,h'>
		-f, --fullscreen : Fullscreen preview mode
		-n, --nopreview : Do not display a preview window
		-sh, --sharpness : Set image sharpness (-100 to 100)
		-co, --contrast : Set image contrast (-100 to 100)
		-br, --brightness : Set image brightness (0 to 100)
		-sa, --saturation : Set image saturation (-100 to 100)
		-ISO, --ISO
		: Set capture ISO
		-vs, --vstab
		: Turn on video stablisation
		-rot, --rotation : Set image rotation (90,180,270)
		-hf, --hflip
		: Set horizontal flip
		-vf, --vflip
		: Set vertical flip

Entre estas opciones podemos encontrar **-tl** que nos va a permitir tomar una imagen cada cierto tiempo. Con ello podemos generar una secuencia de imágenes con una sola línea de comando

		raspistill -o myimage_%d.jpg -tl 2000 -t 25000

Una imagen cada 2 segundos durante 25 segundos Cada foto tendrá un número de secuencia

		myimage_1.jpg
		myimage_2.jpg
		myimage_3.jpg
		myimage_4.jpg
		...

 Si deseamos utilizar un formato de nombre más complejo, siempre podemos usar un script como el siguiente que además guardará las imágenes en una carpeta

		SAVEDIR=/var/tlcam/stills
		while [ true ]; do
		filename=$(date -u +"%d%m%Y_%H%M-%S").jpg
		/opt/vc/bin/raspistill -o $SAVEDIR/$filename
		sleep 4;
		done;

[Vídeo: Trabajando con Shell  Scripts Raspberry pi](https://youtu.be/L5HfjbKyth0)

### Vídeo

raspivid  nos va a permitir grabar vídeos. Para capturar 5s de vídeo en formato h264 utilizaremos:

	raspivid -o video.h264

Si queremos capturar 10 segundos usaremos:

	raspivid -o video.h264 -t 10000

Para ver todas las opciones disponibles podemos hacer

	$raspivid | less

Para una documentación más detallada sobre las opciones del ejecutable se puede consultar el siguiente [enlace](https://www.raspberrypi.org/documentation/raspbian/applications/camera.md)

### Webcam

También podemos usar cámaras USB compatibles  como  la PS3 Eye.

Veremos si se ha detectado con:

	$ ls -l /dev/video*

Si se detecta

![Camara USB detectada](./images/webcamdetected.png)

Instalamos fswebcam

	 sudo apt-get install fswebcam

Que nos permitirá tomar una imagen con

	 fswebcam -d /dev/video0 -r 640x480 test.jpeg

Hagamos ahora un script para hacer un timelapse, que nos es otra cosa que un programa que ejecuta comandos de una forma determinada.

Primero creamos un fichero con este contenido. Por ejemplo con el editor geany

	geany ~/runtimelapse.sh 

El contenido será el siguiente

	#!/bin/bash
	# Timelapse controller for USB webcam
	DIR=/home/pi/timelapse
	x=1
	while [ $x -le 1440 ]; do
		filename=$(date -u +"%d%m%Y_%H%M-%S").jpg
		fswebcam -d /dev/video0 -r 640x480 $DIR/$filename
		x=$(( $x + 1 ))
		sleep 10;
	done;

Una vez guardado, vamos a darle permiso para ejecutarlo.

	chmod u+x ~/runtimelapse.sh

Lo ejecutamos con

	~/runtimelapse.sh

Podemos ver que se están realizando capturas de imágenes cada 10 segundos y como mucho se guardarán 1440 imágenes.


### Control remoto de cámaras

![Controlando una cámara profesional](./images/camaraPro.png)

También podemos controlar cámaras profesionales que suelen admitir conexión USB (como por ejemplo una Canon Rebel T4i / 650D)

Utilizaremos el software gphoto2 que  instalaremos con

	 	sudo apt-get install gphoto2

Podemos controlar casi todos los valores de exposición, ISO, etc de nuestra cámara remotamente, pero para no complicarnos vamos a suponer que la usamos en modo automático.

Podemos capturar una imagen, que se mantendrá en la cámara con:

		$ gphoto2 --capture-image

Para tomar una imagen y enviarla a la raspberry usaremos

		$ gphoto2 --capture-image-and-download

La librería gphoto2 por defecto guarda las imágenes en la memoria RAM de la Raspberry (no en la SD) con lo que es necesario que lo configuremos para evitar perderlas al cortar la alimentación.

		$ gphoto2 --get-config /main/settings/capturetarget

Para establecer nuestro almacenamiento usaremos:

		$ gphoto2 --set-config /main/settings/capturetarget=NuestroDirectorio

Veamos ahora como hacer un time-lapse, es decir capturar las imágenes cada
cierto tiempo. Usaremos el siguiente comando.

		$ gphoto2 --capture-image -F 1440 -I 30

Que almacenará en la cámara un máximo de 1440 imágenes tomadas cada 30
segundos

### Convertir fotos a vídeo

Una vez tengamos todas las imágenes podemos generar un vídeo con ellas.

Instalamos un software llamado mencoder que será el que genere el vídeo.

		$ sudo apt-get install mencoder

 Ahora generamos un fichero que contenga todas las imágenes que queremos unir en el vídeo

		$ cd timelapse
		$ ls *.jpg* > list.txt


Y ejecutamos memcoder con los parámetros adecuados (es una sóla línea)

		$ mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4:aspect=16/9:vbitrate=8000000 -vf scale=640:480 -o timelapse.avi -mf type=jpeg:fps=24 mf://@list.txt

Con esto generaremos un vídeo de 640x480 de resolución, con nombre timelapse.avi codificado en mpeg4, a 24 frame por segundo y con las imágenes cuyos nombres se incluyen en el fichero list.txt

Si queremos hacer un vídeo a partir de las imágenes tomadas con la cámara original de Raspberry usaremos el siguiente comando

		$ mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4:aspect=16/9:vbitrate=8000000 -vf scale=1920:1080 -o tlcam.avi -mf type=jpeg:fps=24 mf://list.txt

Hay que tener cuidado de no llenar el almacenamiento, puesto que este proceso consume mucho espacio

## Python


Es un lenguaje moderno de gran productividad, sencillo, potente y con millones de líneas ya desarrolladas que se pueden usar directamente por medio de paquetes instalables

Se utiliza en la web, en aplicaciones de escritorio, etc... Gran parte del interface de linux lo utiliza

Existen dos versiones de python ahora mismo: la rama 2.x y la 3.x
Por sencillez vamos a usar la sintaxis de la rama 2.x

[Video: Python en Raspberry Pi](https://youtu.be/Yy2oad1Xnoo)

Podemos utilizar la herramienta Idle o python directamente para programar con él.

![Herramienta idle](./images/idle.png)

Es más sencillo si escribimos nuestro código en un fichero (con cualquier editor de texto) y luego lo ejecutamos o bien abriéndolo con idle o haciendo:

    python fichero.py

En las últimas versiones se incluye el editor Thonny, que nos permite trabajar con pyhton con facilidad

![Editor Thonny](./images/Thonny.png)

Veamos algunos ejemplos

## Operaciones numéricas y petición de datos al usuario

[Código de Suma](https://github.com/javacasm/RaspberryOnline/blob/master/codigo/suma.py)

```python
# Programa que realiza la suma de dos valores
a=input('numero 1 ');
b=input('numero 2 ');
suma = int(a) + int (b);
print (suma);
```

**Ejercicio**: cambia la operación a realizar

### Sentencias de control condicionales

[Código de Bisiesto](https://github.com/javacasm/RaspberryOnline/blob/master/codigo/bisiesto.py)

```python
# Programa que determina si un año es o no bisiesto
year = input('Introduzca el anio: ');
if ((year%400)==0  or (year % 100) ==0 or (year%4)==0):
  print
	'Es bisiesto!!';
else:
  print 'No es bisiesto!!';
```

[Código de días por mes](.https://github.com/javacasm/RaspberryOnline/blob/master/codigo/diasMes.py)

```python
# Nos da los dias que tiene el mes seleccionado
mes = input('Introduce el mes:');
year = input('Introuce el anio:');
# Comprobamos si es entero
if type(mes) == int:
  # Comprobamos si esta entre 1 y 12
  if (mes>=1) and (mes<=12):
    if mes == 2:
      if(year%400 == 0) or (year%100 ==0) or (year %4 == 0):
        dias = 29;
      else:
        dias =28;
    elif (mes==4) or (mes==6) or (mes==9) or (mes==11):
      dias = 30;
    else:
      dias = 31;
    print 'El mes '+str(mes) +' del anio '+str(year)+' tiene '+str(dias)+ ' dias';
  else:
    print 'El mes debe ser entre 1 y 12';
else:
  print 'El mes debe ser entero';
```

### Sentencias de control de repetición

[Código de Buscando Caracteres](https://github.com/javacasm/RaspberryOnline/blob/master/codigo/buscaCaracter.py)

```python
# Cuenta las veces que se repite un caracter en una palabra
word= 'palabra';
caracter = 'a';
contador=0;
mensaje='No se ha encontrado el caracter :('
for i in range(len(word)):
  if (word[i]==caracter):
    mensaje='se ha encontrado el caracter!!!';
    contador=contador+1;

print mensaje;
print 'Se encontrado '+str(contador)+' veces';
```

**Ejercicio**: haz que el usuario pueda introducir la cadena donde buscar y el carácter

## Python y la cámara

Veamos un par de sencillos ejemplos sobre cómo utilizar la cámara de python

Empecemos mostrando la previsualización y luego guardando una imagen

		# Ejemplo basico de previsualizacion y captura con la camara
		# captest_basico_imagen.py
		# Mas detalles en https://projects.raspberrypi.org/en/projects/getting-started-with-picamera

		from picamera import PiCamera
		from time import sleep

		camera = PiCamera()

		camera.start_preview() # muestra la previsualizacion
		sleep(5) # espera 5 segundos
		camera.capture('/home/pi/Desktop/image.jpg') # guarda la imagen
		camera.stop_preview() # cierra la previsualizacion

Si lo que queremos es grabar vídeo, el código sería el siguiente

		from picamera import PiCamera
		from time import sleep

		camera = PiCamera()

		camera.start_preview()
		camera.start_recording('/home/pi/Desktop/video.h264')
		sleep(5)
		camera.stop_recording()
		camera.stop_preview()

Mas detalles en https://projects.raspberrypi.org/en/projects/getting-started-with-picamera

Si entrar en muchos detalles, vamos a ver un sencillo [ejemplo](https://github.com/javacasm/RaspberryOnline/blob/master/codigo/T5_camara.py) de cómo integrar la cámara dentro de nuestro programa python


		import picamera
		import pygame
		import io

		# Init pygame 
		pygame.init()
		screen = pygame.display.set_mode((0,0))

		# Init camera
		camera = picamera.PiCamera()
		camera.resolution = (1280, 720)
		camera.crop = (0.0, 0.0, 1.0, 1.0)

		x = (screen.get_width() - camera.resolution[0]) / 2
		y = (screen.get_height() - camera.resolution[1]) / 2

		# Init buffer
		rgb = bytearray(camera.resolution[0] * camera.resolution[1] * 3)

		# Main loop
		exitFlag = True
		while(exitFlag):
			for event in pygame.event.get():
				if(event.type is pygame.MOUSEBUTTONDOWN or 
				   event.type is pygame.QUIT):
				    exitFlag = False

			stream = io.BytesIO()
			camera.capture(stream, use_video_port=True, format='rgb')
			stream.seek(0)
			stream.readinto(rgb)
			stream.close()
			img = pygame.image.frombuffer(rgb[0:
				  (camera.resolution[0] * camera.resolution[1] * 3)],
				   camera.resolution, 'RGB')

			screen.fill(0)
			if img:
				screen.blit(img, (x,y))

			pygame.display.update()

		camera.close()
		pygame.display.quit()

