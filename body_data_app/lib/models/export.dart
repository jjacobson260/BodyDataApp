import 'package:isar/isar.dart';

part 'export.g.dart';

@Collection()
class Export {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String table;
  late String type;
}