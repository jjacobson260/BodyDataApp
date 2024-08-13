import 'package:isar/isar.dart';

part 'recipe.g.dart';

@Collection()
class Recipe {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String created_by;
  late String name;
  late String description;
  late String ingredients_json;
  late String steps_json;
  late String? image_path;
}