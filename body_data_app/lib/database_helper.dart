
import 'package:body_data_app/models/medicine.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'models/poop.dart';
import 'models/food.dart';
import 'models/mood.dart';
import 'models/journal.dart';
import 'models/thought.dart';
import 'models/sleep.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';
import 'models/export.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  late final Isar db;
  
  
  

  // Create a logger instance for the DatabaseHelper class
  final Logger _logger = Logger('DatabaseHelper');

  void initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema, 
                          MedicineSchema,
                          FoodSchema,
                          MoodSchema,
                          JournalSchema,
                          ThoughtSchema,
                          SleepSchema,
                          IngredientSchema,
                          RecipeSchema,
                          ExportSchema],
                          directory: directory.path);
  }

  Future<List<dynamic>> getAllFromTable(String tableName) async {
    try {
      final dataList = await getFunctionForTable(tableName).call();
      _logger.info('Querying all $tableName data');
      return dataList;
    } catch (e) {
      _logger.severe('Error getting all data from table: $tableName \nerror:$e');
      return [];
    } finally {
      await db.close();
    }
  }

  Future<List<dynamic>> getAllFromTableSinceDate<T>(String tableName, DateTime date) async {
    try {
      final collection = db.collection<T>();

      // Assuming that the collection has a field named 'timestamp'
      final dataList = await getDataSinceDateForTable(tableName, date);
      _logger.info('Querying all $T data since $date');
      return dataList;
    } catch (e) {
      _logger.severe('Error getting data since $date from collection: $T \nerror:$e');
      return [];
    } finally {
      await db.close();
    }
  }

  Future<List<Map<String, dynamic>>> getAllFromTableSinceDateAsMap<T>(String tableName, DateTime date) async {
    try {
      final collection = db.collection<T>();

      // Assuming that the collection has a field named 'timestamp'
      final dataList = await getDataSinceDateAsMapForTable(tableName, date);
      _logger.info('Querying all $T data since $date');
      return dataList;
    } catch (e) {
      _logger.severe('Error getting data since $date from collection: $T \nerror:$e');
      return [];
    } finally {
      await db.close();
    }
  }

  Future<dynamic> getDataSinceDateForTable(String tableName, DateTime date) async {
    var tablename = tableName.toLowerCase();
    switch (tablename) {
      case 'poops':
        return db.poops.where().filter().timestampGreaterThan(date).findAll();
      case 'medicines':
        return db.medicines.where().filter().timestampGreaterThan(date).findAll();
      case 'foods':
        return db.foods.where().filter().timestampGreaterThan(date).findAll();
      case 'moods':
        return db.moods.where().filter().timestampGreaterThan(date).findAll();
      case 'journals':
        return db.journals.where().filter().timestampGreaterThan(date).findAll();
      case 'thoughts':
        return db.thoughts.where().filter().timestampGreaterThan(date).findAll();
      case 'sleeps':
        return db.sleeps.where().filter().timestampGreaterThan(date).findAll();
      case 'ingredients':
        return db.ingredients.where().filter().timestampGreaterThan(date).findAll();
      case 'recipes':
        return db.recipes.where().filter().timestampGreaterThan(date).findAll();
      case 'exports':
        return db.exports.where().filter().timestampGreaterThan(date).findAll();
      default:
        throw Exception('Invalid table name: $tableName');
    }
  }

  Future<List<Map<String, dynamic>>> getAllDataFromTableAsMap(String tableName) async {
    var tablename = tableName.toLowerCase();
    switch (tablename) {
      case 'poops':
        return getPoopDataAsMap();
      case 'medicines':
        return getMedicineDataAsMap();
      case 'foods':
        return getFoodDataAsMap();
      case 'moods':
        return getMoodDataAsMap();
      case 'journals':
        return getJournalDataAsMap();
      case 'thoughts':
        return getThoughtDataAsMap();
      case 'sleeps':
        return getSleepDataAsMap();
      case 'ingredients':
        return getIngredientDataAsMap();
      case 'recipes':
        return getRecipeDataAsMap();
      case 'exports':
        return getExportDataAsMap();
      default:
        throw Exception('Invalid table name: $tableName');
    }
  }

  Future<List<Map<String, dynamic>>> getDataSinceDateAsMapForTable(String tableName, DateTime date) async {
    var tablename = tableName.toLowerCase();
    switch (tablename) {
      case 'poops':
        return getPoopDataSinceDateAsMap(date);
      case 'medicines':
        return getMedicineDataSinceDateAsMap(date);
      case 'foods':
        return getFoodDataSinceDateAsMap(date);
      case 'moods':
        return getMoodDataSinceDateAsMap(date);
      case 'journals':
        return getJournalDataSinceDateAsMap(date);
      case 'thoughts':
        return getThoughtDataSinceDateAsMap(date);
      case 'sleeps':
        return getSleepDataSinceDateAsMap(date);
      case 'ingredients':
        return getIngredientDataSinceDateAsMap(date);
      case 'recipes':
        return getRecipeDataSinceDateAsMap(date);
      case 'exports':
        return getExportDataSinceDateAsMap(date);
      default:
        throw Exception('Invalid table name: $tableName');
    }
  }

  Future<dynamic> Function() getFunctionForTable(String tableName) {
    switch (tableName) {
      case 'Poops':
        return db.poops.where().findAll;
      case 'Medicines':
        return db.medicines.where().findAll;
      case 'Foods':
        return db.foods.where().findAll;
      case 'Moods':
        return db.moods.where().findAll;
      case 'Journals':
        return db.journals.where().findAll;
      case 'Thoughts':
        return db.thoughts.where().findAll;
      case 'Sleeps':
        return db.sleeps.where().findAll;
      case 'Ingredients':
        return db.ingredients.where().findAll;
      case 'Recipes':
        return db.recipes.where().findAll;
      case 'Exports':
        return db.exports.where().findAll;
      default:
        throw Exception('Invalid table name: $tableName');
    }
  }

  CollectionSchema getCollectionSchema(String tableName) {
    switch (tableName) {
      case 'Poops':
        return PoopSchema;
      case 'Medicines':
        return MedicineSchema;
      case 'Foods':
        return FoodSchema;
      case 'Moods':
        return MoodSchema;
      case 'Journals':
        return JournalSchema;
      case 'Thoughts':
        return ThoughtSchema;
      case 'Sleeps':
        return SleepSchema;
      case 'Ingredients':
        return IngredientSchema;
      case 'Recipes':
        return RecipeSchema;
      case 'Exports':
        return ExportSchema;
      default:
        throw Exception('Invalid table name: $tableName');
    }
  }

  Future<int> insertPoopData(Poop data) async {
    try {
      int id = -1;
      db.writeTxn(() async {
        id = await db.poops.put(data); // insert & update
        _logger.info('Inserted poop data with id: $id');
      });
      
      return id;
    } catch (e) {
      _logger.severe('Error inserting poop with data: $data \nerror: $e');
      return -1;
    }
  }

  Future<Null> updatePoopData(Poop data) async {
    try {
      
      db.writeTxn(() async {
        await db.poops.put(data); // insert & update
      });
      _logger.info('Updated poop data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating poop with data: $data \nerror: $e');
    }
    
  }

  Future<bool> deletePoopData(int id) async {
    try {
      _logger.info('Deleting poop data with id: $id');
      final success = await db.poops.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting poop with id: $id \nerror: $e');
      return false;
    }
  }

  Future<List<Poop>> getPoopData() async {
    try {
      final poopDataList = await db.poops.where().findAll();
      _logger.info('Querying all poop data');
      return poopDataList;
    } catch (e) {
      _logger.severe('Error getting poops \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPoopDataAsMap() async {
    try { 
      final poopDataList = await db.poops.where().findAll();
      _logger.info('Querying all poop data');
      final poopDataMapList = poopDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'bristolRating': object.bristolRating,
          'urgency': object.urgency,
          'blood': object.blood,
          'image_path': object.imagePath,
          'location': object.location
        };
      }).toList();
      return poopDataMapList;
    } catch (e) {
      _logger.severe('Error getting poops as map \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPoopDataSinceDateAsMap(DateTime date) async {
    try { 
      final poopDataList = await db.poops.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all poop data');
      final poopDataMapList = poopDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'bristolRating': object.bristolRating,
          'urgency': object.urgency,
          'blood': object.blood,
          'image_path': object.imagePath,
          'location': object.location
        };
      }).toList();
      return poopDataMapList;
    } catch (e) {
      _logger.severe('Error getting poops as map \nerror: $e');
      return [];
    }
  }

  Future<double> getAverageBristolRatingForDays(int days) async {
    try {
      final now = DateTime.now();
      final pastDate = now.subtract(Duration(days: days));
      // get average rating
      final result = await db.poops.where().filter().timestampGreaterThan(pastDate).bristolRatingProperty().average();
      _logger.info('Got average bristol rating of: $result');
      return result;
    } catch (e) {
      _logger.severe('Error getting average bristol rating for days: $days \nerror: $e');
      return -1;
    }
  }

  Future<double> getAverageUrgencyForDays(int days) async {
    try {
      final now = DateTime.now();
      final pastDate = now.subtract(Duration(days: days));
      // get average rating
      final result = await db.poops.where().filter().timestampGreaterThan(pastDate).urgencyProperty().average();
      _logger.info('Got average urgency of: $result');
      return result;
    } catch (e) {
      _logger.severe('Error getting average urgency for days: $days \nerror: $e');
      return -1;
    }
  }

  Future<int> getBMCountForDays(int days) async {
    try {
      final now = DateTime.now();
      final pastDate = now.subtract(Duration(days: days));

      final result = await db.poops.where().filter().timestampGreaterThan(pastDate).count();
      _logger.info('Got BM count of: $result');
      return result;
    } catch (e) {
      _logger.severe('Error getting bm count for days: $days \nerror: $e');
      return -1;
    }
  }

  Future<int> insertMedicineData(Medicine data) async {
    try {
      int id = -1;
      db.writeTxn(() async {
        id = await db.medicines.put(data); // insert & update
      });
      _logger.info('Inserted medicine data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting medicine data \nerror: $e');
      return -1;
    }
  }

  Future<void> updateMedicineData(Medicine data) async {
    try {
      db.writeTxn(() async {
        await db.medicines.put(data); // insert & update
      });
      _logger.info('Updated medicine data with id: ${data.id} with data: $data');
    } catch (e) {
      _logger.severe('Error updating medicine data \nerror: $e');
    }
  }

  Future<List<Medicine>> getMedicineData() async {
    try{
      final medicineDataList = await db.medicines.where().findAll();
      _logger.info('Querying all medicine data');
      return medicineDataList;
    } catch (e) {
      _logger.severe('Error getting medicine data \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMedicineDataAsMap() async {
    try {
      final medicineDataList = await db.medicines.where().findAll();
      _logger.info('Querying all medicine data');
      final medicineDataMapList = medicineDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'name': object.name,
          'dosage': object.dosage,
          'unit': object.unit
        };
      }).toList();
      return medicineDataMapList;
    } catch (e) {
      _logger.severe('Error getting medicine data as map\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMedicineDataSinceDateAsMap(DateTime date) async {
    try {
      final medicineDataList = await db.medicines.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all medicine data');
      final medicineDataMapList = medicineDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'name': object.name,
          'dosage': object.dosage,
          'unit': object.unit
        };
      }).toList();
      return medicineDataMapList;
    } catch (e) {
      _logger.severe('Error getting medicine data as map\nerror: $e');
      return [];
    }
  }

  Future<bool> deleteMedicineData(int id) async {
    try {
      _logger.info('Deleting medicine data with id: $id');
      final success = await db.medicines.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting medicine data with id: $id\nerror: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> getMedicineDetails(String medicineName) async {
    try {
      _logger.info('Querying medicine details for: $medicineName');
      // this should only return 1
      final resultList = await db.medicines.where().nameEqualTo(medicineName).findAll();
      final result = resultList[0];

      return {'dosage': result.dosage, 'unit': result.unit};
    } catch (e) {
      _logger.severe('Error getting medicine details for medicine: $medicineName\nerror: $e');
      return {};
    }
  }

  Future<List<String>> getMedicineUnits() async {
    try {
      _logger.info('Querying distinct medicine units');
      final result = await db.medicines.where().distinctByUnit().findAll();
      List<String> medicineUnits = result.map((e) => e.unit).toList();

      _logger.info('Found ${medicineUnits.length} distinct medicine units');

      return medicineUnits;
    } catch (e) {
      _logger.severe('Error getting medicine units\nerror: $e');
      return [];
    }
  }

  Future<List<String>> getMedicineNames() async {
    try {
      _logger.info('Querying distinct medicine names');
      var result = await db.medicines.where().distinctByName().findAll();
      List<String> medicineNames = result.map((e) => e.name).toList();

      _logger.info('Found ${medicineNames.length} distinct medicine names');

      return medicineNames;
    } catch (e) {
      _logger.severe('Error getting medicine names\nerror: $e');
      return [];
    }
  }

  Future<int> insertFoodData(Food data) async {
    try{
      var id = -1;
      db.writeTxn(() async {
        id = await db.foods.put(data); // insert & update
      });
      _logger.info('Inserted food data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting food data: $data\nerror: $e');
      return -1;
    }
  }

  Future<void> updateFoodData(Food data) async {
    try{
      var id = -1;
      db.writeTxn(() async {
        await db.foods.put(data); // insert & update
      });
      _logger.info('Inserted food data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating food data: $data\nerror: $e');
    }
  }

  Future<List<Food>> getFoodData() async {
    try {
      _logger.info('Querying all food data');
      final foodDataList = await db.foods.where().findAll();

      return foodDataList;
    } catch (e) {
      _logger.severe('Error getting food data\nerror: $e');
      return [];
    }
  }

  Future<bool> deleteFoodData(int id) async {
    try {
      _logger.info('Deleting food data with id: $id');
      final success = await db.foods.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting food data: $id\nerror: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getFoodDataAsMap() async {
    try {
      final foodDataList = await db.foods.where().findAll();
      _logger.info('Querying all food data');
      final foodDataMapList = foodDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'description': object.description,
          'ingredients_json': object.ingredients_json,
          'recipe_id': object.recipe_id,
          'image_path': object.image_path,
          'location': object.location
        };
      }).toList();
      return foodDataMapList;
    } catch (e) {
      _logger.severe('Error getting food data as map\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getFoodDataSinceDateAsMap(DateTime date) async {
    try {
      final foodDataList = await db.foods.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all food data');
      final foodDataMapList = foodDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'description': object.description,
          'ingredients_json': object.ingredients_json,
          'recipe_id': object.recipe_id,
          'image_path': object.image_path,
          'location': object.location
        };
      }).toList();
      return foodDataMapList;
    } catch (e) {
      _logger.severe('Error getting food data as map\nerror: $e');
      return [];
    }
  }

  Future<int> insertMoodData(Mood data) async {
    try {
      var id = -1;
      db.writeTxn(() async {
        id = await db.moods.put(data); // insert & update
      });
      _logger.info('Inserted mood data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting mood data: $data\nerror: $e');
      return -1;
    }
  }
  
  Future<void> updateMoodData(Mood data) async {
    try {
      db.writeTxn(() async {
        await db.moods.put(data); // insert & update
      });
      _logger.info('Updated mood data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating mood data: $data\nerror: $e');
    }
  }

  Future<List<Mood>> getMoodData() async {
    try{
      _logger.info('Querying all mood data');
      final moodDataList = await db.moods.where().findAll();

      return moodDataList;
    } catch (e) {
      _logger.severe('Error getting mood data\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMoodDataAsMap() async {
    try {
      final moodDataList = await db.moods.where().findAll();
      _logger.info('Querying all mood data');
      final moodDataMapList = moodDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'rating': object.rating,
          'moods_json': object.moods_json,
          'note': object.note,
          'location': object.location
        };
      }).toList();
      return moodDataMapList;
    } catch (e) {
      _logger.severe('Error getting mood data as map\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMoodDataSinceDateAsMap(DateTime date) async {
    try {
      final moodDataList = await db.moods.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all mood data');
      final moodDataMapList = moodDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'rating': object.rating,
          'moods_json': object.moods_json,
          'note': object.note,
          'location': object.location
        };
      }).toList();
      return moodDataMapList;
    } catch (e) {
      _logger.severe('Error getting mood data as map\nerror: $e');
      return [];
    }
  }

  Future<bool> deleteMoodData(int id) async {
    try {
      _logger.info('Deleting mood data with id: $id');
      final success = await db.moods.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting mood data: $id\nerror: $e');
      return false;
    }
  }

  Future<int> insertJournalData(Journal data) async {
    try {
      var id = -1;
      db.writeTxn(() async {
        id = await db.journals.put(data); // insert & update
      });
      _logger.info('Inserted journal data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting journal data: $data\nerror: $e');
      return -1;
    }
  }

  Future<void> updateJournalData(Journal data) async {
    try {
      db.writeTxn(() async {
        await db.journals.put(data); // insert & update
      });
      _logger.info('Updated journal data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating journal data: $data\nerror: $e');
    }
  }

  Future<List<Journal>> getJournalData() async {
    try {
      _logger.info('Querying all journal data');
      final journalDataList = await db.journals.where().findAll();

      return journalDataList;
    } catch (e) {
      _logger.severe('Error getting journal data\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getJournalDataAsMap() async {
    try {
      final journalDataList = await db.journals.where().findAll();
      _logger.info('Querying all journal data');
      final journalDataMapList = journalDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'entry': object.entry,
          'image_path': object.image_path,
          'location': object.location
        };
      }).toList();
      return journalDataMapList;
    } catch (e) {
      _logger.severe('Error getting journal data as map\nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getJournalDataSinceDateAsMap(DateTime date) async {
    try {
      final journalDataList = await db.journals.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all journal data');
      final journalDataMapList = journalDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'entry': object.entry,
          'image_path': object.image_path,
          'location': object.location
        };
      }).toList();
      return journalDataMapList;
    } catch (e) {
      _logger.severe('Error getting journal data as map\nerror: $e');
      return [];
    }
  }

  Future<bool> deleteJournalData(int id) async {
    try{
      _logger.info('Deleting journal data with id: $id');
      final success = await db.journals.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting journal data: $id\nerror: $e');
      return false;
    }
  }

  Future<int> insertThoughtData(Thought data) async {
    try {
      var id = 0;
      db.writeTxn(() async {
        id = await db.thoughts.put(data); // insert & update
        _logger.info('Inserted thought data with id: $id');
      });
      
      return id;
    } catch (e) {
      _logger.severe('Error inserting thought data: $data\nerror: $e');
      return -1;
    }
  }

  Future<void> updateThoughtData(Thought data) async {
    try {
      db.writeTxn(() async {
        await db.thoughts.put(data); // insert & update
      });
      _logger.info('Updated thought data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating thought data: $data \nerror: $e');
    }
  }

  Future<List<Thought>> getThoughtData() async {
    try {
      _logger.info('Querying all thought data');
      final thoughtDataList = await db.thoughts.where().findAll();

      return thoughtDataList;
    } catch (e) {
      _logger.severe('Error getting thought data \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getThoughtDataAsMap() async {
    try {
      final thoughtDataList = await db.thoughts.where().findAll();
      _logger.info('Querying all thought data');
      final thoughtDataMapList = thoughtDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'thought_log': object.thought_log,
          'start_time': object.start_time,
          'end_time': object.end_time,
          'length': object.length,
          'depth': object.depth,
          'location': object.location,
          'STILL_THINKING': object.STILL_THINKING
        };
      }).toList();
      return thoughtDataMapList;
    } catch (e) {
      _logger.severe('Error getting thought data as map \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getThoughtDataSinceDateAsMap(DateTime date) async {
    try {
      final thoughtDataList = await db.thoughts.where().filter().end_timeGreaterThan(date).findAll();
      _logger.info('Querying all thought data');
      final thoughtDataMapList = thoughtDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'thought_log': object.thought_log,
          'start_time': object.start_time,
          'end_time': object.end_time,
          'length': object.length,
          'depth': object.depth,
          'location': object.location,
          'STILL_THINKING': object.STILL_THINKING
        };
      }).toList();
      return thoughtDataMapList;
    } catch (e) {
      _logger.severe('Error getting thought data as map \nerror: $e');
      return [];
    }
  }

  Future<bool> deleteThoughtData(int id) async {
    try {
      _logger.info('Deleting thought data with id: $id');
      final success = await db.thoughts.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting thought: $id \nerror: $e');
      return false;
    }
  }

  Future<int> getMaxThoughtLogId() async {
    try {
      
      _logger.info('Querying max sleep log id');
      final maxId = await db.thoughts.where().idProperty().max();

      _logger.info('Got max id: $maxId');
      return maxId ?? 0;  // Return 0 if maxId is null
    } catch (e) {
      _logger.severe('Error querying max sleep log id: $e');
      return 0;  // Return 0 in case of error
    }

  }

  Future<Thought?> getStillThinkingEntry() async {
    try {
      final result = await db.thoughts.where().filter().sTILL_THINKINGEqualTo(true).findFirst();
      return result;
    } catch (e) {
      _logger.severe('Error getting still thinking entry \nerror: $e');
      return null;
    }
  }

  Future<int> insertSleepData(Sleep data) async {
    try { 
      var id = -1;
      db.writeTxn(() async {
        id = await db.sleeps.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting sleep data: $data \nerror: $e');
      return -1;
    }
  }

  Future<void> updateSleepData(Sleep data) async {
    try {
      db.writeTxn(() async {
        await db.sleeps.put(data); // insert & update
      });
      _logger.info('Updated sleep data with id: ${data.id}');
    } catch (e) {
      _logger.severe('Error updating sleep data: $data \nerror: $e');
    }
  }

  Future<List<Sleep>> getSleepData() async {
    try {
      _logger.info('Querying all sleep data');
      final sleepDataList = await db.sleeps.where().findAll();

      return sleepDataList;
    } catch (e) {
      _logger.severe('Error getting sleep data \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getSleepDataAsMap() async {
    try {
      final sleepDataList = await db.sleeps.where().findAll();
      _logger.info('Querying all sleep data');
      final sleepDataMapList = sleepDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'sleep_time': object.sleep_time,
          'wake_time': object.wake_time,
          'dream_log': object.dream_log,
          'location': object.location,
          'STILL_ASLEEP': object.STILL_ASLEEP
        };
      }).toList();
      return sleepDataMapList;
    } catch (e) {
      _logger.severe('Error getting sleep data as map \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getSleepDataSinceDateAsMap(DateTime date) async {
    try {
      final sleepDataList = await db.sleeps.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all sleep data');
      final sleepDataMapList = sleepDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'sleep_time': object.sleep_time,
          'wake_time': object.wake_time,
          'dream_log': object.dream_log,
          'location': object.location,
          'STILL_ASLEEP': object.STILL_ASLEEP
        };
      }).toList();
      return sleepDataMapList;
    } catch (e) {
      _logger.severe('Error getting sleep data as map \nerror: $e');
      return [];
    }
  }

  Future<bool> deleteSleepData(int id) async {
    try {
      _logger.info('Deleting sleep data with id: $id');
      final success = await db.sleeps.delete(id);
      return success;
    } catch (e) {
      _logger.severe('Error deleting sleep data: $id \nerror: $e');
      return false;
    }
  }

  Future<Sleep?> getStillAsleepEntry() async {
    try {
      final result = await db.sleeps.where().filter().sTILL_ASLEEPEqualTo(true).findFirst();
      return result;
    } catch (e) {
      _logger.severe('Error getting still asleep entry \nerror: $e');
    }
    return null;
  }

  Future<int> getMaxSleepLogId() async {
    try {
      
      _logger.info('Querying max sleep log id');
      final maxId = await db.sleeps.where().idProperty().max();

      _logger.info('Got max id: $maxId');
      return maxId ?? 0;  // Return 0 if maxId is null
    } catch (e) {
      _logger.severe('Error querying max sleep log id: $e');
      return 0;  // Return 0 in case of error
    }
  }
  

  Future<int> insertIngredient(Ingredient data) async {
    var id = -1;
    try {
      db.writeTxn(() async {
        id = await db.ingredients.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
      return id;
    }  
  }

  Future<void> updateIngredient(Ingredient data) async {
    try {
      db.writeTxn(() async {
        await db.ingredients.put(data); // insert & update
      });
      _logger.info('Updated ingredient data with data: $data');
    } catch (e) {
      _logger.severe('Error updating ingredient with data: $data \nerror: $e');
    }  
  }

  Future<bool> deleteIngredient(int id) async {
    try{
      _logger.info('Deleting ingredient data with id: $id');
      final success = await db.sleeps.delete(id);
      return success;
    }  catch (e) {
      _logger.severe('Error deleting ingredient with id: $id \nerror: $e');
      return false;
    }  
    
  }

  Future<bool> useIngredient(Ingredient ingredient) async {
    try{
          ingredient.last_used = DateTime.now();
      updateIngredient(ingredient);
      return true;
    } catch (e) {
      _logger.severe('Error using ingredient with id: ${ingredient.id} \nerror: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getIngredientDataAsMap() async {
    try {  
      final ingredientDataList = await db.ingredients.where().findAll();
      _logger.info('Querying all ingredient data');
      final ingredientDataMapList = ingredientDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'last_used': object.last_used,
          'name': object.name,
          'icon': object.icon,
          'category': object.category
        };
      }).toList();
      return ingredientDataMapList;
    } catch (e) {
      _logger.severe('Error getting ingredients as map \nerror: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getIngredientDataSinceDateAsMap(DateTime date) async {
    try {  
      final ingredientDataList = await db.ingredients.where().filter().timestampGreaterThan(date).findAll();
      _logger.info('Querying all ingredient data');
      final ingredientDataMapList = ingredientDataList.map((object) {
        return {
          'id': object.id,
          'timestamp': object.timestamp,
          'last_used': object.last_used,
          'name': object.name,
          'icon': object.icon,
          'category': object.category
        };
      }).toList();
      return ingredientDataMapList;
    } catch (e) {
      _logger.severe('Error getting ingredients as map \nerror: $e');
      return [];
    }
  }

  Future<List<Ingredient>> getIngredients() async {
    try {
          final result = await db.ingredients.where().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredients\nerror: $e');
      return [];
    }  
  }

  Future<List<Ingredient>> getIngredientsByRecency() async {
    try {
          final result = await db.ingredients.where().sortByTimestampDesc().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredients by recency\nerror: $e');
      return [];
    }  
  }

  Future<List<Ingredient>> getIngredientsCategoryByRecency(String category) async {
    try {
          final result = await db.ingredients.where().filter().categoryEqualTo(category).sortByTimestampDesc().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredient category by recency\nerror: $e');
      return [];
    } 
  }

  Future<List<Ingredient>> getIngredientsByNamePrefix(String prefix) async {
    try {
          final ingredients = await db.ingredients
        .where()
        .filter()
        .nameStartsWith(prefix)
        .sortByName()
        .findAll();
      return ingredients;
    } catch (e) {
      _logger.severe('Error getting ingredients by name prefix\nerror: $e');
      return [];
    }

  }

  Future<int> insertRecipe(Recipe data) async {
        var id = -1;
    try {
      db.writeTxn(() async {
        id = await db.recipes.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
      return 0;
    }  
  }

  Future<void> updateRecipe(Recipe data) async {
        var id = -1;
    try {
      db.writeTxn(() async {
        await db.recipes.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
    } catch (e) {
      _logger.severe('Error updating ingredient with data: $data \nerror: $e');
    }  
  }

  Future<bool> deleteRecipe(int id) async {
    try{
          _logger.info('Deleting ingredient data with id: $id');
      final success = await db.sleeps.delete(id);
      return success;
    }  catch (e) {
      _logger.severe('Error deleting ingredient with id: $id \nerror: $e');
      return false;
    }  
    
  }

  Future<List<Recipe>> getRecipes() async {
    try {
          final result = await db.recipes.where().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting recipe\nerror: $e');
      return [];
    }  
  }

  Future<List<Map<String, dynamic>>> getRecipeDataAsMap() async {
        final recipeDataList = await db.recipes.where().findAll();
    _logger.info('Querying all recipe data');
    final recipeDataMapList = recipeDataList.map((object) {
      return {
        'id': object.id,
        'timestamp': object.timestamp,
        'created_by': object.created_by,
        'name': object.name,
        'description': object.description,
        'ingredients_json': object.ingredients_json,
        'steps_json': object.steps_json,
        'image_path': object.image_path
      };
    }).toList();
    return recipeDataMapList;
  }

  Future<List<Map<String, dynamic>>> getRecipeDataSinceDateAsMap(DateTime date) async {
        final recipeDataList = await db.recipes.where().filter().timestampGreaterThan(date).findAll();
    _logger.info('Querying all recipe data');
    final recipeDataMapList = recipeDataList.map((object) {
      return {
        'id': object.id,
        'timestamp': object.timestamp,
        'created_by': object.created_by,
        'name': object.name,
        'description': object.description,
        'ingredients_json': object.ingredients_json,
        'steps_json': object.steps_json,
        'image_path': object.image_path
      };
    }).toList();
    return recipeDataMapList;
  }

  Future<int> insertExport(Export data) async {
        var id = -1;
    try {
      db.writeTxn(() async {
        id = await db.exports.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
      return 0;
    }  
  }

  Future<void> updateExport(Export data) async {
        var id = -1;
    try {
      db.writeTxn(() async {
        await db.exports.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
    }  
  }

  Future<bool> deleteExport(int id) async {
    try{
          _logger.info('Deleting ingredient data with id: $id');
      final success = await db.sleeps.delete(id);
      return success;
    }  catch (e) {
      _logger.severe('Error deleting ingredient with id: $id \nerror: $e');
      return false;
    }  
    
  }

  Future<List<Export>> getExports() async {
    try {
          final result = await db.exports.where().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting export\nerror: $e');
      return [];
    }  
  }

  Future<List<Map<String, dynamic>>> getExportDataAsMap() async {
        final exportDataList = await db.exports.where().findAll();
    _logger.info('Querying all export data');
    final exportDataMapList = exportDataList.map((object) {
      return {
        'id': object.id,
        'timestamp': object.timestamp,
        'table': object.table,
        'type': object.type
      };
    }).toList();
    return exportDataMapList;
  }

  Future<List<Map<String, dynamic>>> getExportDataSinceDateAsMap(DateTime date) async {
        final exportDataList = await db.exports.where().filter().timestampGreaterThan(date).findAll();
    _logger.info('Querying all export data');
    final exportDataMapList = exportDataList.map((object) {
      return {
        'id': object.id,
        'timestamp': object.timestamp,
        'table': object.table,
        'type': object.type
      };
    }).toList();
    return exportDataMapList;
  }

  Future<DateTime> getLastIncrementalExportByTable(String table) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([ExportSchema], directory: directory.path);
      final result = await db.exports.where().filter().
        tableEqualTo(table).
        typeEqualTo('incremental').
        timestampProperty().max();    
      return result ?? DateTime.fromMillisecondsSinceEpoch(0);
    } catch (e) {
      _logger.severe('Error getting export\nerror: $e');
      return DateTime.now();
    }  
  }
}
 