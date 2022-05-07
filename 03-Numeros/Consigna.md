## Desafío Adicional (opcional, no resta, sólo otorga puntos extra)

Aquellos que estén interesados en llevar al extremo el reemplazo de if por polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente: Los tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, casos bases de fibonacci, etc.

Las soluciones a este desafío son muy interesantes y distintas para lenguajes de prototipación (ej. javascript) vs clasificación.

## Preguntas teóricas

### Aporte de los mensajes de DD

En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

EL double dispatch es una metodologia que se aplica en casos donde queremos implementar polimorfismo entre objectos cuyas identidades desconocemos, siendo mensajes de muchos-a-muchos. En estos casos, el polimorfismo simple no es sufiente ya que se desconoce la clase tanto del colaborador externo como del receptor. Para solventar esto se hacen dos llamados, el primero es el mensaje original donde un recetor de clase desconocida recibe un mensaje con un colaborador tambien desconocido y procede a ejecutar el metodo del receptor, donde "descubre" su clase y le envia un mensaje a su colaborador, todavia desconocido, que haga cierta operacion en base a su clase. Ahora en el segundo mensaje, con los roles invertidos, tenemos al receptor original como colaborador del objeto de clase desconocida, pero al ejecutar este segundo metodo "descubre" su clase y puede realizar la implementacion correcta entre dos objetos de clases ahora conocidas.

ObjetoDesconocido1 + ObjetoDesconocido2
(en este mensaje "+" polimorfico no se conoce ni el receptor ni el colaborador)

Cuando el ObjetoDesconodido1 ejecuta el metodo para el mensaje "+", este obviamente conoce su clase y procede a mandar mensaje a su colaborador, desconocido para el, que opere con el.
(ObjetoDesconocido2 implementacionDeSumaParaElementoDeLaClaseDel1: ObjetoConocido1)

Ahora ocurre lo mismo del paso anterior pero con el ObjetoDesconocido2, este cuando ejecuta su metodo tambien es conciente de su clase y ahora ambos colaboradores son conocidos y se procede a resolver la implementacion para este caso

ObjetoConocido1 + ObjetoConocido2 (realizar implementacion correspondiente, que no va al caso)

Como conclusion el primer llamado del double dispatch provee la informacion de la clase del receptor del mensaje original y el segundo es el que obtiene la informacion del colaborador externo original y el que es capaz de hacer la implementacion del caso particular entre estas clases.

### Lógica de instanciado

Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Siempre suele convenir tener la logica sobre como instanciar un objeto definido en los metodos de clase del mismo, ya que las clases representan la idea de esos objetos que vamos a instanciar. Si se crea el objeto de otro lugar u otra forma, es un situacion que puede pasar, como en el ejercicio se puede crear un entero a partir del metodo with:over: definido en la clase de fraccion, usando el numero 1 como denominador de la misma. La forma de resolverlo es planteando y teniendo en cuenta esos casos donde instanciamos un objeto a partir de otra clase, para que la instancia sea de la clase adecuada aun cuando no provenga de la misma.

### Nombres de las categorías de métodos

Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Categorizamos para cada operacion (+,-,\*,/) por separado con el nombre de handlers, ya que en cada categoria se encuentran los metodos que se encargan de esa operacion para cada clase conla que puede colaborar. De esta forma si en el futuro agregaramos otra clase con la que colaborar, los metodos para sumar los podemos tener todos en esa misma categoria. Ejemplo: handlers-addition se encuentran los metodos que se encargan de sumar con enteros, con fracciones, etc.

### Subclass Responsibility

Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos ese mensaje para que las subclases puedan saber que ese mensaje no esta definido en la superclase, y que debe ser definido en la subclase, es decir, que la subclase es la que tiene la responsabilidad de definir el mensaje. Basicamente al estar el mensaje en la superclase estamos definiendo que todas las subclases futuras tienen que saber responder ese mensaje, no estamos definiendo "COMO" lo responden sino el "QUE" que tienen que responder.

### No rompas

¿Por qué está mal/qué problemas trae romper encapsulamiento?

Esta mal romper encapsulamiento ya que esto suele implicar que estamos accediendo a datos a los que no deberiamos. Lo ideal seria que estos datos solo sean accesibles por la clase misma, y los metodos de la misma. Romper el encapsulamiento puede traer numerosos problemas que rompen la logica interna del modelo que estamos representando de la realidad, ya que si cambiamos algun ente de nuestro modelo que rompe encapsulamiento, podriamos indirectamente estar modificando otro de nuestro modelo.

Por ejemplo, si estamos modelando un auto que tiene como colaborador interno la velocidad actual, y damos acceso a otras clases a esta velocidad para que la modifiquen a discrecion, estas podrian romper con la idea de auto que queremos establecer con cosas como ir a una velocidad superior a la velocidad maxima del auto o cambios de velocidad bruscos que nuestro auto no puede tolerar. Para solucionar esto podriamos tener metodos de aceleracion/desaceleracion que permitan al auto ajustar su velocidad el mismo teniendo en cuenta su velocidad maxima, capacidad de frenado, y aceleracion maxima.

Esto permite modelar la realidad de una manera mas adecuada y consistente, donde tambien respetamos los roles de cada ente.
