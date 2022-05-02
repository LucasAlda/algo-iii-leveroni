# Código Repetido

Este ejercicio tiene por objetivo que saquen el código repetido que encuentren en el modelo y en los tests. Por ej. entre el test01 y test02.

Los tests provistos ya funcionan, simplemente hay que sacar el código repetido y los tests deben seguir funcionando.

Se pueden modificar las clases provistas, sólo para eliminar código repetido. No se puede modificar lo que verifican los tests. O sea, sólo se puede hacer un cambio de diseño de tal manera que siga testeando lo mismo, que la funcionalidad sea la misma, pero que no haya código repetido.

Aclaración: Para hacer este ejercicio más sencillo se modela a un Customer utilizando un String en vez de una clase Customer. No es el objetivo del ejercicio que ustedes corrijan esta decisión, ni las consecuencias que trae consigo (por ej. que no se pueda agregar al CustomerBook dos Customers diferentes con el mismo nombre).


# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?
Al abstraer el codigo repetido logramos representar la idea de un cronometro, con el cual comprobamos cuanto tarda en realizarse un proceso en particular. En nuestro caso esta idea de cronometro (o temporarizador) nos permitio modularizar ambos tests pudiendo identificar que accion en particular mediamos. En vez de crear 2 cronometros distintos en cada test, al modularizar nos permitio simplemente indicar la accion en particular a medir y el tiempo maximo que podia tardar, de esta forma si incluyeramos mas test que se encargaran de medir el rendimiento de realizar un cierto proceso podriamos reutilizar esta idea.


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?
A la hora de representar entes de la realidad en Smalltalk hay 2 enfoques.
Uno de ellos, el moderno, nos plantea una vision de prototipado de entes en objetos, los cuales pueden tomar de ejemplo, otro objeto padre. Por lo tanto podemos relacionar los objetos mediante una relacion de "parentezco" cuando los objetos comparten un protocolo de mensajes similar.
La otra visión es la clásica, donde la realidad se separa en 2 mundos, uno de las ideas y otro de elementos concretos. Dentro de Smalltalk, podemos asociar las ideas de la realidad a las clases que tiene el lenguaje y con ellas generar esos elementos concretos que eran la otra parte de la realidad. En esta vision hay una jerarquia de clases que permite sub/super clasificar las clases entre si.(De la idea de un vehiculo podemos subclasificar en la idea de auto y de camión). Esto permite que ambas ideas, las de los autos y los camiones tengan un protocolo base que poseen solo por ser superclasificados por la idea de vehiculo.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?
Se pueden hallar varias relaciones entre crear abstracciones y la teoría del modelo/sistema. Una de ellas es que crear nuevas abstracciones forma parte del proceso de "construir una teoría", sin embargo, estas abstracciones no siempre son adecuadas, es importante que estas abstracciones estén bien arraigadas a la teoría de los programadores que la crearon, hay casos en los cuales estas abstracciones extienden naturalmente una teoría y se adaptan a la teoría original y en muchas otras situaciones estas abstracciones son "parches" poco integrados con el programa. Si las abstracciones no están bien hechas la viabilidad del programa a largo plazo disminuye, en conclusión, es posible sacar mucho código y crear múltiples abstracciones del mismo, sin embargo, no todas son buenas y es fundamental que se adapten bien al programa (o teoría) original.



