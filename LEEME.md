# Hojas de estilo para XML

## ¿Qué es **XML**?
**XML** es una norma sobre cómo escribir de una manera estructurada.
Una ventaja de escribir de esta manera estructurada es que un texto escrito en ella se puede transformar a cualquier otro formato mediante XSLT, como explico más abajo.
Las páginas web se escriben en *un* XML, en **HTML** (HyperText Markup Language). En la siguiente sección pongo otros lenguajes XML relevantes.
A continuación pongo un ejemplo de cómo escribir un párrafo ("En esta breve sección...") en dos dialectos de XML: HTML y DocBook.
En HTML
```
<p>En esta breve sección...</p>
```
En DocBook
```
<para>En esta breve sección...</para>
```
No parece muy complicado. El quid está en preceder el párrafo de una marca (`<p>`) y cerrarlo con otra (`</p>`). Esto nos permite delimitar el párrafo sin ambigüedad. XML tiene muchos más detalles o recursos, por ejemplo podemos poner información en la etiqueta de apertura tal como un identificador (`<p id="primer-parrafo">`), o/y una fecha (`<p date="2024-04-07">`), incluir comentarios que no se visualizarán (`<!-- redactar con frases más cortas en un momento libre -->`), etc. XML resulta complejo y prolijo en comparación con su competidor, JSON, del que hablaré más abajo.

## ¿Qué otros lenguajes XML existen y se emplean además del ubicuo HTML?
- El formato ePUB utiliza al menos otros dos lenguajes XML (*vide infra*)
- Los navegadores modernos reconocen al menos dos lenguajes XML más:
  - SVG: Scalable Vector Graphics. Sirve para dibujar con órdenes.
  - MathML. Para poner fórmulas matemáticas en nuestra página.
- MusicXML: empleado por aplicaciones musicales como Hydrogen (una caja de ritmos virtual) y MuseScore
- DocBook: empleado para escribir documentación en principio sobre programas informáticos y código en general. Muchos desarrolladores escriben un único archivo y lo procesan para generar múltiples páginas web, cada una sería un capítulo o sección del archivo único de partida.
- TEI (Text Encoding Initiative): empleado en humanidades para escribir y transcribir textos literarios.
- La mayoría de los formatos de ofimática modernos dado que XML es la única norma universal de escritura estructurada.

## ¿Qué es XSLT?
Bien, una vez que la Humanidad ha acordado una manera universal de escribir nos conviene disponer de medios para traducir algo escrito en un XML a cualquier otro formato. Podría ser a HTML. O a LaTeX. O a MarkDown...
En esta rama del proyecto pongo hojas de estilo (archivos en XSLT, un lenguaje XML) para realizar varias transformaciones

- De HTML a JSON. su nombre empieza por `HTML-to-JSON`. JSON significa Java Script Object Notation, y es el formato empleado por JavaScript (el lenguaje de programación que hace interactivas las páginas web), por MongoDB (un gestor de bases de datos NoSQL), y en muchos intercambios de datos.
- De tablas de HTML a inserciones en una base de datos relacional. Lo estoy comprobando con MySQL, gratuita.
- Extraer información de archivos en formato ePUB, el más difundido y documentado, dado que de sobre competidor, MOBI, no he encontrado una descripción del formato interno. En esencia un archivo ePUB es un directorio de archivos XML (la mayoría en HTML), algunas imágenes, y poco más. Entre los archivos XML que no son HTML hay algunos de los que extraer información útil (metadatos) como nombres de capítulos y localización exacta. (A menudo cada capítulo se corresponde con uno de los archivos HTML, o XHTML para ser exactos).
