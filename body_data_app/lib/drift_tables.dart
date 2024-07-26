import 'package:drift/drift.dart';

class PoopData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get bristol_rating => integer()();
  IntColumn get urgency => integer()();
  BoolColumn get blood => boolean()();
}

class MedicineData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get medicine_name => text()();
  RealColumn get dosage => real()(); 
  TextColumn get unit => text()();
}

class FoodData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get description => text()();
  TextColumn get ingredients_json => text().nullable()();
  TextColumn get image_path => text().nullable()();
  IntColumn get recipe_id => integer().nullable().references(Recipes, #id)();
  TextColumn get location => text().nullable()();
}

class MoodData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get rating => integer()();
  TextColumn get moods_json => text()();
  TextColumn get note => text()();
}

class JournalData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get entry => text()();
}

class ExportLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get export_type => text()();
  DateTimeColumn get last_export => dateTime()();
}

class SleepData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get sleep_time => dateTime()();
  DateTimeColumn get wake_time => dateTime().nullable()();
  TextColumn get dream_log => text().nullable()();
  BoolColumn get STILL_ASLEEP => boolean()();
}

class ThoughtData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get start_time => dateTime()();
  DateTimeColumn get end_time => dateTime()();
  IntColumn get length => integer()();
  IntColumn get depth => integer()();
  TextColumn get thought_log => text()();
  BoolColumn get STILL_THINKING => boolean()();
}

class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  TextColumn get category => text()();
}

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get created_by => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get ingredients_json => text()();
  TextColumn get steps_json => text().nullable()();
}