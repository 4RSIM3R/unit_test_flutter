import 'dart:math';

class Human {
  String _name;
  int _age;
  List<int> _luckyNumber = [];
  String get name => _name;
  List<int> get luckyNumber => _luckyNumber;
  int get age => _age;
  set name(String newName) => _name = newName;
  set age(int newAge) {
    if (newAge < 0) {
      newAge *= -1;
    }
    _age = newAge;
  }

  Human() {
    name = "Cak Suku";
    age = 0;
    Random random = Random();
    for (var i = 0; i < 5; i++) {
      _luckyNumber.add(random.nextInt(11));
    }
  }
}
