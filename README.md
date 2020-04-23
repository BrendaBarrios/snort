# snort

## ¿Que es snort ?

Snort es un Sistema de Detección de Intrusos (IDS) basado en red (IDSN) open source.

## Características

Implementa un motor de detección de Ataques y barrido de puertos que permite:
Registrar, alertar y responder ante cualquier anomalía previamente definida como patrones 
que corresponden a ataques, barridos, intentos aprovechar alguna vulnerabilidad, análisis de protocolos, etc conocidos. 

Todo esto en tiempo real.

Funciona bajo plataformas Windows y UNIX/Linux.

## Permite :

    * Al tráfico malicioso, darlo de baja. 
    * Tener una capacidad de prevención. 
    * Genera tipos de respuesta a ataques.
    * Aumenta seguridad.

## ¿Porque es más usado?

Es uno de los más usados y dispone de una gran cantidad de filtros o patrones ya predefinidos, 
así como actualizaciones constantes ante casos de ataques.
Utilizado por empresas debido a que pueden configurar sus propias reglas.


# Elementos de Snort

El motor de Snort se divide en los siguientes componentes:

    * Módulo de captura de tráfico
Captura todos los paquetes de la red.

    * Decodificador 
Forma estructura de datos con los paquetes e identifica protocolos.

    * Preprocesadores
 Extiende Funcionalidades preparando los datos para la detención.

    *  Motor de Detención
Analiza los paquetes en base a reglas definidas para detectar ataques.

    * Archivo de reglas
 Conjunto de reglas que el análisis de paquetes.

    * Plugins de detención
Usan para modificar el motor de detención de snort.

    *  Plugins de salida
Define que, como, donde se guardan las alertas de los paquetes.


## Reglas de Snort

Las reglas o firmas son los patrones que se buscan dentro de los paquetes de datos.

Son utilizadas por el motor de detección para comparar los paquetes recibidos y generar 
las alertas en caso de existir coincidencia entre el contenido de los paquetes y las firmas.

En el archivo Snort.conf añade y elimina.

## Ventajas 

    ** Puede funcionar como sniffer **
Podemos ver en consola y en tiempo real qué ocurre en nuestra red, todo nuestro tráfico

    ** Registro de paquetes **
Permite guardar en un archivo los logs para su posterior análisis, un análisis offline.

    ** Funciona como un NIDS **
Cuando un paquete coincide con algún patrón establecido en las reglas de configuración, se loguea. 
Así se sabe cuándo, de dónde y cómo se produjo el ataque.
