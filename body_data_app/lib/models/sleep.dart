import 'package:isar/isar.dart';

part 'sleep.g.dart';

@Collection()
class Sleep {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  late DateTime sleep_time;
  late DateTime? wake_time;
  late String? dream_log;
  late String? location;
  late bool STILL_ASLEEP;
}