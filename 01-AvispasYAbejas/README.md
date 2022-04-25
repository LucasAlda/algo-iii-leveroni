# Preguntas para después de hacer el ejercicio

A continuación les planteamos algunas cuestiones para pensar y contestar.
Las preguntas van a ser evaluadas también.

## Sobre implementar funcionalidad

Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una?
¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo?
Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

No, no los pasamos de una. Fuimos revisando test a test y cumpliendo las exigencias a medida que surgian con cada test. En cuanto a la segunda pregunta, es exactamente lo que hicimos modificando los metodos y mensajes a medida que los test no pasaban. Como por ejemplo en el test 1, vimos que habia una cantidad de huevos de avispa que era igual a 0, entonces implementamos solo esa funcionalidad y la igualamos a 0, en el test 2 vimos que esta funcionalidad estaba relacionada con la reproduccion de las avispas, y asi con el resto de tests del ejercicio.
Es util siempre cuando se tengan test de antemano, que sean bien especificos y cubran todos los casos posibles(TDD).

## Sobre código repetido

¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)?
Responsabilidad de dejar un huevo consumiendo otro insecto
¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat?
¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

Al principio teniamos bastante codigo repetido con las avispas, pero al final no ya que utilizando los parentezcos logramos que las avispas, que tenian compartamientos similares no repitan el codigo (todas intentaban reproducirse, a su manera, en esos casos implementamos los metodos correspondientes; y todas tenian su propia firma genetica y alimento).
El responsable de verificar si hay suficientes polillas u orugas y entonces dejar un huevo es el insecto, ya que es el que pone el huevo y le da el alimento necesario, es su rol en el habitat tener el huevo bajo ciertos requisitos, por otro lado, es el habitat el que se encarga de proveer la informacion de cantidad de recursos disponibles y de llevar el conteo de huevos. La idea que seguimos fue representar la realidad lo mejor posible y respetar los roles/responsabilidades de los objetos que modelamos (por eso creamos objetos como las firmas geneticas de cada avispa y el alimento de cada avispa que si bien no responden mensajes, si representan entes de la realidad por lo que consideramos que vale la pena representarlos, consideramos que esto tenia mas sentido a la alternativa de que fueran strings).

## Sobre código repetido 2

Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código?
Sobre la implementación
¿cómo resolvieron guardar los huevos?
¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban?
Pero la pregunta más importante:
¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Probablemente creariamos una clase avispa, una clase recurso, y otra para la firma genetica para modelar la idea de estos con sus colaboradores y metodos por defecto. Sin embargo aun no vimos como implementar adecuadamente estas clases por lo que fuimos por un modelo mas bien prototipado con parentezcos, para no repetir similitudes.
Los huevos los guardamos en un diccionario con la firma genetica correspondiente como clave, y la cantidad de huevos en la misma como valor.
(Tambien por motivos de escalabilidad y ampliacion hicimos lo mismo con los recursos, usando el recurso como clave y la cantidad de recursos disponibles como valor).
No era necesariamente lo mas sencillo, pero esa sencillez llevaba el coste de trabajar con muchos mas nombres, mas extensos, y resultando en una implementacion menos ampliable. (Usando colaboradores del habitat como cantidadDeHuevosDeGeneticaOrianaYOrnella y lo mismo con Polly, Oriana, etc y recursos). Con nuestra utilizacion de diccionarios logramos un codigo mas compacto, amigable y extendible (por ejemplo, si quisiera agregar un nuevo recurso simplemente se lo agregamos al diccionario sin necesidad de agregar todo un protocolo de metodos y colaboradores nuevos). Como conclusion aunque utilizamos conceptos un poco mas complejos como diccionarios y parentezcos, nos queda una implementacion mas prolija y facil de manejar que de no haberlos usado.
