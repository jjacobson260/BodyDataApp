import 'dart:ffi';

import 'package:body_data_app/models/medicine.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'ingredient_info.dart';
import 'models/poop.dart';
import 'models/medicine.dart';
import 'models/food.dart';
import 'models/mood.dart';
import 'models/journal.dart';
import 'models/thought.dart';
import 'models/sleep.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  late final Isar db;
  

  // Create a logger instance for the DatabaseHelper class
  final Logger _logger = Logger('DatabaseHelper');

  Future<int> insertPoopData(Poop data) async {
    late int id;
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    db.writeTxn(() async {
      id = await db.poops.put(data); // insert & update
    });
    _logger.info('Inserted poop data with id: $id');
    return id;
  }

  Future<Null> updatePoopData(Poop data) async {

    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.poops.put(data); // insert & update
    });
    _logger.info('Updated poop data with id: ${data.id}');
  }

  Future<bool> deletePoopData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    _logger.info('Deleting poop data with id: $id');
    final success = await db.poops.delete(id);
    return success;
  }

  Future<List<Poop>> getPoopData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    final poopDataList = await db.poops.where().findAll();
    _logger.info('Querying all poop data');
    return poopDataList;
  }

  Future<double> getAverageBristolRatingForDays(int days) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));
    // get average rating
    final result = await db.poops.where().filter().timestampGreaterThan(pastDate).bristolRatingProperty().average();
    _logger.info('Got average bristol rating of: $result');
    return result;
  }

  Future<double> getAverageUrgencyForDays(int days) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));
    // get average rating
    final result = await db.poops.where().filter().timestampGreaterThan(pastDate).urgencyProperty().average();
    _logger.info('Got average urgency of: $result');
    return result;
  }

  Future<int> getBMCountForDays(int days) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([PoopSchema], directory: directory.path);
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));

    final result = await db.poops.where().filter().timestampGreaterThan(pastDate).count();
    _logger.info('Got BM count of: $result');
    return result;
  }

  Future<int> insertMedicineData(Medicine data) async {
    late int id;
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    db.writeTxn(() async {
      id = await db.medicines.put(data); // insert & update
    });
    _logger.info('Inserted medicine data with id: $id');
    return id;
  }

  Future<void> updateMedicineData(Medicine data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.medicines.put(data); // insert & update
    });
    _logger.info('Updated medicine data with id: ${data.id} with data: $data');
  }

  Future<List<Medicine>> getMedicineData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    final medicineDataList = await db.medicines.where().findAll();
    _logger.info('Querying all medicine data');
    return medicineDataList;
  }

  Future<bool> deleteMedicineData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    _logger.info('Deleting medicine data with id: $id');
    final success = await db.medicines.delete(id);
    return success;
  }

  Future<Map<String, dynamic>> getMedicineDetails(String medicineName) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    _logger.info('Querying medicine details for: $medicineName');
    // this should only return 1
    final result_list = await db.medicines.where().nameEqualTo(medicineName).findAll();
    final result = result_list[0];

    return {'dosage': result.dosage, 'unit': result.unit};
  }

  Future<List<String>> getMedicineUnits() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    _logger.info('Querying distinct medicine units');
    final result = await db.medicines.where().distinctByUnit().findAll();
    List<String> medicineUnits = result.map((e) => e.unit as String).toList();

    _logger.info('Found ${medicineUnits.length} distinct medicine units');

    return medicineUnits;
  }

  

  

  Future<List<String>> getMedicineNames() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MedicineSchema], directory: directory.path);
    _logger.info('Querying distinct medicine names');
    var result = await db.medicines.where().distinctByName().findAll();
    List<String> medicineNames = result.map((e) => e.name as String).toList();

    _logger.info('Found ${medicineNames.length} distinct medicine names');

    return medicineNames;
  }

  Future<void> insertFoodData(Food data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([FoodSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      id = await db.foods.put(data); // insert & update
    });
    _logger.info('Inserted medicine data with id: $id');
    return id;
  }

  Future<void> updateFoodData(Food data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([FoodSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      await db.foods.put(data); // insert & update
    });
    _logger.info('Inserted food data with id: ${data.id}');
  }

  Future<List<Food>> getFoodData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([FoodSchema], directory: directory.path);
    _logger.info('Querying all food data');
    final foodDataList = await db.foods.where().findAll();

    return foodDataList;
  }

  Future<bool> deleteFoodData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([FoodSchema], directory: directory.path);
    _logger.info('Deleting food data with id: $id');
    final success = await db.foods.delete(id);
    return success;
  }

  Future<int> insertMoodData(Mood data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MoodSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      id = await db.moods.put(data); // insert & update
    });
    _logger.info('Inserted mood data with id: $id');
    return id;
  }
  
  Future<void> updateMoodData(Mood data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MoodSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.moods.put(data); // insert & update
    });
    _logger.info('Updated mood data with id: ${data.id}');
  }

  Future<List<Mood>> getMoodData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MoodSchema], directory: directory.path);
    _logger.info('Querying all mood data');
    final moodDataList = await db.moods.where().findAll();

    return moodDataList;
  }

  Future<bool> deleteMoodData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([MoodSchema], directory: directory.path);
    _logger.info('Deleting mood data with id: $id');
    final success = await db.moods.delete(id);
    return success;
  }

  Future<void> insertJournalData(Journal data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([JournalSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      id = await db.journals.put(data); // insert & update
    });
    _logger.info('Inserted journal data with id: $id');
    return id;
  }

  Future<void> updateJournalData(Journal data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([JournalSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.journals.put(data); // insert & update
    });
    _logger.info('Updated journal data with id: ${data.id}');
  }

  Future<List<Journal>> getJournalData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([JournalSchema], directory: directory.path);
    _logger.info('Querying all journal data');
    final journalDataList = await db.journals.where().findAll();

    return journalDataList;
  }

  Future<bool> deleteJournalData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([JournalSchema], directory: directory.path);
    _logger.info('Deleting journal data with id: $id');
    final success = await db.journals.delete(id);
    return success;
  }

  Future<void> insertThoughtData(Thought data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([ThoughtSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      id = await db.thoughts.put(data); // insert & update
    });
    _logger.info('Inserted thought data with id: $id');
    return id;
  }

  Future<void> updateThoughtData(Thought data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([ThoughtSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.thoughts.put(data); // insert & update
    });
    _logger.info('Updated thought data with id: ${data.id}');
  }

  Future<List<Thought>> getThoughtData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([ThoughtSchema], directory: directory.path);
    _logger.info('Querying all thought data');
    final thoughtDataList = await db.thoughts.where().findAll();

    return thoughtDataList;
  }

  Future<bool> deleteThoughtData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([ThoughtSchema], directory: directory.path);
    _logger.info('Deleting thought data with id: $id');
    final success = await db.thoughts.delete(id);
    return success;
  }

  Future<void> insertSleepData(Sleep data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    var id;
    db.writeTxn(() async {
      id = await db.sleeps.put(data); // insert & update
    });
    _logger.info('Inserted sleep data with id: $id');
    return id;
  }

  Future<void> updateSleepData(Sleep data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    db.writeTxn(() async {
      await db.sleeps.put(data); // insert & update
    });
    _logger.info('Updated sleep data with id: ${data.id}');
  }

  Future<List<Sleep>> getSleepData() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    _logger.info('Querying all sleep data');
    final sleepDataList = await db.sleeps.where().findAll();

    return sleepDataList;
  }

  Future<bool> deleteSleepData(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    _logger.info('Deleting sleep data with id: $id');
    final success = await db.sleeps.delete(id);
    return success;
  }

  Future<Sleep?> getStillAsleepEntry() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    final result = await db.sleeps.where().filter().sTILL_ASLEEPEqualTo(true).findFirst();
    return result;
  }

  Future<int> getMaxSleepLogId() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([SleepSchema], directory: directory.path);

      _logger.info('Querying max sleep log id');
      final maxId = await db.sleeps.where().idProperty().max() as int?;

      _logger.info('Got max id: $maxId');
      return maxId ?? 0;  // Return 0 if maxId is null
    } catch (e) {
      _logger.severe('Error querying max sleep log id: $e');
      return 0;  // Return 0 in case of error
    }
  }
  Future<int> getMaxThoughtLogId() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([ThoughtSchema], directory: directory.path);

      _logger.info('Querying max sleep log id');
      final maxId = await db.thoughts.where().idProperty().max() as int?;

      _logger.info('Got max id: $maxId');
      return maxId ?? 0;  // Return 0 if maxId is null
    } catch (e) {
      _logger.severe('Error querying max sleep log id: $e');
      return 0;  // Return 0 in case of error
    }

  }

  Future<Thought?> getStillThinkingEntry() async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([SleepSchema], directory: directory.path);
    final result = await db.thoughts.where().filter().sTILL_THINKINGEqualTo(true).findFirst();
    return result;
  }

  Future<int> insertIngredient(Ingredient data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([IngredientSchema], directory: directory.path);
    var id;
    try {
      db.writeTxn(() async {
        id = await db.ingredients.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
      return id;
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
      return 0;
    }  
  }

  Future<void> updateIngredient(Ingredient data) async {
    final directory = await getApplicationDocumentsDirectory();
    db = await Isar.open([IngredientSchema], directory: directory.path);
    var id;
    try {
      db.writeTxn(() async {
        await db.ingredients.put(data); // insert & update
      });
      _logger.info('Inserted sleep data with id: $id');
    } catch (e) {
      _logger.severe('Error inserting ingredient with data: $data \nerror: $e');
    }  
  }

  Future<bool> deleteIngredient(int id) async {
    try{
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
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
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
      ingredient.last_used = DateTime.now();
      updateIngredient(ingredient);
      return true;
    } catch (e) {
      _logger.severe('Error using ingredient with id: ${ingredient.id} \nerror: $e');
      return false;
    }
  }

  Future<List<Ingredient>> getIngredients() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
      final result = await db.ingredients.where().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredients\nerror: $e');
      return [];
    }  
  }

  Future<List<Ingredient>> getIngredientsByRecency() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
      final result = await db.ingredients.where().sortByTimestampDesc().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredients by recency\nerror: $e');
      return [];
    }  
  }

  Future<List<Ingredient>> getIngredientsCategoryByRecency(String category) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
      final result = await db.ingredients.where().filter().categoryEqualTo(category).sortByTimestampDesc().findAll();    
      return result;
    } catch (e) {
      _logger.severe('Error getting ingredient category by recency\nerror: $e');
      return [];
    } 
  }

  Future<List<Ingredient>> getIngredientsByNamePrefix(String prefix) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      db = await Isar.open([IngredientSchema], directory: directory.path);
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


}
 