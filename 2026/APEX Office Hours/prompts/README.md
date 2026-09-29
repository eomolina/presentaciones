# Prompts para su agente de IA

Esta carpeta contiene los diferentes prompts utilizados con Codex para realizar las diferentes tareas de generación de la aplicación APEX utilizando APEXlang **Open Application Definition Language**.

Va a encontrar los archivos:

- modelo.txt
- funcional.txt
- especificacion.txt
- genera-app.txt
- instalar.txt

Los debe ejecutar en el orden en que se listan arriba. Cada uno de ellos solicitan ejecutar al agente de IA las siguientes labores:

## modelo.txt [📄 Ver documento](modelo.txt)
Contiene la especificación de las diferentes tablas y las columnas que debe contener cada una de ellas, además le indica al agente generar relaciones, restricciones e índices necesarios.

## funcional.txt [📄 Ver documento](funcional.txt)
Prompt para que el agente de IA genere la definición funcional de la aplicación.

## especificaciones.txt [📄 Ver documento](especificacion.txt)
Prompt para que el agente de IA genere las especificaciones detalladas de la aplicación que vamos a generar.

## genera-app.txt [📄 Ver documento](genera-app.txt)
Prompt para que el agente de IA realice la generación local de los artefactos (applicación, páginas y otros componentes APEX) de la aplicación.

## instalar.txt [📄 Ver documento](instalar.txt)
Prompt para indicarle al agente de IA que realice la importación de la aplicación generada en el espacio de trabajo de nuestro ambiente APEX.
