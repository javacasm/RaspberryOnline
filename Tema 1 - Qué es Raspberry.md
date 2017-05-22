# Tema 1 - ¿Qué es Raspberry?


![Raspberry](./images/logoRasp.png)

Raspberry Pi se ha convertido, junto con Arduino, en uno de los máximos exponentes del desarrollo casero y profesional basado en herramientas libres, pudiendo ser una plataforma hardware de desarrollo, un pequeño ordenador personal sobre el que programar, navegar o editar un documento de texto, un reproductor de música, películas o imágenes, o la base sobre la que construir un sistema de almacenamiento en red para compartir archivos entre los equipos que tengamos conectados.

Raspberry Pi se puede convertir fácilmente, por tanto, en un ordenador versátil utilizando cualquier teclado y ratón convencional USB. Además tiene un conector Ethernet para enchufarse a la red local y a Internet y una salida HDMI de vídeo. Por sus características y bajo precio, se ha convertido en una plataforma con muchísimo potencial que contribuye a desarrollar habilidades tecnológicas, promoviendo el aprendizaje de lenguajes de programación como Python, C o Perl, llevando el mundo de la programación a todo aquel que tenga interés en aprender, experimentar y realizar sus propios proyectos.

### Objetivos del módulo

* Familiarizarse con la plataforma Raspberry Pi, aprendiendo a instalar y a usarla para
diferentes fines.
* Aprender a realizar programas sencillos usando lenguajes de scripts como Python o Shell
* Aprender a montar proyectos fáciles con electrónica que se puedan controlar desde la plataforma

![esquema](./images/esquema.png)

### Esquema del módulo

- Introducción
- Características generales de la placa Raspberry Pi. Hardware
- Primeros pasos con Raspberry Pi. Software
- Lenguaje de programación y entorno de desarrollo integrado
- Conexión con equipos electrónicos y Arduino


## Orígenes de Raspberry Pi

La intención de los creadores de Raspberry era crear un sistema barato que nos permitiera enseñar a programar a niños y adultos.

* En 2005, la Universidad de Cambridge notó como cada vez menos estudiantes quería estudiar informática

* Pensaron que la solución podía ser un ordenador superbarato con el que pudieran jugar, aprendiendo en el camino.

* Se empezó a construir en 2006, pero era difícil con la electrónica de la época
![Prototipo de Raspberry Pi](./images/prototipoRaspi.jpg)

* En 2009 ya existía la tecnología necesaria y se creó "Raspberry Pi Fundation" administrada por Eben Upton

* En 2011 aparecen los primeros prototipos y se ven factibles modelos de 25$ y 35$. Aparece el modelo B Beta

  ![Placa beta de Raspberry Pi](./images/betaPi.png)


Utiliza un diseño avanzado, como podemos ver en la imagen donde se ve que se ha colocado un chip encima de otro.

![Diseño avanzado](./images/EncapsuladoCPU-RAM.JPG)

La versión más actual es la [Versión 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) (1.2GHz quad core 1Gb Wifi y bluetooth)

