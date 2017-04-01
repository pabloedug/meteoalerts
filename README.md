# meteoalerts

----
## Qué es meteoalerts

Meteoalerts es un script en R (ejecutable en consola linux) que permite obtener alertas por lluvia y/o baja temperatura para cualquier municipio español a partir de las predicciones de la <a href="http://www.aemet.es/es/portada" target="_blank">AEMET</a> [AEMET]() **para el día siguiente** al que se hace la consulta.

----
## uso
1. Obtener el código INE del municipio del que se desea obtener la predicción (por ejemplo, Majadahonda es el 28080).

    > Los códigos de municipios pueden consultarse en el <a href="http://www.ine.es/daco/daco42/codmun/codmunmapa.htm" target="_blank">INE</a>. Son el resultado de colapsar las columnas CPRO y CMUN

2. Ejecutar el script en Linux, seleccionando el código de municipio (por defecto el 28080, correspondiente a Majadahonda) y los umbrales a partir de los cuales recibir mensaje de alerta (por defecto, una probabilidad de precipitaciones en porcentaje superior a 50 y una temperatura máxima pronosticada inferior a 10 grados darán lugar a alerta de lluvia y frío, respectivamente).

        Rscript meteoalerts.R --municipio=28080 --prec=50 --temp=10

3. Lo verdaderamente útil es programar una tarea CRON (por ejemplo en RaspberryPi) para lanzar el script todas las noches y que envíe un correo en caso de haber alerta.

----
## dependencias
Se requiere tener instalados los siguientes paquetes de R:

- XML
- optparse
