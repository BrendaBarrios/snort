# Ejercicios para snort


## 1. Descarga en tu maquina el script <span style="color:blue">setup_conf.sh </span>  que se encuentra en este repositorio.


## 2. Ubicate donde se encuentra el archivo que descargaste anteriormente y ejecuta lo siguiente.

### 2.1 Otorgaremos permisos para que se pueda ejecutar.


    vagrant@ubuntu1804:~  chmod u+x setup_conf.sh


### 2.2 Ejecutaremos el script en nuestra maquina.


    vagrant@ubuntu1804:~ ./setup.sh

### 2.3 Colocaras la ip publica que esta en la interfaz de red que estamos usando.

La interfaz de red en este mismo repositorio apartado instalación te dijimos como localizarla ahora de esta misma interfaz obten la ip que aparece como un apartado y recuerda generalmente comienzan con 192.168.x.x .


    vagrant@ubuntu1804:/vagrant_data$ ./setup_conf.sh
    Escribe la ip de tu equipo:192.168.33.10

Se ejecutara el comando y cuando este listo aparecera un mensaje que diga terminando edición del archivo snort.conf.




## 3. Descarga el  script <span style="color:blue"> conf_localRules.sh </span> que se encuentra en este repositorio.


## 4. Ubicate donde se encuentra el archivo que descargaste anteriormente y ejecuta lo siguiente.

### 2.1 Otorgaremos permisos para que se pueda ejecutar.

    vagrant@ubuntu1804:~  chmod u+x conf_localRules.sh


### 2.2 Ejecutaremos el script en nuestra maquina.


    vagrant@ubuntu1804:~ ./conf_localRules.sh


# Ejecuta snort en la consola.

Para ejecutar snort en la consola usaremos el siguiente comando :

    sudo snort -A console -i eth1 -u snort -g snort -c  /etc/snort/snort.conf


Si deseas más información de las opciones que se utilizan ejecuta el siguiente comando donde te mostrara la descripcion de cada uno de ellos.

    vagrant@ubuntu1804:~$ snort --help


__IMPORTANTE__

En el ejemplo anterior __eth1 va a cambiar dependiendo de la interfaz que utilices__ cada uno en su maquina que es donde esta la ip pública que usamos.En caso contrario snort no detectara las reglas.


# Ejercicios 


__Debes tener ejecutando snort consola las reglas que se muestran ya las tienes  escritas en el archivo de reglas con los scripts ejecutados ya no deberas hacer nada solo ver como hacerlas funcionar .__

__Snort detecta una regla si coincide mandara una alerta a la consola de snort__

# 1. Ping al servidor.

La siguiente intrucción detecta un ping desde una maquina externa hacia tu servidor o maquina.

    alert icmp $EXTERNAL_NET any -> $HOME_NET any (msg:"ping al servidor"; sid:10000001; rev:001;)

## Debes abrir una terminal donde no este instalado snort.

Por ejemplo si en una maquina virtual tienes snort puedes abrir la terminal de tu equipo original ya sea linux o windows y ejecutar el siguiente comando:

    bodhi@yasmin:~$ ping 192.168.33.10

_Tu deberas cambiar la ip pública por la que tu estas usando ,es decir la que utiliza en la interfaz de red que colocaste al momento de instalar snort._

## Revisa la terminal en la que tienes ejecutando snort para revisar la alerta que te manda.


Te mostrara que snort ya esta detectando el paquete te aparecera una alerta en la consola con el mensaje de ping al servidor.



    Commencing packet processing (pid=1685)
    04/27-19:05:37.037319  [**] [1:10000001:1] ping al servidor [**] [Priority: 0] {ICMP} 192.168.33.1 -> 192.168.33.10
    04/27-19:05:38.043472  [**] [1:10000001:1] ping al servidor [**] [Priority: 0] {ICMP} 192.168.33.1 -> 192.168.33.10
    04/27-19:05:39.049655  [**] [1:10000001:1] ping al servidor




# 2. Conexión ssh

La instrucción detecta cuando algun usuario intenta conectarse por ssh al servidor.

    alert tcp $EXTERNAL_NET any -> $HOME_NET 22 (msg:"Detectando conexión por ssh";sid:1000005; rev:005;) 

## Debes abrir una terminal donde no este instalado snort.

Por ejemplo si en una maquina virtual tienes snort puedes abrir la terminal de tu equipo original ya sea linux o windows y ejecutar el siguiente comando:

    bodhi@yasmin:~$ ssh usuario@192.168.33.10
    

_Tu deberas cambiar la ip pública por la que tu estas usando ,es decir la que utiliza en la interfaz de red que colocaste al momento de instalar snort y el usuario puedes o dejarlo asi solo para que veas la._

## Revisa la terminal en la que tienes ejecutando snort para revisar la alerta que te manda.