![Raspberry Pi versión 3](https://www.raspberrypi.org/app/uploads/2016/02/Raspberry-Pi-3-top-down-web.jpg)

y la versión [Zero](https://www.raspberrypi.org/products/pi-zero/) (1Ghz 512Mb)

![Raspberry Pi Zero](https://www.raspberrypi.org/app/uploads/2016/02/Raspberry-Pi-Zero-web.jpg)


Puedes encontrar más detalles en la [página de la wikipedia]([Artículo de la wikipedia sobre RaspBerry Pi](https://en.wikipedia.org/wiki/Raspberry_Pi)


## Raspberry Pi vs Arduino

![vs](./images/arduinovsRaspberry.jpg)

Una pregunta muy frecuente es si para determinado proyecto es mejor usar Arduino o Raspberry Pi.

* Arduino es más robusto eléctricamente: si se produce un cortocircuito entre pines o se comente un error se apagará y reseteará pero las probabilidades de romperlo son bajas. En cambio si hacemos esto mismo con una Raspberry lo más seguro es que la dejemos inservible.

Algunas ventajas de Arduino:
* Es capaz de dar una mayor corriente por cada patilla (hasta 40mA) mientras que Raspberry Pi no puede dar más de 5mA
* Dispone de entradas analógicas, es decir, es capaz de leer valores intermedios entre 0 y 5v, no solo digitales como Raspberry Pi
* La sencillez de su funcionamiento (como microcontrolador ) le aporta una gran robustez a la hora de soportar cortes de alimentación.
* Últimamente están apareciendo diversas versiones de Arduino con mayor capacidad, soportando una programación más compleja y potente, como Yún o Galileo.

* Raspberry Pi tiene una mayor capacidad de procesamiento, lo que la hace más adecuada para determinadas tareas, como reconocimiento de imágenes o cálculos complejos, algo que sería impensable para Arduino.

  ![vs](./images/arduinovsRaspberry.png)

* Raspberry Pi dispone de mayor capacidad de almacenamiento y de memoria permitiendo utilizar programación más avanzada.

* Raspberry Pi es un entorno completo, no necesita de ningún dispositivo externo para programarse

* ¿Son incompatibles? en absoluto lo más frecuente y es usarlas conjuntamente, conectándolos y haciendo que la Raspberry actúe como cerebro y Arduino como ejecutor.

Vistas las diferencias entre los dos dispositivos queda claro que son perfectamente complementarios:

* Donde uno adolece de poco cerebro, el otro aporta gran procesamiento
* Donde uno es eléctricamente débil, el otro es robusto

## Raspberry en los medios

Han sido muchas las películas y series donde han aparecido últimamente Raspberry Pi

* [Serie Mr. Robot](http://null-byte.wonderhowto.com/how-to/hacks-mr-robot-build-hacking-raspberry-pi-0163143/): utilizan como punto de acceso externo y para inyectar datos erróneos en el sistema de control de temperatura y así poder controlarlo.

  ![Raspberry usada en Mr. Robot](http://therobotacademy.com/sites/default/files/hacks-mr-robot-build-hacking-raspberry-pi-2_0.jpg)

* CSI Cyber: lo usan como un router que les permite capturar datos de la red donde están (un parque de atracciones) y así descubren como poder controlar las atracciones.

  ![Raspberry en CSI Cyber](./images/RaspberryPi_on_CSI-Cyber.jpg)

¿Cónoces alguna aparición más en los medios? No dudes en contárnosla.

## Proyectos

Vamos a ver algunos proyectos donde se usa una (o varias) Raspberry Pi

### Enseñanza

Existen [distribuciones  educativas](https://learn.adafruit.com/adafruit-raspberry-pi-educational-linux-distro)

Podemos montar [Aulas informatica](https://www.raspberrypi.org/blog/bringing-computing-to-rural-cameroon/)

![Aula con Raspberry Pi](./images/AulaPi.jpg)

También podemos hacer un [servidor de aula con los contenidos de (Kahn Academy Offline)](http://www.raspberrypi.org/archives/3829?sf12291563=1)

	Raspebrry 35$
	SD 64Gb 50$
	Wifi USB 5$
	Caja 9$

### Instrumentación de Laboratorio

Añadiendo algo de hardware externo podemos utilizarlo como equipamiento de laboratorio.

* Generadores de onda
[DAC](https://learn.adafruit.com/mcp4725-12-bit-dac-with-raspberry-pi)

  ![dac](https://learn.adafruit.com/system/guides/images/000/000/092/medium310/DAC_Scope.png)

* [Analizador de precuencias](https://learn.adafruit.com/freq-show-raspberry-pi-rtl-sdr-scanner)

  ![analizador](https://learn.adafruit.com/system/guides/images/000/000/759/medium310/DSC00699.jpg)


### MediaCenter

Uno de los usos más frecuentes es como MediaCenter, hasta existen distribuciones dedicadas a ello.

[How to make a MediaCenter](https://learn.adafruit.com/raspberry-pi-as-a-media-center?view=all)

![Media Center with Raspberry Pi](https://learn.adafruit.com/system/assets/assets/000/005/897/medium800/raspberry_pi_xbmc_playing_music.jpg)


### Robots

![Placa para conectar Lego y Raspberry Pi](https://cdn.sparkfun.com/r/600-600/assets/8/3/6/4/0/Brick_Pi_Hookup_Guide-12.jpg)

[Raspberry y Lego Minstorm](https://learn.sparkfun.com/tutorials/getting-started-with-the-brickpi?_ga=1.260570443.733603098.1443800444)




### [Minecraft](https://learn.adafruit.com/running-minecraft-on-a-raspberry-pi)

Juega a MineCraft desde tu RaspBerry Pi

![minecraft](https://cdn-learn.adafruit.com/guides/images/000/000/389/medium310/minecraft2.jpg)


### [Kano: portátil  basado en raspberrypi](http://www.raspberrypi-spy.co.uk/2016/04/kano-computer-kit-first-impressions/)



### Cerebro de una instalación domótica

[Regulación de temperatura](https://tackk.com/nightcooling)

## Servidor NAS

Puedes usar tu Raspberry como [servidor de ficheros](https://www.adslzone.net/2016/08/24/convierte-cualquier-disco-duro-nas-gracias-la-raspberry-pi-3/)

![Raspberry Pi como servidor de ficheros](http://www.davidhunt.ie/wp-content/uploads/2013/01/IMG_7585.jpg)

### Streaming

[Radio wifi](https://learn.adafruit.com/pi-wifi-radio?view=all)


## Data crunching: supercomputación

* [Cluster de supercomputación](http://www.cyberhades.com/2014/02/19/tutorial-para-instalar-un-cluster-de-40-nodos-con-raspberry-pi/)

  ![cluster](./images/PiCluster1.JPG)

* [Minería de BitCoin](https://learn.adafruit.com/piminer-raspberry-pi-bitcoin-miner)

  ![bitcoin](./images/bcminer1_1200.jpg)

## Cámara

[SnapPiCam](https://learn.adafruit.com/snappicam-raspberry-pi-camera)

![snapPiCam](./images/snappy_cam.jpg)


## Máquina de juegos

Uno de los usos más frecuentas de la Raspberry es para jugar, su pequeño tamaño y su capacidad la hacen ideal.

* [Mame](https://learn.adafruit.com/retro-gaming-with-raspberry-pi?view=all) (Emulador de máquinas recreativas antiguas)

  ![mame](./images/gaming_joust.jpg)

* [Mini máquina recreativa](https://learn.adafruit.com/cupcade-raspberry-pi-micro-mini-arcade-game-cabinet?view=all) aprovechando si mini-tamaño

  ![mini](./images/gaming_cover.jpg)

* [Cómo instalar y jugar al clásico videojuego  Doom](https://learn.sparkfun.com/tutorials/setting-up-raspbian-and-doom?_ga=1.227922267.733603098.1443800444)

  ![Doom](./images/doom.png)

* [Minecraft](https://learn.adafruit.com/running-minecraft-on-a-raspberry-pi)

  ![minecraft](./images/minecraft.png)

## Instrumentos de tortura

No te asustes es sólo un [láser que se mueve aleatoriamente](https://learn.adafruit.com/raspberry-pi-wifi-controlled-cat-laser-toy?view=all)
 y que le encantará a tu gato

[Cuadro diabólico](https://learn.adafruit.com/creepy-face-tracking-portrait?view=all)

  ![cuadro diabólico](https://learn.adafruit.com/system/assets/assets/000/011/659/medium800/raspberry_pi_DSC00316.jpg)

## Arte

* [Ligth Painting](https://learn.adafruit.com/light-painting-with-raspberry-pi)

  ![ligth painting](https://learn.adafruit.com/system/guides/images/000/000/086/medium310/fire.jpg)

* [Iluminación con leds](https://learn.adafruit.com/neopixels-on-raspberry-pi)

  ![iluminación](./images/leds.jpg)

* [Cortina luminosa](https://learn.adafruit.com/1500-neopixel-led-curtain-with-raspberry-pi-fadecandy?view=all)

  ![cortina](https://learn.adafruit.com/system/assets/assets/000/018/739/medium800/leds_curtain-anim.gif)

### Juegos Portables

[Raspberry Pi Gameboy](https://learn.adafruit.com/pigrrl-raspberry-pi-gameboy?view=all)

![gameboy](./images/gaming_pigrrl-adabot.jpg)

[Super consola](https://learn.adafruit.com/super-game-pi?view=all)

![super](./images/gaming_hero-hands1.jpg)


[Retro consola](https://www.instructables.com/id/Breadboard-RetroPie/)

![retroconsola](./images/retroconsola.jpg)

## Teléfono

[RaspiPhone es un teléfono basado en Raspberry Pi](https://learn.adafruit.com/piphone-a-raspberry-pi-based-cellphone?view=all)

![phone](./images/RaspiPhone.jpg)

## Coche

[Datalogger de datos del coche](http://www.stuffaboutcode.com/2013/07/raspberry-pi-reading-car-obd-ii-data.html)

[Seguidor de flotas](http://www.stuffaboutcode.com/2013/10/raspberry-pi-car-cam-gps-data-map.html)

![coche](./images/coche.jpg)

### Exteriores

Su bajo peso, y los pocos periféricos de los que depende, facilitan su uso en entornos aislados

Sí que tendremos que tener en cuenta el aislamiento, para soportar las temperaturas que nos vamos a encontrar, unas buenas baterías para poder alimentarla.

Incluso podemos llegar a lanzarla al espacio, como en el proyecto [astroPi](https://astro-pi.org/)

	![espacio](http://cdn.arstechnica.net/wp-content/uploads/2012/12/balloon-electronics.jpg)

	![espa](http://cdn.arstechnica.net/wp-content/uploads/2012/12/balloon-shot.jpeg)

O volando en drone usando  [Autopilot](http://erlerobotics.com/blog/meet-the-last-autopilot-for-building-robots-erle-brain-2/)

![autopilot](https://pbs.twimg.com/media/CUAG0x8WoAAeHjp.jpg)

## Proyectos

* [Portable Raspberry](https://learn.adafruit.com/touch-pi-portable-raspberry-pi)

![portable](https://learn.adafruit.com/system/guides/images/000/000/881/medium310/hero-face3-sm.jpg)


* [MiniPortatil](https://learn.adafruit.com/mini-raspberry-pi-handheld-notebook-palmtop)

![MiniPortatil con Raspberry Pi](https://learn.adafruit.com/system/guides/images/000/001/046/medium310/hero-pitop-sm.jpg)


Más detalles en el libro "RP para agentes secretos"

### Hacking

Otra utilización cada vez más frecuente es como herramienta de Hacking, puesto que su pequeño tamaño y la cantidad de herramientas disponible la hacen ideal para estos usos.

En el libro "Raspberry Pi para agentes secretos" puedes encontrar como usarla como sniffer Wifi

Hay quien incluso la esconde dentro de una regleta [Turn a Raspberry Pi Into a Super Cheap, Packet-Sniffing Power Strip](http://lifehacker.com/six-great-diy-projects-for-hacking-computers-and-networ-1649618886)

Si por el contrario lo que quieres hacer es hackear una Raspberry Pi, en este [enlace](https://geekytheory.com/hacking-raspberry-pi/) puedes ver cómo hacerlo.


## Documentación sobre Raspberry Pi

Existe mucha documentación sobre Raspberry Pi, veamos alguna de ella.

### Revistas

La principal revista (mensual) sobre Rasperry Pi es [The MagPy](https://www.raspberrypi.org/magpi/). Es una fuente de información extraordinaria, repleta de proyectos y consejos. Se puede descargar gratuitamente pero si compras la edición en papel suele traer regalos. El famoso número 40 de la revista ¡regalaban un Rasperry Pi Zero! por los 5€ que cuesta. Ni que decir tiene que se agotó rápidamente.

Puedes descargar [todos los números](https://www.raspberrypi.org/magpi/issues/) directamente.

También ha creado un [libro de proyectos](https://www.raspberrypi.org/magpi/raspberry-pi-projects-book-2/)

### Libros

Te recomiendo estos 3 libros.  

* Programing the Raspberry Pi, Simon Monk: es un clásico y en sus 90 páginas encontrarás casi todo lo que necesitas saber para manejar y programar tu Raspberry Pi.
* Raspberry Pi for Secret Agents: tiene proyectos más avanzados
* Raspberry Pi Gamming: te enseña a hacer juegos con la Raspberry Pi


### Tutoriales

Algunos tutoriales para aprender rápidamente a manejar tu Raspberry Pi

[Raspberry pi Class (instructables)](http://www.instructables.com/class/Raspberry-Pi-Class/?utm_source=newsletter&utm_medium=email)

[Vídeo tutorial Raspberry Pi (sparkfun)](https://www.youtube.com/watch?v=b6h95jNWg1g)

[Vídeo tutorial Raspberry Pi 2 (sparkfun)](https://www.youtube.com/watch?v=jmPgdcec53s)

[Tutoriales de Adafruit](https://learn.adafruit.com/search?q=raspberry)

[Tutoriales de sparkfun](https://www.sparkfun.com/search/results?term=raspberry)
