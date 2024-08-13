import 'package:isar/isar.dart';

part 'mood.g.dart';

@Collection()
class Mood {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late int rating;
  late String moods_json;
  late String note;
  late String? location;
}