Te mostrara que snort ya esta detectando el paquete te aparecera una alerta en la consola con el mensaje de ssh al servidor.



    Commencing packet processing (pid=2052)
    04/27-20:04:46.151672  [**] [1:1000005:5] Detectando conexión por ssh [**] [Priority: 0] {TCP} 192.168.33.1:38816 -> 192.168.33.10:22
    04/27-20:04:46.152637  [**] [1:1000005:5] Detectando conexión por ssh [**] [Priority: 0] {TCP} 192.168.33.1:38816 -> 192.168.33.10:22
    
    
# 3. Regla para detectar la entrada  HTTP

Esta regla detecta cuando te estas conectando por http,cuando estas accediendo a una página web.

    alert tcp any any -> $HOME_NET 80 (msg:"Regla del http"; sid:10000003; rev:003;)

## Abre una nueva terminal en el equipo donde esta instalado snort

Ejecuta el siguiente comando es para generar la página que python crea automáticamente la cual usaremos de ejemplo para esta alerta.

    vagrant@ubuntu1804:~$ sudo python3 -m http.server --bind 0.0.0.0 80

Una vez que ejecutas este comando podras verificar la página en tu navegador colocando tu ip publica y veras lo siguiente.

<p style="text-align : center;">

<img src="./imagenes/1.jpg" style="center;"/>

</p>

Enseguida dirigete a la consola de snort donde veras las siguiente alerta :

    04/27-20:59:26.280661  [**] [1:10000003:3] Regla del http [**] [Priority: 0] {TCP} 192.168.33.1:53704 -> 192.168.33.10:80
    04/27-20:59:26.285119  [**] [1:10000003:3] Regla del http [**] [Priority: 0] {TCP} 192.168.33.1:53704 -> 192.168.33.10:80
    04/27-20:59:26.287752  [**] [1:10000003:3] Regla del http [**] [Priority: 0] {TCP} 192.168.33.1:53704 -> 192.168.33.10:80





# 4. Regla para detectar que entran al admin 

La siguiente regla detecta cuando alguien quiere entrar al administrador de una aplicación , esto es peligroso porque puede entrar a modificara o eliminar información.

    alert tcp any any -> $HOME_NET 80 (msg:" Entrando al admin"; content:"GET /admin"; sid:10000002; rev:002;)

## Abre una nueva terminal en el equipo donde esta instalado snort

Ejecuta el siguiente comando es para generar la página que python crea automáticamente, usaremos este sitio que acederemos por medio de una url que  no existe pero nos sirve para simular como sería en un entorno real, lo hacemos asi para que todos tengamos la oportunidad de probar

    vagrant@ubuntu1804:~$ sudo python3 -m http.server --bind 0.0.0.0 80

Para obtener la alerta en snort coloca la siguiente url en tu navegador.

<p style="text-align : center;">

<img src="./imagenes/2.jpg" style="center;"/>

</p>

__La ip cambiara, cada usuario debe colocar la ip pública de su interfaz de red que esta utilizando.__

Si te aparece un error 404 en el navegador es normal no te asustes solo en estos momento estamos simulando la ip de un proyecto real.


## Revisa la consola donde esta snort corriendo

Como estamos accediendo a una página http y al la url /admin encontrara que concuerda con 2 reglas por lo tanto mostrara ambas alertas como las siguientes.

   
    04/28-03:02:50.877485  [**] [1:10000002:2]  Entrando al admin [**] [Priority: 0] {TCP} 192.168.33.1:55526 -> 192.168.33.10:80
    04/28-03:02:50.877485  [**] [1:10000003:3] Regla del http [**] [Priority: 0] {TCP} 192.168.33.1:55526 -> 192.168.33.10:80



# 5. Regla para detectar intruso en la base de datos.

Esta regla es parecida a la anterior solo cambia el puerto que es 3306 este permite el acceso a la base de datos de alguna aplicación. Si algun intruso llega a entrar puede causar grandes daños.

    alert tcp any any -> $HOME_NET 3306 (msg:"Alguien intenta entrar a la base de datos"; sid:10000004;rev:004; )


## Abre una nueva terminal en el equipo donde esta instalado snort

Seguiremos usando la página que crean python de http por defecto. Para hacerla funcionar debes ejecutar el siguiente comando:


    vagrant@ubuntu1804:~$ sudo python3 -m http.server --bind 0.0.0.0 80

Enseguida coloca en tu navegador lo siguiente :
<p style="text-align : center;">

<img src="./imagenes/3.jpg" style="center;"/>

</p>


La alerta que te muestra es la siguente:

    04/28-03:54:49.635069  [**] [1:10000004:4] Alguien intenta entrar a la base de datos [**] [Priority: 0] {TCP} 192.168.33.1:35532 -> 192.168.33.10:3306
    04/28-03:54:49.866907  [**] [1:10000004:4] Alguien intenta entrar a la base de datos [**] [Priority: 0] {TCP} 192.168.33.1:35534 -> 192.168.33.10:3306
    04/28-03:54:49.874529  [**] [1:10000004:4] Alguien intenta entrar a la base de datos [**] [Priority: 0] {TCP} 192.168.33.1:35536 -> 192.168.33.10:3306




