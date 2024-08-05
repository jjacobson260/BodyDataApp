import 'package:isar/isar.dart';

part 'export.g.dart';

@Collection()
class Export {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String data_stream;
  late String export_type;
}