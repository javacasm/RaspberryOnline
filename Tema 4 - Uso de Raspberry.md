# Tema 4 - Uso de Raspberry Pi

En este tema vamos a ver los usos normales de Raspberry Pi.

Dado que el uso de los típicos programas de ofimática o similares es idéntico al que se hace en otros ordenadores nos vamos a hablar de ellos.

Nos centraremos en los usos más típicos donde se trabaja con la consola/terminal. Es el típido uso que se hace en los sistemas Linux. La mayoría de los veremos se puede hacer en los sistemas con Linux de las distribuciones [Debian](https://www.debian.org/index.es.html) y [Ubuntu](https://www.ubuntu.com/) en los que está basado Raspbian.

## Mantenimiento

Una vez instalado el sistema, necesitamos de vez en cuando actualizarlo. Veamos como hacerlo.

### Actualización (update)

Desde un terminal/consola tecleamos lo siguiente

Para buscar cambios

	sudo apt-get update

Para instalar estos cambios

	sudo apt-get upgrade

Para actualizar el sistema

	sudo apt-get dist-upgrade

Para instalar un paquete determinado

	sudo apt-get install paquete

Vemos como en todos los comandos utilizamos la palabra "sudo" esto es debido a que se necesitan privilegios de administrador para todo lo relacionado con la actualización del sistema.


[Vídeo: Actualizar e instalar software desde terminal en Raspberry Pi](https://youtu.be/BaVfTWFUHtU)

Siempre podemos instalar desde la herramienta visual "Añadir programas" en el menú Preferencias.

[Vídeo: Cómo actualizar e instalar software Raspberry Pi](https://youtu.be/3eeIHe-NCZs)

## Problemas

Siempre podemos encontrarnos con problemas. Veamos los más frecuentes

### Alimentación

Necesitamos un mínimo de 2A, si la alimentación está por debajo se pueden producir cuelgues inesperados e incluso que no arranque.

### Velocidad de la tarjeta

Se recomienda velocidad 10, una velocidad menor da problemas como bloqueos

### Espacio en disco

Al menos 4Gb por sistema operativo, mejor 8Gb o más

### No se ve nada en el monitor

¿Lo arrancaste con el monitor conectado? Es necesario arrancar con el monitor conectado.


## Manejando tu Raspberry Pi

Como sabes es una máquina Linux, con lo que podrás manejarla igual que se maneja cualquier otra máquina Linux


### Consola (línea de comandos)

![console](./images/console.png)

#### Comandos básicos:

[Vídeo: Uso del terminal y comandos Linux en Raspberry Pi](https://youtu.be/BF0Kjb4g454)

Veamos algunos de los comandos más utilizados:

* La tecla Tabulador nos permite completar el nombre del fichero/directorio
* **ls** : muestra los archivos y directorios ( **ls -l** para más detalles y **ls -a** para mostrar todos)
* **cd** : cambia de directorio (**cd ~** nos lleva a nuestro directorio home y **cd ..** sale del directorio actual)
* **chmod** : cambia los permisos de un fichero/directorio (**chmod ugo-w fichero** quita todos los permisos de escritura)
* **pwd** : nos dice el directorio actual
* **mv** : mueve directorios/ficheros a un nuevo destino
* **rm** : borra directorios/ficheros
* **mkdir** : crea un directorio
* **passwd** : cambia la contraseña del usuario actual
* **ps -ef** : muestra los procesos en ejecución
* **top** : administrador de tareas
* **clear** : borra todo el contenido del terminal
* **df** : muestra el % de disco ocupado
* **nano** : editor de texto básico
* **vi** : editor de texto avanzado pero complejo
* **du** : muestra lo que ocupa un directorio (**du -s *** muestra lo que ocupa un directorio y todo lo que contiene)
* **sudo halt** apaga la raspberry
* **sudo shutdown -h now** apaga la raspberry
* **history** : muestra todos los comandos que se han ejecutado antes. Podemos ejecutar el comando de la posición n, con !n . Las teclas abajo/arriba del cursor nos permiten iterar por los comandos usados.
* **man comando**: Para obtener ayuda sobre comando
* Para hacer fichero script: añadimos los comandos, chmod u+x fichero y para ejecutarlo ./fichero


#### Usuarios

El usuario por defecto es "**pi**" con contraseña "**raspberry**"

#### Cuidado con sudo

Nos da todo el poder del usuario administrador (**root**)

### Interface gráfico

Para arrancar el interface gráfico (si no está arrancado) usaremos

		startx


![startx](./images/raspX.png)

### Acceso remoto

Algo muy frecuente es que queramos acceder a nuestra Raspberry Pi remotamente, es decir sin un teclado ni monitor conectado directamente. Evidentemente necesitamos tener un SO instalado y habilitar el acceso remoto. Veamos algunas de las formas de hacerlo.

### SSH (vía consola)

[Vídeo: Conexión vía SSH a Raspberry Pi](https://youtu.be/-BH3spberkc)

SSH es el protocolo de acceso por consola

Tenemos que activarlo en la configuración para poder acceder desde fuera.Entramos en la configuración avanzada

	sudo raspi-config

![ssh](./images/ssh.png)

Podemos hacerlo también por comandos con

	sudo service ssh start
	sudo insserv ssh

Ahora podremos conectarnos remotamente con ssh

	ssh pi@192.189.0.123

O bien usando algún software como [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)

Conviene cambiar la contraseña para evitar que cualquiera pueda acceder


### vnc

VNC es un protocolo que nos permite acceder remotamente al escritorio de otra máquina.

En las nuevas versiones de Raspbian podemos activar VNC desde la configuración (raspi-config).

Si no está disponible podemos instalarlo en nuestra Raspberry de manera sencilla con:

	sudo apt-get install tightvncserver

Este software requiere que un servicio se ejecute al arrancar si queremos acceder en cualquier momento. Podemos instalarlo añadiendo la siguiente línea al archivo **/etc/rc.local**


	su -c "/usr/bin/tightvncserver :1 -geometry 800x600 -depth 16" pi

![vnc](./images/vnc.png)

Ahora accederemos usando un cliente vnc


### Acceso directo

Vamos a configurar nuestra raspberry y un portátil con Ubuntu para facilitar al máximo la conexión y así no tener que utilizar muchos componentes. De esta manera podremos trastear con un kit mínimo, evitando tener que usar un teclado, ratón y sobre todo un monitor.

![Conexión directa entre Raspberry y Portatil](http://blog.elcacharreo.com/wp-content/uploads/2013/05/20130501_003523-150x150.jpg)

En concreto usaremos símplemente un cable de red (ethernet) y un cable micro-usb para alimentar la raspberry.

Con esta configuración no podemos consumir en total más de los 500mA que proporciona el USB.

Tendremos que modificar ficheros de configuración en el PC y en la raspberry.

Asumiremos que tenemos conexión a internet via Wifi y utilizaremos el cable ethernet para dar conectividad a la raspberry. Crearemos una red entre el portátil y la raspberry creando una subred distinta y haremos que el portátil actúe como gateway de esa red enrutando los paquetes hacia la raspberry y dándole acceso a internet.

Comencemos editando la configuración del pc, para lo que ejecutaremos en el pc:

	sudo vi /etc/network/interfaces

y dejamos el contenido del fichero (la red que se usa normalmente es las 192.168.1.x de ahí que el gateway sea 192.168.1.1 que es el real)

![Configuración inicial de la red local](http://blog.elcacharreo.com/wp-content/uploads/2013/05/paso1.png)

Ahora vamos a editar la configuración de la raspberry. La forma más sencilla es editando los ficheros de configuración desde el pc, para lo que insertamos la tarjeta sd de la raspberry (obviamente con esta apagada) en el pc y ejecutamos en este:

	sudo vi /media/10b4c001-2137-4418-b29e-57b7d15a6cbc/etc/network/interfaces

Quedando el mismo:

![Configuración final de la red local](http://blog.elcacharreo.com/wp-content/uploads/2013/05/paso2.png)

Ahora, colocamos la tarjeta sd en la raspberry y volvemos a encenderla


Conectamos el cable ethernet entre los dos

En el PC hacemos comprobamos que la tarjeta eth0 está ok y con la ip correspondiente, haciendo

	ifconfig /all

Veremos que aparece el interface eth0 con ip 192.168.0.80

Ahora vamos a hacer que el portátil actúe como router. Para ello ejecutamos los siguientes comandos

	sudo su -
	root@ubuntu-asus:~# echo 1 > /proc/sys/net/ipv4/ip_forward
	root@ubuntu-asus:~# /sbin/iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

Por último editamos el fichero de configuración de DNS con

	sudo vi /etc/resolv.conf

y lo dejamos así

![Configuración de servidor de nombres](http://blog.elcacharreo.com/wp-content/uploads/2013/05/paso3.png)


Ahora solo falta probar que tenemos conectividad, haciendo un ping

	ping 192.168.0.90

Si todo es correcto ya podremos acceder via ssh o  VNC

## Usos

Veamos cómo podemos utilizar lo aprendido...

### Para hacer cálculos con Mathematica

Hay una versión gratuita (para uso no comercial) de Worlfram  Mathematica instalada por defecto en Raspbian

![Mathematica en Raspberry Pi](./images/Mathematica.png)

[Vídeo: Trabajando con Mathematica en Raspberry](https://youtu.be/VVHoREZ8Rc4)


### Vigilancia

Podemos usar su cámara (la original o una USB)

Usaremos un software standard de Linux: motion

	sudo apt-get install motion

Editamos la configuracion

	sudo nano /etc/motion/motion.conf

![usando motion](./images/motion.jpg)

Lo arrancamos

	montion -n


Podremos acceder a la imagen en vivo de la cámara con

	 http://rasperry_ip:8081
