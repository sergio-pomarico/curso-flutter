void main() {
  /**
   * Una variable de tipo map es una colecciones de variables organizadas por clave : valor
   * también son conocidos como diccionarios debido a que tiene un termino y una definición
   */
  Map<String, dynamic> persona = <String, dynamic>{
    'nombre': 'Sergio',
    'edad': 28,
    'soltero': true,
  };
  print(persona['nombre']);

  //los mapas pueden contener otras estructuras de datos como otros mapas o listas
  Map<String, dynamic> myMap = {
    'id': 1,
    'name': 'Sergio',
    'finaltial_info': {
      'amount': 1000000,
      'pending_cash_in': 0,
      'has_completed_vinculation': true,
    }
  };

  print(myMap['finaltial_info']);
}
