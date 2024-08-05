import 'package:isar/isar.dart';

part 'poop.g.dart';

@Collection()
class Poop {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late int bristolRating;
  late int urgency;
  late bool blood;
  late String? image_path;
  late String? location;
}