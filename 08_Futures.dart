//Los constructores de una clase no pueden ser asíncronos.

void main() async {
/*
 * Sirve para manejar tareas asíncronas, se definen con la palabra reservada Future
 */
  print('get data');

  httpGet('https://www.google.com/').then((String data) {
    print(data);
  });

  /**
   * async sirve para volver una función asíncrona 
   * mientras que await me permite espera a qué esta función se ejecute.
   */

  print('get data');
  String data = await httpGet('https://www.google.com/');
  print(data);
  print('last print');
}

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 5), () => 'Hola mundo');
}
