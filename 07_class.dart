void main() {
  final wolverine = Hero('Wolverine', 'Regeneration', 80);

  print(wolverine);

  final cuadrado = Square(15);
  cuadrado.side = 10;
  print(cuadrado.area);
}

/**
 * para extender clase usamos clases abstractas
 *  que hacen las veces de interfaces
 */
abstract class Character {
  final String name;
  final String skill;
  Character(this.name, this.skill);
}

// Bonus enum
enum Status { none, running, stopped, paused }

/*
 * Para definir una clase usamos la palabra reservada class 
 * se recomienda que el nombre de la clase siempre vaya en mayúscula
 */
class Hero implements Character {
  final String name;
  final String skill;
  final int braveness;
  Hero(this.name, this.skill, this.braveness) : super();
}

/**
 * Si los atributos son privados
 * solo se pueden accesar a ellas usando un getter
 * para asignarles valores un setter 
 */
class Square {
  double _side;
  Square(this._side);

  // setter
  set side(double value) {
    if (value <= 0) throw ('Side must be 0 or negative');
    _side = value;
  }

  // getter
  double get area {
    return _side * _side;
  }
}
