import 'package:isar/isar.dart';

part 'thought.g.dart';

@Collection()
class Thought {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late String thought_log;
  late DateTime? start_time;
  late DateTime? end_time;
  late int? length;
  late int? depth;
  late bool STILL_THINKING;
}