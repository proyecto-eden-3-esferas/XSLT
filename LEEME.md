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

## ¿Qué es y quién escribe en LaTeX?

**LaTeX** es un sistema de tipografía profesional gratuito y de código abierto. Como siempre, gratuito y abierto va asociado a la ausencia de una interfaz gráfica oficial. Destaca en la maquetación de fórmulas matemáticas y en la construcción de los párrafos en la página. Lo utiliza la comunidad científica y tecnológica. Hay extensiones de LaTex para matemáticas, física, química, ingeniería... Los físicos y matemáticos suelen maquetar sus artículos en LaTeX.

## ¿Qué es XSLT?

Bien, una vez que la Humanidad ha acordado una manera universal de escribir nos conviene disponer de medios para traducir algo escrito en un XML a cualquier otro formato. Podría ser a HTML. O a LaTeX. O a MarkDown...

En esta rama del proyecto pongo hojas de estilo (archivos en XSLT, un lenguaje XML) para realizar varias transformaciones
- De HTML a JSON. su nombre empieza por `HTML-to-JSON`. JSON significa Java Script Object Notation, y es el formato empleado por JavaScript (el lenguaje de programación que hace interactivas las páginas web), por MongoDB (un gestor de bases de datos NoSQL), y en muchos intercambios de datos.
- De tablas de HTML a inserciones en una base de datos relacional. Lo estoy comprobando con MySQL, gratuita.
- Extraer información de archivos en formato ePUB, el más difundido y documentado, dado que sobre competidor, MOBI, no he encontrado una descripción del formato interno. En esencia un archivo ePUB es un directorio de archivos XML (la mayoría en HTML), algunas imágenes, y poco más, todo ello comprimido (ZIP) y con la extensión cambiada a ePUB. (Si cambiamos la extensión a `.zip` podemos abrilo cual si de un archivo comprimido se tratase.) Entre los archivos XML que no son HTML hay algunos de los que extraer información útil (metadatos) como nombres de capítulos y localización exacta. (A menudo cada capítulo se corresponde con uno de los archivos HTML, o XHTML para ser exactos).

## JSON

Por el momento me limito a dar un ejemplo de un objeto JSON que representa una cita (blockquote) compuesta de varios párrafos y una indicación del idioma en que está escrita:
```
{
    "name" : "blockquote",
    "@lang" : "en",
    "content" : [
      {"name" : "p", "content" : "Her selflessness..."},
      {"name" : "p", "content" : "Everybody liked him..."}
    ]
}
```

Que reprentaría un elemento de XML tal que:

```
<blockquote xml:lang="en">
   <p>Her selflessness...</p>
   <p>Everybody liked him...</p>
</blockquote>
```

## Los modos de guardar la información

Normalmente si queremos anotar una idea propia o extraña abrimos una aplicación y escribimos, o copiamos y pegamos. Cuando hacemos esto deberíamos asegurarnos de que no dependemos de la empresa que nos ha vendido o proporcionado la aplicación, o por lo menos periódicamente gardarla en formatos *abiertos* (=públicos), procesables gratuitamente y que vayan a continuar en las décadas venideras. Quiero decir que o bien guardamos nuestro trabajo en multitud de formatos periódicamente, o lo escribimos o guardamos en un formato que nos conste que se puede transformar *mecánicamente* a cualquier otro formato que nos pueda interesar.

Además lo guardaremos en un formato que se pueda copiar y modificar. En este sentido PDF *no* se presta bien a modificaciones dado que es más bien un formato de destino, no intermedio.

Mucha gente opta por guardar lo que escribe en HTML.

En total considero cuatro formatos en los que guardar información:

- XML, o en particular HTML, aunque a determinados usuarios y para determinados usos podría convenir mejor DocBook, TEI...
- una base de datos relacional
- JSON, el preferido de muchos porque es más sencillo y compacto que XML
- objetos de un lenguaje de programación orientado a objetos.

La idea es que elijamos de los cuatro el más fácil de transformar a los tres restantes. Alguien que no sepa o no valore la programación tal vez decida prescindir del cuarto formato y quedarse con los tres primeros (HTML/XML, SQL y JSON). Además nos conviene poder "visualizar" fácilmente lo que vayamos escribiendo o copiando. En ambos sentidos HTML es el mejor formato: se transforma oficialmente a los otros tres (o dos) y se muestra en el navegador de nuestro ordenador o smartphone.

En consecuencia las hojas de estilo (XSLT, extensión `.xsl`) que iré subiendo sirven para realizar estas trasnformaciones.

## El problema de los caracteres especiales (escape characters)

Ahora bien, se necesita suplementar las hojas de estilo con otras transformaciones porque cada formato da un significado especial a algunos caracteres (letras, dígitos, puntuación...). Por ejemplo, en SQL el texto va entre apóstrofos o comillas simples:

```
'En esta breve sección...'
```

(Vale, MySQL y MaridDB permiten también comillas, pero evitaré emplearlas.)

Y si dentro del texto queremos representar apóstrofos, deberemos precederlos de una barra inclinada hacia atrás (`\'`):

```
'En esta \'breve\' sección...'
```

Por tanto debermos escribir código que convierta los apóstrofos internos en la secuencia `\'`. Un informático reconocería que se conseguiría mediante **expresiones regulares**, que no se considera programación pura y dura. En linux empleo la herramienta *sed*. Espero explicarlo en una versión posterior de este escrito.


### ¿Cómo generaríamos código de inserción para una base de datos?
A partir de una página web que contuviera tablas con unas caracteríasticas muy específicas escribiríamos por ejemplo:
```
xsltproc XSLT/HTML-table-to-SQL.xsl tables/plant_tables.html  |
sed 's/'\'''\''/NULL/g' |
sed -E 's/'\''(.*)'\''(.*)'\''/'\''\1\\'\''\2'\''/g'
```

No dice mucho pero...

(Continuará. Quiero decir que se ampliará y se explicará más.)

