void main() {
  String saludo = greetings(mensaje: 'Saludar', nombre: "Sergio");

  print(saludo);
}

/**
* si una funciona no regresa un valor se debe definir que su tipo sea void 
*/
void myFunction() {
  print('hello');
}

String sayHello() {
  return 'Hello !';
}

// función con parámetros con nombre
String greetings({String mensaje = "", String nombre = ''}) {
  return '$mensaje $nombre';
}
