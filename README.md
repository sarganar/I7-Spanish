INFORM 7 Spanish Extension (r10.1.2) - June 21th, 2023
======

This branch contains the Spanish Libs for Inform 10.1.2 - 2022 August

✔️Edición 10.1.2 - Descarga [la última release](https://github.com/sarganar/I7-Spanish/releases/).


Cómo instalar
======

### Inform 7 IDE:

Descarga e instala el IDE de Inform [desde su repositorio](https://github.com/ganelson/inform/releases). Es la release **10.1.2**, elige la que corresponde a tu SO.


### Librerías Español:
Ve a la sección [Releases de este repositorio](https://github.com/sarganar/I7-Spanish/releases). Allí las tienes empaquetadas en un zip. Descargate la última.

Te recomiendo que instales las librerías de manera local (es decir, solo para tu proyecto actual). Si tu proyecto va a llamarse *TuProyecto*, entonces tus carpetas serán:
```
    Projects\
      |-TuProyecto.inform\
      |-TuProyecto.Materials
         |-Extensions\
         |-Inter\
```

#### HowTo: Inciar *TuProyecto* de manera Local:

- Abre la aplicación Inform 7 IDE y crea tu primer proyecto con nombre *TuProyecto*. Inform te creará una carpeta *TuProyecto* en su folder *Projects* (en MisDocumentos/Inform por ejemplo o donde tu le digas)

- Copia la carpeta **Sebastian Arg** del zip que descargaste al folder *Extensions* en *../TuProyecto.Materials/*  (si no existe, debes crear el folder *Extensions*)

- Copia la carpeta **SpanishLanguageKit** del zip que descargaste al folder *Inter* en *../TuProyecto.Materials/*  (si no existe, debes crear el folder *Inter*)

- Eso es todo, ahora desde tu IDE puedes compilar el proyecto.

Hola Mundo (proyecto minimo)
======

- En la aplicación Inform 7 tienes el panel *Source*, allí copia el código del siguiente programa mínimo:

```
"Hola Mundo" (in spanish)

Test Lab is a room.  "Una pequeña habitación de pruebas."

When play begins: say "Hola Mundo!".
```

- Compilas con _F5_ y verás el resultado en el panel *Story*


Cómo colaborar
======

Puedes reportar los problemas que te encuentres informándolos en la pestaña [Issues](https://github.com/sarganar/I7-Spanish/issues) de este repositorio. Si puedes, coloca el código mínimo que reproduce el error.

También puedes crear una pull request con las mejoras que añadirías a la librería.

Estamos en Discord, en los canales de CAAD y Textualiza, pídeme invitación por email.

💻También puedes visitar la [página oficial de Inform](https://ganelson.github.io/inform-website/).

