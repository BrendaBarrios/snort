# snort

[Imagen 1.Snort](https://www.welivesecurity.com/la-es/2014/01/13/primeros-pasos-implementacion-ids-snort/)


## ¿Que es snort ?

Snort es un Sistema de Detección de Intrusos (IDS) basado en red (IDSN) open source.



## Características

Implementa un motor de detección de ataques y barrido de puertos que nos ayuda a:
registrar, alertar y responder ante cualquier anomalía previamente definida como patrones 
que corresponden a ataques, barridos, intentos aprovechar alguna vulnerabilidad, análisis de protocolos.

Todo esto en tiempo real.

Funciona bajo plataformas Windows y UNIX/Linux.

(Imagen 2.Detención de intrusos)[https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTS7z52iiwtq8m8pvL_2JSdtvHgSL2sAS4O7pNcG4Wsw2nFv-bz&usqp=CAU]


## Permite :

* Al tráfico malicioso, darlo de baja. 
* Tener una capacidad de prevención. 
* Genera tipos de respuesta a ataques.
* Aumenta seguridad.



## ¿Porque es más usado?

Es uno de los más usados y dispone de una gran cantidad de filtros o patrones ya predefinidos, 
así como actualizaciones constantes ante casos de ataques.
Utilizado por empresas debido a que pueden configurar sus propias reglas y solo usan las necesarias para ellos.


# Elementos de Snort

El motor de Snort se divide en los siguientes componentes:

* __Módulo de captura de tráfico__ : 
Captura todos los paquetes de la red.

* __Decodificador__ :
Forma estructura de datos con los paquetes e identifica protocolos.

* __Preprocesadores__ :
 Extiende Funcionalidades preparando los datos para la detención.

* __Motor de Detención__ :
Analiza los paquetes en base a reglas definidas para detectar ataques.

* __Archivo de reglas__ :
 Conjunto de reglas que el análisis de paquetes.

* __Plugins de detención__ :
Usan para modificar el motor de detención de snort.

* __Plugins de salida__:
Define que, como, donde se guardan las alertas de los paquetes.


## Reglas de Snort

Las reglas o firmas son los patrones que se buscan dentro de los paquetes de datos.Estas son escritas en el archivo  _local.rules_ .


Son utilizadas por el motor de detección para comparar los paquetes recibidos y generar 
las alertas en caso de existir coincidencia entre el contenido de los paquetes y las firmas.

En el archivo Snort.conf añade y elimina los plugins o paquetes a utilizar.

## Ventajas 

* __Puede funcionar como sniffer__:
Podemos ver en consola y en tiempo real qué ocurre en nuestra red, todo nuestro tráfico

* __Registro de paquetes__:
Permite guardar en un archivo los logs para su posterior análisis, un análisis offline.

* __Funciona como un NIDS__:
Cuando un paquete coincide con algún patrón establecido en las reglas de configuración, se loguea. 
Así se sabe cuándo, de dónde y cómo se produjo el ataque.
