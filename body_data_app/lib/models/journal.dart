import 'package:isar/isar.dart';

part 'journal.g.dart';

@Collection()
class Journal {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String entry;
  late String? image_path;
  late String? location;
}