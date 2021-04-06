void main() {
  /**
   * Para crear una variable de tipo string usamos la palabra reservada String
   */
  String hello = 'Hello ';
  String name = 'Sergio';

  /**
   * Cadenas de carácteres funcionan como arrays 
   * por lo que podemos acceder a su longitud
   * y a sus carácteres indivividuales
   */
  print('${hello.length}');
  print('${hello[0]}');
  print('${hello + name}');

  /**
   * La palabra reservada int se usa para definir numero enteros
   * pada definir un numero con coma flotante usamos la palabra reservada double
   * Una variable de tipo num puede ser un entero o un numero de coma flotante 
   */
  int students = 10;
  double pi = 3.1416;
  num currency = 4.5;

  print('$students + $pi');
}
