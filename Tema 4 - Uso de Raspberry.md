# Tema 4 - Uso de Raspberry Pi

En este tema vamos a ver los usos normales de Raspberry Pi.

Dado que el uso de los típicos programas de ofimática o similares es idéntico al que se hace en otros ordenadores nos vamos a hablar de ellos.

Nos centraremos en los usos más típicos donde se trabaja con la consola/terminal. Es el típido uso que se hace en los sistemas Linux. La mayoría de los veremos se puede hacer en los sistemas con Linux de las distribuciones [Debian](https://www.debian.org/index.es.html) y [Ubuntu](https://www.ubuntu.com/) en los que está basado Raspbian.

## Mantenimiento

Una vez instalado el sistema, necesitamos de vez en cuando actualizarlo. Veamos como hacerlo.

### Actualización (update)

Desde un terminal/consola tecleamos lo siguiente

Para buscar cambios

	sudo apt update

Para instalar estos cambios

	sudo apt upgrade

Para actualizar el sistema

	sudo apt dist-upgrade

Para instalar un paquete determinado

	sudo apt install paquete

Vemos como en todos los comandos utilizamos la palabra "sudo" esto es debido a que se necesitan privilegios de administrador para todo lo relacionado con la actualización del sistema.


[Vídeo: Actualizar e instalar software desde terminal en Raspberry Pi](https://youtu.be/BaVfTWFUHtU)

#### Actualización de los distintos firmware

Los diferentes componentes de la Raspberry necesitan de varios firmwares para funcionar, que también conviene tener actualizados. Podemos actualizarlos con


	sudo rpi-update

#### Instalación de programas

Además de la línea de comandos, siempre podemos instalar desde la herramienta visual "Añadir programas" en el menú Preferencias.

[Vídeo: Cómo actualizar e instalar software Raspberry Pi](https://youtu.be/3eeIHe-NCZs)

#### Instalación de paquetes a partir del código fuente

* Descargamos el código fuente (normalmente comprimido)
* Lo descomprimimos con

	unzip codigo_fuente.zip

ó

	tar xvf cofigo_fuente.tgz

(según el formato en el que esté comprimido)

Dentro del directorio del código ya descomprimido normalmente encontramos un fichero README o INSTALL que nos dará las instrucciónes, pero suelen ser muy parecidas a estas:

Preparan el código para que compile en nuestro sistema y además comprueban que tengamos las herramientas y librerías necesarias con:

	cmake .

ó

	configure

Compila el código y generamos un ejecutable

	make

Lo instalamos en el sistema (por eso necesitamos usar sudo)

	sudo make install

## Problemas habituales

Siempre podemos encontrarnos con problemas. Veamos los más frecuentes

### Alimentación

Necesitamos un mínimo de 2A (3A para V4), si la alimentación está por debajo se pueden producir cuelgues inesperados e incluso que no arranque.

Cuando la Raspberry detecta que no tiene suficiente alimentación visualiza un rayo amarillo en la pantalla

![Problemas de alimentación. Fuente RasberryParaTorpes](https://i0.wp.com/raspberryparatorpes.net/wp-content/uploads/2018/02/raspberry-pi-under_volt.jpg?resize=500%2C300&ssl=1)

### Velocidad de la tarjeta

Se recomienda velocidad 10, una velocidad menor da problemas como bloqueos

### Espacio en disco

Al menos 8Gb por sistema operativo, mejor 16Gb o más

### No se ve nada en el monitor

¿Lo arrancaste con el monitor conectado? Es necesario arrancar con el monitor conectado.


## Manejando tu Raspberry Pi

Como sabes es una máquina Linux, con lo que podrás manejarla igual que se maneja cualquier otra máquina Linux


### Consola (línea de comandos)

Podemos hacer casi todo desde el habitual entorno gráfico, pero también desde el terminal o la consola, también llamada líneas de comandos.

Si te acostumbras a usarla verás que ganas en productividad y además verás que puedes automatizar muchas tareas. 

![consola](./images/console.png)

#### Comandos básicos:

[Vídeo: Uso del terminal y comandos Linux en Raspberry Pi](https://youtu.be/BF0Kjb4g454)

Como ya hemos dicho, Raspbian es una versión de [Linux](https://es.wikipedia.org/wiki/GNU/Linux), que nos más que una versión moderna del sistema operativo [Unix](https://es.wikipedia.org/wiki/Unix). Por esto tenemos acceso a los comandos de esos sistemas operativos.

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


#### Estructura de ficheros

Algunas características de sistema de fichero de linux

* Usa un formato de partición ext4 (también existen aunque en desuso el ext3 y el ext2), aunque permite usar FAT
* El árbol de directorios tiene un único directorio raíz del que cuelga todo. Todos los dispositivos (pen drives, discos externos, discos de red) se integran dentro de este árbol, **montando** su raiz en un directorio determinado (montamos y desmontamos con __mount__ y __unmonut__ )

El usuario sólo acceso a su directorio y el solo el administrador (**root**) puede acceder al resto de directorios

##### Algunos directorios

* / raiz
* /etc configuración
* /home usuario
* /usr programas para usuarios
* /usr/share recursos de programas (imágenes, traducciones)
* /usr/share/doc documentación
* /bin ejecutables del sistema
* /lib librerías
* /boot Arranque del sistema
* /usr/bin ejecutables para usuarios


#### Usuarios

El usuario por defecto es "**pi**" con contraseña "**raspberry**" por defecto

#### Cuidado con sudo

Los usuarios normales pueden hacer muchas cosas, pero las tareas más importantes (y por tanto peligrosas si se hacen mal), como pueden ser la configuración o borrado de ficheros críticos no están permitidas.

Esas tareas sólo las puede hacer el usuario administrador, llamado **root**, que puede hacer cualquier cosa. 

Como hay veces que un usuario necesita hacer alguna de estas tareas, por ejemplo editar un fichero de configuración, podemos solicitar permisos para hacer esa tarea anteponiento al comando la palabra "sudo". Algunas acciones nos pedirán que introduzcamos el password de nuestro usuario como medida de seguridad.	

Por ejemplo si queremos editar un fichero de la carpeta de configuración etc llamado ftab, haremos

	sudo geany /etc/fstab
	
geany es el editor de ficheros de texto, y al usar "sudo" estamos pidiendo permiso para hacer algo como root

Esto nos sirve para ver que podemos abrir aplicaciones de escritorio desde la consola.

Nos da todo el poder del usuario administrador (**root**)

### Interface gráfico

Para arrancar el interface gráfico desde consola si no está arrancado usando

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


### VNC

VNC es un protocolo que nos permite acceder remotamente al escritorio de otra máquina.

En las nuevas versiones de Raspbian podemos activar VNC desde la configuración (o desde raspi-config).

Si no está disponible podemos instalarlo en nuestra Raspberry de manera sencilla con:

	sudo apt-get install tightvncserver

Este software requiere que un servicio se ejecute al arrancar si queremos acceder en cualquier momento. Podemos instalarlo añadiendo la siguiente línea al archivo **/etc/rc.local**


	su -c "/usr/bin/tightvncserver :1 -geometry 800x600 -depth 16" pi

![vnc](./images/vnc.png)

Ahora accederemos usando un cliente vnc, como por ejemplo [VNC Viewer](https://www.realvnc.com/es/connect/download/viewer/) de RealVNC. Si nos creamos una cuenta en RealVNC podremos acceder desde cualquier parte, incluso desde internet, sorteando nuestro router.

![Acceso con cuenta de usuario VNC](./images/VNC_CuentaUsuario.png)

Existen clientes de VNC para teléfonos móviles y tabletas, lo que nos da muchas posibilidades

La conexión por VNC nos permite acceder como si estuvieramos conectados directamente

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
	 
## Raspberry como centro multimedia

La distribución LibreELEC está pensada para usar nuestra Raspberry como un centro multimedia, conectándola a un Televisor y con todo lo necesario para poder reproducir tanto vídeo, música o imágenes.

El centro de la distribución es Kodi, un reproductor multimedia muy avanzado y por su naturaleza modular podemos adaptar para todo tipo de contenidos. Además podemos personalizarlo instalando Add-ons (complementos) para reproducir y para obtener nuestros contenidos.

![LibreELEC](./images/Kodi1.jpg)

Una vez instalada la distribución LibreELEC la seleccionamos en el arranque y entramos directamente a Kodi
 
 La primera vez tendremos que seleccionar el idioma
 
![Selección de idioma en Kodi](./images/KodiIdioma.jpg)


Vemos como el interface está perfectamente adaptado a pantallas grandes y no necesitamos un teclado físico, si no que podemos usar un simple puntero/ratón.

![Teclado en pantalla de Kodi](./images/TecladoKodi.jpg)

Damos un nombre al equipo y configuramos el acceso remoto por ssh (para acceder desde otro equipo) y por samba (para poder acceder a carpetas compartidas por equipo Windows o NAS), para lo que nos solicitará una contraseña.

Después de ésto se actualizará y estará listo para usarlo

![Pantalla de Kodi](./images/Kodi-normal.jpg)

Para añadir las carpetas locales o remotes donde se almacenan los contenidos, entramos en el tipo que queramos (Películas en este ejemplo) y pulsamos sobre "Entrar en la sección de Archivos"

![Añadiendo carpetas de contenidos](./images/KodiAnadiendoCarpetas.jpg)

Pulsamos en "Añadir vídeos"

![Añadiendo vídeos a Kodi](./images/KodiAnadiendoCarpetas2.jpg)

Pulsamos "Buscar"

![Buscar contenidos en Kodi](./images/KodiAnadiendoCarpetasBuscar.jpg)

Y luego los buscamos en las opciones de red que nos aparece o pulsamos sobre "Añadir sitio de red" para rellenar los datos de la ip, nombre de carpeta, usuario y password

![Añadir sitio de red](./images/KodiAddSitio.jpg)

Aceptamos y ya debemos ver la carpeta para incluirla entre  los contenidos multimedia.

También podemos añadir Add-ons entrando en la sección Add-ons y en Descargar. Vamos a ver cómo instalar el Add-ons de youtube

![Descargar Add-ons](./images/Addons-descargar.jpg)

Seleccionamos el tipo (vídeo en nuestro caso) y buscamos el que queramos

![Addons de youtube](./images/Addons-youtube.jpg)

Pulsamos instalar y nos dirá si necesitamos instalar algunos complementos de los que depende. Aceptamos y los tendremos disponibles como nueva fuentes de contenido multimedia.

![Add-ons de vídeo](./images/MisAddons.jpg)


Ahora a disfrutar de nuestro reproductor multimedia

