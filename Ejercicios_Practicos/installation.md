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




## 3 Descarga el  script <span style="color:blue"> conf_localRules.sh </span> que se encuentra en este repositorio.


## 4. Ubicate donde se encuentra el archivo que descargaste anteriormente y ejecuta lo siguiente.

### 2.1 Otorgaremos permisos para que se pueda ejecutar.

    vagrant@ubuntu1804:~  chmod u+x conf_localRules.sh


### 2.2 Ejecutaremos el script en nuestra maquina.


    vagrant@ubuntu1804:~ ./conf_localRules.sh


# Ejercicios













