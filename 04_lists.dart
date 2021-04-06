void main() {
  /**
   * Una lista es una colección de objetos que tienen algo en común, 
   * Para definir una lista usamos la palabra reservada List también 
   */
  List<int> numeros = [1, 2, 4, 5, 6];
  print(numeros);

  //Validad si es una lista vacia
  print(numeros.length == 0);
  print(numeros.isEmpty);

  //Definir una lista vacia
  List<dynamic> other_numbers = new List.filled(10, null, growable: false);
  other_numbers[0] = 100; //Agregar valores a un elemento de una lista
}
