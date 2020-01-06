import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/bloc/human.dart';

void main() {
  group("Testing Human Class", () {
    Human human = Human();
    test("Basic Unit Testing In Flutter", () {
      // TODO : Unit Testing Hanya Ngecek Value Yang Di Harapkan Dan Kenyataan
      expect("Cak Suku", equals(human.name));
    });
    test("Testing age instance in human class", (){
      expect(human.age, equals(0));
    });
    test("Testing value of age instance in human class", (){
      human.age = -10;
      expect(human.age, isPositive);
    });
    test("Testing length of lucky number", (){
      expect(human.luckyNumber.length, equals(5));
    });
  });
}
