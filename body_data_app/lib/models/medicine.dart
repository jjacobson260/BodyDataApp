import 'package:isar/isar.dart';

part 'medicine.g.dart';

@Collection()
class Medicine {
  Id id = Isar.autoIncrement; // you can also use an integer id

  late DateTime timestamp;
  @Index()
  late String name;
  late double dosage;
  late String unit;
  
}