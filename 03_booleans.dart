void main() {
  /**
   * Una variable booleana nos permite almacenar valores de verdadero y falso, 
   * para definir una variable booleana usamos la palabra reservada bool
   */

  bool isOn = true;

  // Podemos negar el valor de una booleano usando el carácter "!"
  bool isOff = !isOn;

  // ignore: dead_code
  if (isOff) {
    print('the switch is off');
  } else {
    print('the switch is on');
  }
}
