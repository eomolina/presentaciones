# Oracle APEX Office Hours en Español

## Simplifica la creación y evolución de tus aplicaciones con APEXlang
Esta presentación te permite introducirte en el uso de la nueva funcionalidad de Oracle APEX 26.1, APEXlang el **Open Application Definition Language** que nos permite utilizar la ayuda de Agentes de IA para desarrollar y mantener nuestras aplicaciones APEX.

Aprende:

- qué es APEXlang?
- qué se necesita para utilizarlo?
- qué son los APEX skills y para que nos sirven?
- cuál es el ciclo de desarrollo con APEXlang?

En la carpeta **apexlang-oh** de este repositorio podrá encontrar todos los archivos utilizados durante la presentación.

El archivo README.md de esta carpeta es la base utilizada para el desarrollo de la aplicación y describe el propósito de la aplicación a desarrollar, así como la arquitectura y entorno de esta.

La carpeta **scripts** contiene los scripts necesarios para crear el modelo de datos y generar datos de prueba.

En la carpeta **prompts** va a encontrar las instrucciones usadas con el agente de IA para ejecutar las diferentes funciones de generación de la aplicación.

Puede ver la presentación desde el archivo APEXlang.pdf [📄 Ver presentación](APEXlang.pdf)

## Paso a Paso

### Requisitos
Es necesario que cuente con los siguientes elementos instalados y configurados:

1. Oracle APEX 26.1 o superior
2. ORDS 26.1 o superior
3. SQLcl 26.1 o superior
4. Base de datos Oracle 26ai
5. VS Code con su agente de codificación preferido (Codex, Claude Code, Gemini Cli, ...)
6. Conexión a su esquema de base de datos configurado dentro de SQLcl.

Para ejecutar el ejercicio realizado durante la demostración de la presentación, usted debe:

1. Crear una carpeta para el proyecto, como por ejemplo "apexlang-oh".
2. Abrir la carpeta creada en el punto anterior en VS Code.
3. Crear en la carpeta abierta el archivo README.md y copiar el contenido del archivo README.md de la carpeta apexlang-of de este repositorio [Abrir README.md](./apexlang-oh/README.md).
4. Crear una carpeta llamada "database" dentro de la carpeta creada para el proyecto en el punto 1 anterior.
5. Copiar en la carpeta "database" recién creada, los archivos generar-datos.sql [Abrir generar-datos.sql](./apexlang-oh/scripts/generar-datos.sql) y modelo-datos.sql [Abrir modelo-datos.sql](./apexlang-oh/scripts/modelo-datos.sql).
6. En VS Vode, abra su terminal Codex (o el agente de IA que esté usando) y copie el contenido del archivo *funcional.txt* que se encuentra en la carpeta "apexlang-oh/prompts" de este repositorio [Abrir funcional.txt](./apexlang-oh/prompts/funcional.txt).
7. Ejecute el prompt recién copiado.
8. Una vez finalizada la ejecución del prompt anterior, en la terminal de Codex (o el agente de IA que esté usando), copie y ejecute el contenido del archivo *especificacionn.txt* de la carpeta "/apexlang-oh/prompts" [Abrir especificacion.txt](./apexlang-oh/prompts/especificacion.txt).
9. Repita el paso 8 para el archivo *genera-app.txt*.
10. Repita el paso 8 para el archivo *instalar.txt*.
11. Ingrese a su espacio de trabajo APEX y cargue y ejecute el archivo *modelo-datos.sql* de la carpeta "apexlang-oh/scripts".
12. Repita el paso anterior para el archivo *generar-datos.sql*.
13. Ejecute y pruebe la aplicación generada.

