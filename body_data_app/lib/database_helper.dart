import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'ingredient.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // Create a logger instance for the DatabaseHelper class
  final Logger _logger = Logger('DatabaseHelper');

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'body_data.db');

    _logger.info('Opening database at path: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        _logger.info('Creating database tables');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS poop_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            bristol_rating INTEGER,
            urgency INTEGER,
            blood BOOLEAN
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS pill_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            pill_name TEXT,
            dosage TEXT,
            unit TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS food_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            description TEXT,
            image_path TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS mood_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            rating INTEGER,
            moods TEXT,
            note TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS journal_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            entry TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS export_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            export_type TEXT,
            last_export TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS sleep_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            sleep_time TEXT,
            wake_time TEXT,
            dream_log TEXT,
            STILL_ASLEEP INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS thought_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            start_time TEXT,
            end_time TEXT,
            length INTEGER,
            depth INTEGER,
            thought_log TEXT,
            STILL_THINKING INT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS ingredients (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            created_at TEXT,
            last_used TEXT,
            name TEXT,
            category TEXT,
            icon TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPoopData(Map<String, dynamic> data) async {
    final db = await database;
    int id = await db.insert('poop_data', data);
    _logger.info('Inserted poop data with id: $id');
    return id;
  }

  Future<int> updatePoopData(int id, Map<String, dynamic> newData) async {
    final db = await database;
    _logger.info('Updating poop data with id: $id with newData: $newData');
    return await db.update(
      'poop_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletePoopData(int id) async {
    final db = await database;
    _logger.info('Deleting poop data with id: $id');
    return await db.delete(
      'poop_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getPoopData() async {
    final db = await database;
    _logger.info('Querying all poop data');
    return await db.query('poop_data');
  }

  Future<double> getAverageBristolRatingForDays(int days) async {
    final db = await database;
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));
    final pastDateStr = pastDate.toIso8601String();

    final result = await db.rawQuery(
      'SELECT AVG(bristol_rating) as avg_rating FROM poop_data WHERE timestamp >= ?',
      [pastDateStr],
    );
    _logger.info('Got average bristol rating of: $result');
    if (result.isNotEmpty && result.first['avg_rating'] != null) {
      return result.first['avg_rating'] as double;
    } else {
      return 0.0;
    }
  }

  Future<double> getAverageUrgencyForDays(int days) async {
    final db = await database;
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));
    final pastDateStr = pastDate.toIso8601String();

    final result = await db.rawQuery(
      'SELECT AVG(urgency) as avg_urgency FROM poop_data WHERE timestamp >= ?',
      [pastDateStr],
    );
    _logger.info('Got average urgency of: $result');
    if (result.isNotEmpty && result.first['avg_urgency'] != null) {
      return result.first['avg_urgency'] as double;
    } else {
      return 0.0;
    }
  }

  Future<int> getBMCountForDays(int days) async {
    final db = await database;
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));
    final pastDateStr = pastDate.toIso8601String();

    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM poop_data WHERE timestamp >= ?',
      [pastDateStr],
    );
    _logger.info('Got BM count of: $result');
    if (result.isNotEmpty && result.first['count'] != null) {
      return result.first['count'] as int;
    } else {
      return 0;
    }
  }

  Future<int> insertMedicineData(Map<String, dynamic> data) async {
    final db = await database;
    int id = await db.insert('pill_data', data);
    _logger.info('Inserted pill data with id: $id');
    return id;
  }

  Future<int> updateMedicineData(int id, Map<String, dynamic> newData) async {
    final db = await database;
    _logger.info('Updating pill data with id: $id with newData: $newData');
    return await db.update(
      'pill_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteMedicineData(int id) async {
    final db = await database;
    _logger.info('Deleting pill data with id: $id');
    return await db.delete(
      'pill_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, String?>> getMedicineDetails(String pillName) async {
    final db = await database;
    _logger.info('Querying pill details for: $pillName');
    
    List<Map<String, dynamic>> result = await db.query(
      'pill_data',
      columns: ['dosage', 'unit'],
      where: 'pill_name = ?',
      whereArgs: [pillName],
      orderBy: 'timestamp ASC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      _logger.info('Found pill details for: $pillName');
      return {
        'dosage': result.first['dosage'] as String?,
        'unit': result.first['unit'] as String?,
      };
    } else {
      _logger.info('No pill details found for: $pillName');
    }

    return {'dosage': null, 'unit': null};
  }

  Future<List<String>> getMedicineUnits() async {
    final db = await database;
    _logger.info('Querying distinct pill units');

    var result = await db.rawQuery('SELECT DISTINCT unit FROM pill_data');
    List<String> pillUnits = result.map((e) => e['unit'] as String).toList();

    _logger.info('Found ${pillUnits.length} distinct pill units');

    return pillUnits;
  }

  

  Future<List<Map<String, dynamic>>> getMedicineData() async {
    final db = await database;
    _logger.info('Querying all pill data');
    return await db.query('pill_data', orderBy: 'timestamp DESC');
  }

  Future<List<String>> getMedicineNames() async {
    final db = await database;
    _logger.info('Querying distinct pill names');

    var result = await db.rawQuery('SELECT DISTINCT pill_name FROM pill_data');
    List<String> pillNames = result.map((e) => e['pill_name'] as String).toList();

    _logger.info('Found ${pillNames.length} distinct pill names');

    return pillNames;
  }

  Future<void> insertFoodData(Map<String, dynamic> foodData) async {
    final db = await database;
    await db.insert('food_data', foodData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted food data');
  }

  Future<List<Map<String, dynamic>>> getFoodData() async {
    final db = await database;
    _logger.info('Querying all food data');
    return await db.query('food_data', orderBy: 'timestamp DESC');
  }

  Future<void> insertMoodData(Map<String, dynamic> moodData) async {
    final db = await database;
    _logger.info('Initializing database');
    await _initDatabase();
    await db.execute('''
          CREATE TABLE IF NOT EXISTS mood_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            rating INTEGER,
            moods TEXT,
            note TEXT
          )
        ''');
    await db.insert('mood_data', moodData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted mood data');
  }

  Future<List<Map<String, dynamic>>> getMoodData() async {
    final db = await database;
    _logger.info('Querying all mood data');
    return await db.query('mood_data', orderBy: 'timestamp DESC');
  }

  Future<void> insertJournalData(Map<String, dynamic> journalData) async {
    final db = await database;
    await db.insert('journal_data', journalData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted journal data');
  }

  Future<List<Map<String, dynamic>>> getJournalData() async {
    final db = await database;
    _logger.info('Querying all journal data');
    return await db.query('journal_data', orderBy: 'timestamp DESC');
  }

  Future<void> insertSleepData(Map<String, dynamic> sleepData) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS sleep_data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT,
        sleep_time TEXT,
        wake_time TEXT,
        dream_log TEXT,
        STILL_ASLEEP INTEGER
      )
    ''');
    await db.insert('sleep_data', sleepData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted sleep data');
  }

  Future<void> updateSleepData(int id, Map<String, dynamic> newData) async {
    final db = await database;
    await db.update(
      'sleep_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
    _logger.info('Updated sleep data with id: $id with newData: $newData');
  }

  Future<int> deleteSleepData(int id) async {
    final db = await database;
    _logger.info('Deleted sleep data with id: $id');
    return await db.delete(
      'sleep_data',
      where: 'id = ?',
      whereArgs: [id],
    );
    
  }

  Future<Map<String, dynamic>?> getStillAsleepEntry() async {
    final db = await database;
    final result = await db.query(
      'sleep_data',
      where: 'STILL_ASLEEP = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> getMaxSleepLogId() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT MAX(id) as max_id FROM sleep_data');
    final max_id = result.first['max_id'] as int;
    _logger.info('Got max id: $max_id');
    return max_id;

  }

  Future<void> insertThoughtData(Map<String, dynamic> thoughtData) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS sleep_data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT,
        length INTEGER,
        depth INTEGER,
        thought_log TEXT,
        STILL_THINKING INT
      )
    ''');
    await db.insert('thought_data', thoughtData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted thought data');
  }

  Future<int> updateThoughtData(int id, Map<String, dynamic> newData) async {
    final db = await database;
    _logger.info('Updated thought data with id: $id with newData: $newData');
    return await db.update(
      'thought_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getThoughtData() async {
    final db = await database;
    _logger.info('Querying all thought data');
    return await db.query('thought_data', orderBy: 'timestamp ASC');
  }

  Future<int> deleteThoughtData(int id) async {
    final db = await database;
    _logger.info('Deleted thought data with id: $id');
    return await db.delete(
      'thought_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> getMaxThoughtLogId() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT MAX(id) as max_id FROM thought_data');
    final max_id = result.first['max_id'] as int;
    _logger.info('Got max id: $max_id');
    return max_id;

  }

  Future<Map<String, dynamic>?> getStillThinkingEntry() async {
    final db = await database;
    final result = await db.query(
      'thought_data',
      where: 'STILL_THINKING = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<void> insertIngredient(Ingredient ingredient) async {
    final db = await database;
    final ingredientData = {
      'created_at': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      'last_used': null,
      'name': ingredient.name,
      'category': ingredient.category,
      'icon': ingredient.icon
    };
    await db.insert(
      'ingredients',
      ingredientData,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<void> updateIngredient(Map<String, dynamic> ingredient) async {
    final db = await database;
    await db.update(
      'ingredients',
      ingredient,
      where: 'id = ?',
      whereArgs: [ingredient['id']],
    );
  }

  Future<void> deleteIngredient(int id) async {
    final db = await database;
    await db.delete(
      'ingredients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> useIngredient(Ingredient ingredient) async {
    final db = await database;
    final updateData = {'last_used': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())};
    await db.update(
      'ingredients',
      updateData,
      where: 'name = ?',
      whereArgs: [ingredient.name],
    );
  }

  Future<List<Ingredient>> getAllIngredients() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('ingredients');

    return List.generate(maps.length, (i) {
      return Ingredient(
        name: maps[i]['name'],
        category: maps[i]['category'],
        icon: maps[i]['icon'],
      );
    });
  }

  Future<List<Ingredient>> getIngredientsByRecency() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'ingredients',
      orderBy: 'last_used DESC, name ASC',
    );

    return List.generate(maps.length, (i) {
      return Ingredient(
        name: maps[i]['name'],
        category: maps[i]['category'],
        icon: maps[i]['icon'],
      );
    });
  }

  Future<List<Ingredient>> getIngredientsCategoryByRecency(String category) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM ingredients
      WHERE category = ?
      ORDER BY last_used DESC, name ASC
    ''', [category]);

    return List.generate(maps.length, (i) {
      return Ingredient(
        name: maps[i]['name'],
        category: maps[i]['category'],
        icon: maps[i]['icon'],
      );
    });
  }

  Future<List<Ingredient>> getIngredientsByNamePrefix(Database db, String prefix) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'ingredients',
      where: 'name LIKE ?',
      whereArgs: ['%$prefix%'],
      orderBy: 'name ASC',
    );
  
    return List.generate(maps.length, (i) {
      return Ingredient(
        name: maps[i]['name'],
        category: maps[i]['category'],
        icon: maps[i]['icon'],
      );
    });

  }


}
