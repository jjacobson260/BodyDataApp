import 'package:isar/isar.dart';

part 'ingredient.g.dart';

@Collection()
class Ingredient {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late DateTime last_used;
  late String name;
  late String icon;
  late String category;
}