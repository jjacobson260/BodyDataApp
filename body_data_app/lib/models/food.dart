import 'package:isar/isar.dart';

part 'food.g.dart';

@Collection()
class Food {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String description;
  late String ingredients_json;
  late int? recipe_id;
  late String? image_path;
  late String? location;
}