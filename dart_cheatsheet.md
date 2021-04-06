# Table of Contents
1. [Variables](#variables-in-dart)
2. [Constructors In Dart](#constructors-in-dart)
3. [Number](#number-utilities)
4. [String](#string-utilities)
5. [Maps](#map-utilities)
6. [Date](#date-utilities)
7. [List](#list-utilities)
8. [Tools](#tools)

# Variables in Dart

En Dart, las variables deben declararse antes de ser utilizadas. Las variables se declaran usando el `tipo de variable` seguido del nombre de la variable que desea declarar. Dart es un lenguaje de tipo inferido, que permite al compilador inferir (conocer) automáticamente el tipo de datos que queremos almacenar en función del valor inicial que asignamos.

Para obtener el tipo de variable en dart se usa la propiedad `runtimeType`

## var
El tipo de variable `var` solo funciona como indicador, para marcar algo como variables sin conocer su tipo real, pero una vez se asigna el tipo, este no puede cambiar

```dart
var name = “Akshay”; /// String
```

## dynamic 
Se usa cuando una variable no quiere ser usara para un tipo de dato restringido

```dart
dynamic score = 56;
```

## Set
Son una colección desordenada de datos únicos.
```dart
Set<String> names = {};
var names = {'Credicorp', 'Capital', 'Negocios', 'Digitales'};
```

## String
Una cadena Dart es una secuencia de unidades de código UTF-16. Puede usar comillas simples o dobles para crear una cadena

```dart
String s1 = 'Single quotes work well for string literals.';
String s2 = "Single quotes work well for string literals.";
String tmplate = 'Hola mi nombre es $name'
String multiline = '''Hola mi\nNombre es\n$name'
```

## num
Los números en `dart` pueden llegar a ser de dos tipos

`int` estos valores no mayores a 64 bits, dependiendo de la plataforma pueden ser desde `2^63` hasta `-2^63` - `1`
```dart
var x = 1;
var hex = 0xDEADBEEF;
```
`double` son números de coma flotante de 64 bits
```dart
var y = 1.1;
var exponents = 1.42e5;
```
A partir de Dart `2.1`, los literales enteros se convierten automáticamente en dobles cuando es necesario:
```dart
double z = 1; // Equivalent to double z = 1.0.
```

## Map

Un `map` es un objeto que asocia `key`-`value`. Tanto las `keys` como los `values` pueden ser cualquier tipo de objeto. Cada `key` se produce solo una vez, pero puede usar el mismo `value` varias veces

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
```

## List
Las listas son un grupo ordenado de objetos
```dart
var list = [1, 2, 3];
```
## DateTime
Representan valores de tiempo que están a una distancia máxima de `100,000,000 días` desde la `hoy`

Tengan en cuenta que las horas se especifican entre `0 y 23`, como en un reloj de 24 horas
```dart
var now = new DateTime.now();
var berlinWallFell = new DateTime.utc(1989, 11, 9);
var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");  // 8:18pm
```

## Valor por defecto
Las variables sin inicializar tienen un valor inicial `null`. Incluso las variables con tipos **numéricos** son inicialmente `null`, porque los números, como todo lo demás en Dart, son `objetos`

## Final y const
Si nunca tiene la intención de cambiar el valor de una variable, use `final` o `const`, ya sea en lugar de var o además de un tipo. Una variable `final` solo se puede configurar una vez; una variable `const` es una constante en tiempo de compilación. (Las variables Const son implícitamente final)

# Constructors in Dart

## Simple Constructor 

Constructor con cada uno de los parametros requeridos

```dart
class Persona{
  Persona(String first_name, String last_name, int age){
    ...
  }
}
```

## Constructor based on factory

Cuando no se tiene toda la data inicial desde un comienzo y se requiere procesar una data para de esta extraer la data inicial requerida se usa el factory, estos son llamados una vez se instancia la clase

```dart
class Persona  {
  final String first_name;
  final String last_name;
  final int age;

  Persona._({
    @required this.first_name,
    @required this.last_name,
    @required this.age,
  });

  factory Persona({
    @required String full_name,
    @required int age,
  }) {
      var name = full_name.trim().split(' ');
    return Persona._(first_name: name[0], last_name: name[1], age: age);
  }
}
```

## Named Constructor

Son multiples constructores creados de forma independiente para satisfacer cada propiedad de la clase

```dart
class Persona {
  int age;
  String first_name;
  String last_name;

  Persona.age(this.age);

  Persona.firstName(this.first_name);

  Persona.lastName(this.last_name);
}
```

## Named Constructor based in Json
A partir de un objeto extraer toda la data requerida para satisfacer cada propiedad de la clase

```dart
class Persona {
  int age;
  String first_name;
  String last_name;

  Persona({this.first_name, this.last_name, this.age});

  Persona.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    age = json['age'];
  }
}
```

# Number Utilities

## tryParse
Analiza una cadena que contiene un número
```dart
print(num.tryParse('hola')); // null
print(num.tryParse('123')); // 123
```

## round(), roundToDouble()
Devuelve el valor más cercano a el número que se evalua
```dart
num numero = -123.345;
numero.round(); // -123
numero.roundToDouble(); // -123
```

## toDouble()
Devuelve el número evaluado como `double`

```dart
num numero = -123.345;
numero.toDouble(); // -123.345
```

## floor()
Devuelve el mayor entero

```dart
num numero = -123.345;
numero.floor(); // -124
```

## ceil()
Devuelve el menor entero no menor que el número evaluado

```dart
num numero = -123.345;
numero.ceil() // -123
```

## remainder()
Devuelve el resto de la división del número evaluado por otro.

```dart
num numero = -123.345;
numero.remainder(2) // -1.3449999999999989
```

## abs()
Devuelve el valor absoluto del número evaluado

```dart
num numero = -123.345;
numero.abs() /// 123.345;
```



# Map Utilities
## addAll()
Esto le permite fusionar todos los `key`-`value` del mapa proporcionado con el actual, si ya existe un `key`, el `value` será reemplazado.

```dart
var user = {
  "firstName": "Tom",
  "age": 25,
};
user.addAll({
  "lastName": "Smith",
  "age": 26,
});
print(user); // => {"firstName": "Tom", "age": 26, "lastName": "Smith"}
```
## containsKey()
Comprueba si el `key` proporcionado existe.
```dart
print(user.containsKey("age")); // => true
print(user.containsKey("accessToken")); // => false
```
## containsValue()
Comprueba si existe el `value` proporcionado.
```dart
print(user.containsValue("Smith")); // => true
print(user.containsValue(40)); // => false
```
## forEach()
Ejecuta la función dada sobre cada `key`-`value`.
```dart
user.forEach((key, value) => print('Key: $key, Value: $value')); // => "Key: firstName, Value: Tom" "Key: age, Value: 26" "Key: lastName, Value: Smith"
```
## putIfAbsent()
Agrega un `key`-`value` si no existe. Si la clave ya existe, se establecerá un nuevo `value`.
```dart
user.putIfAbsent("accessToken", () => "abf329jklr90rnlk2..."); // => {"firstName": "Tom", "age": 26, "lastName": "Smith", "accessToken": "abf329jklr90rnlk2..."}
```
## remove()
Elimina el `key` proporcionada y el `value` asociado, esto devolverá el valor que se eliminó.
```dart
user.remove("accessToken"); // => abf329jklr90rnlk2...
```
## removeWhere()
Elimina el `key`-`value` si la condición dada se cumple
```dart
user.removeWhere((key, value) => key == "lastName");
```
## clear()
Elimina cada `key`-`value` en el mapa.
```dart
user.clear();
print(user); // => {}
```
## update()
Actualiza el `value` de la `key` dada.
```dart
user["age"] = 25;
user.update("age", (dynamic val) => ++val); // => 26
```
Esto también devuelve un nuevo `value`. Para evitar que se arroje un error si el `key` no existe, hay un tercer parámetro:
```dart
user.update("name", (dynamic val) => "Jim", ifAbsent: () => "Jane");
print(user); // => {"age": 26, "name": "Jane"};
```
Actualiza el valor en un `key` especifico:
```dart
user["name"] = "Mary";
```
## Map.from()
Esto técnicamente es un constructor, pero sigue siendo útil como una utilidad. Crea y devuelve una copia del mapa proporcionado.
```dart
var userCopy = Map.from(user);
```

# String Utitilies
## contains()
Permite chequear si dentro de un `String` se encuentra una referencia:
```dart
str1.contains('rem'); // true
```
## startsWith()
Permite chequear si un `String` comienza un conjunto de caracteres:
```dart
str2.startsWith('Lorem'); // true
str3.startsWith('Noorem'); // false
```
## endsWith()
Permite chequear si un `String` termina en un conjunto de caracteres:

```dart
str3.endsWith('ipsum'); // true
str3.endsWith('oopsum'); // false
```
## toLowerCase(), toUpperCase()
Cambia el formato de un `String` sea a `mayúscula` o a `minúsculas`
```dart
str1.toLowerCase(); // lorem
str1.toUpperCase(); // LOREM
```
## split()
Crea un array de `String` a partir de un patrón, separando el `Strig` seleccionado en porciones equivalentes a la cantidad de veces el patron dentro del mismo :
```dart
var str3 = 'Multi.Line.Lorem Lorem ipsum';
str3.split('.'); // ['Multi', 'Line', 'Lorem Lorem ipsum'];
```
## splitMapJoin()
Divide la cadena, convierte cada elemento de la lista y los combina en una nueva cadena:
```dart
str3.splitMapJoin(RegExp(r'^', multiLine: true), 
  onMatch: (m) => '**${m.group(0)} ',
  onNonMatch: (n) => n);
/*
Output: 
** Multi
** Line
** Lorem Lorem ipsum
*/
```
## indexOf(), lastIndexOf()
Devuelve la posición de la primera y la última coincidencia del patrón dado:
```dart
str3.indexOf('rem'); // 13
str3.lastIndexOf('rem'); // 19
str3.lastIndexOf('rem', 18); // 13
```
## trim()
Elimina espacios en blanco iniciales y finales:
```dart
"   $str2  ".trim(); // 'Lorem ipsum'
```
## padLeft(), padRight()
Rellena la cadena a la izquierda y a la derecha con el relleno dado si la cadena es menor que la longitud especificada:
```dart
str1.padLeft(8, 'x'); // xxLorem
str1.padRight(8, 'x'); // Loremxx
```
## replaceAll()
Reemplaza todas las subcadenas que coinciden con el patrón especificado con la cadena de reemplazo:
```dart
str2.replaceAll('e', 'é'); // Lorém
```

# Date Utitlities
## add()
Añade una duración a una fecha:
```dart
var tomorrow = DateTime.now().add(Duration(days:1));
print(tomorrow.day); // => 12
print(tomorrow.hour); // => 17
```
## difference()
Retorna una duración equivalente al tiempo entre 2 fechas
```dart
var tomorrow = DateTime.now().add(Duration(days:1));
var today = DateTime.now();
var diff = tomorrow.difference(today);
diff.inDays; // => 1
diff.inHours; // => 24
diff.inMinutes; // => 1440
```
## isAfter(DateTime other)
Compara si una fecha es despues de otra
```dart
DateTime.now().isBefore(DateTime.now().toUtc()); // => false
```
## isBefore(DateTime other)
Compara si una fecha es antes que otra
```dart
DateTime.now().isBefore(DateTime.now().toUtc()); // => true
```
## compareTo(DateTime other)
Compara si dos fechas son iguales o no
```dart
DateTime.now().compareTo(DateTime.now()); // => 0 (equal)
DateTime.now().compareTo(DateTime.now().toUtc()); // => -1 (not equal)
```
## subtract(Duration duration)
Resta una duración a una fecha dada
```dart
DateTime.now().subtract(
  Duration(days: 7416, hours: 3, minutes: 41, seconds: 56)); 
// => 1969-07-20 20:18:04.000Z
```
## toLocal()
Retorna un `String` con la fecha en la `time zone` local
```dart
moonLanding.toLocal(); // => 1969-07-20 21:18:04.000
```
## toUtc()
Retorna una fecha con el tiempo en formato `UTC`
```dart
moonLanding.toUtc(); // => 1969-07-20 20:18:04.000Z
moonLanding.timeZoneName; // => UTC
```

# List Utitlities
## For
Recorrido de cada uno de los elementos de un array bajo una condicion y un factor de recorrido
```dart
for (var i = 0; i < items.length; i++) {
  print('index=$i, value=${items[i]}');
}
```
## forEch with index
Recorrer cada elemento de una lista teniendo en cuenta la posición que este ocupa dentro de la lista
```dart
final fruitList = ['apple', 'orange', 'mango'];
final fruitMap = myList.asMap(); // {0:'apple', 1:'orange',2:'mango'}
items.asMap().forEach((i, value) {
  print('index=$i, value=$value');
});
```
## generate
Genera una nueva lista a partir de una longitud dada y una funcion que opera como transformer
```dart
List.generate(list.length, (i) => Text(list[i]));
```
## forEach()
Recorrer Cada elemento de un array
```dart
var fruits = ['banana', 'pineapple', 'watermelon'];
fruits.forEach((fruit) => print(fruit)); // => banana pineapple watermelon
```
## map()
Genera una nueva lista despues de transformar cada elemento de la lista evaluada
```dart
var mappedFruits = fruits.map((fruit) => 'I love $fruit').toList();
print(mappedFruits); // => ['I love banana', 'I love pineapple', 'I love watermelon']
```
## contains()
Chequea si un elemento se encuentra dentro de un array o no
```dart
var numbers = [1, 3, 2, 5, 4];
print(numbers.contains(2)); // => true
print(numbers.contains(7)); // => false
```
## sort()
Ordena los elementos de una lista basado en el patron requerido
```dart
numbers.sort((num1, num2) => num1 - num2); // => [1, 2, 3, 4, 5]
```
## reduce(), fold()
Comprime los elementos de una lista en un solo valor segun la funcion pasada por parametro
```dart
var sum = numbers.reduce((curr, next) => curr + next);
print(sum); // => 15
```
```dart
const initialValue = 10;
var sum2 = numbers.fold(initialValue, (curr, next) => curr + next);
print(sum2); // => 25
```
## every()
Confirma si cada elemento de la lista satisface el requerimiento
```dart
List<Map<String, dynamic>> users = [
  { "name": 'John', "age": 18 },
  { "name": 'Jane', "age": 21 },
  { "name": 'Mary', "age": 23 },
];
var is18AndOver = users.every((user) => user["age"] >= 18);
print(is18AndOver); // => true
 ``` 
 ```dart
var hasNamesWithJ = users.every((user) => user["name"].startsWith('J'));
print(hasNamesWithJ); // => false
```
## where(), firstWhere(), singleWhere()
Retorna una coleccion de items que cumplen con el requerimiento.
```dart
/// Retorna todos los elementos que cumplan con la condicion
var over21s = users.where((user) => user["age"] > 21);
print(over21s.length); // => 1
```
```dart
/// Retorna el primer elemento que cumpla con la condicion
var nameJ = users.firstWhere((user) => user["name"].startsWith(‘J’), orElse: () => null);
print(nameJ); // => {name: John, age: 18}
```
```dart
/// De todos los elementos que cumplan con la condicion solo retorna 1
var under18s = users.singleWhere((user) => user[“age”] < 18, orElse: () => null);
print(under18s); // => null
```
## take(), skip()
Retorna una coleccion mientras esta cumpla la condicion de inclusion o exclusion
```dart
var fiboNumbers = [1, 2, 3, 5, 8, 13, 21];
print(fiboNumbers.take(3).toList()); // => [1, 2, 3]
print(fiboNumbers.skip(5).toList()); // => [13, 21]
print(fiboNumbers.take(3).skip(2).take(1).toList()); // => [3]
```
## List.from()
Crea una nueva lista a partir de otra
```dart
var clonedFiboNumbers = List.from(fiboNumbers);
print('Cloned list: $clonedFiboNumbers');
```
## expand()
Aplana un conjunto de elementos dentro de otro conjunto
```dart
var pairs = [[1, 2], [3, 4]];
var flattened = pairs.expand((pair) => pair).toList();
print('Flattened result: $flattened); // => [1, 2, 3, 4]
```
```dart
var input = [1, 2, 3];
var duplicated = input.expand((i) => [i, i]).toList();
print(duplicated); // => [1, 1, 2, 2, 3, 3]
```

# Tools

## [Dart Pad][dart_pad]
Herramienta para testear codigo en dart de forma online

[dart_pad]: https://dartpad.dartlang.org/