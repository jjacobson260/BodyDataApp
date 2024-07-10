import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';


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
          CREATE TABLE IF NOT EXISTS sleep_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            sleep_time TEXT,
            wake_time TEXT,
            dream_log TEXT,
            STILL_ASLEEP INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS mind_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            length INTEGER,
            depth INTEGER,
            thought_log TEXT
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
    return await db.update(
      'poop_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletePoopData(int id) async {
    final db = await database;
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

    if (result.isNotEmpty && result.first['count'] != null) {
      return result.first['count'] as int;
    } else {
      return 0;
    }
  }

  Future<int> insertPillData(Map<String, dynamic> data) async {
    final db = await database;
    int id = await db.insert('pill_data', data);
    _logger.info('Inserted pill data with id: $id');
    return id;
  }

  Future<int> updatePillData(int id, Map<String, dynamic> newData) async {
    final db = await database;
    return await db.update(
      'pill_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletePillData(int id) async {
    final db = await database;
    return await db.delete(
      'pill_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, String?>> getPillDetails(String pillName) async {
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

  Future<List<String>> getPillUnits() async {
    final db = await database;
    _logger.info('Querying distinct pill units');

    var result = await db.rawQuery('SELECT DISTINCT unit FROM pill_data');
    List<String> pillUnits = result.map((e) => e['unit'] as String).toList();

    _logger.info('Found ${pillUnits.length} distinct pill units');

    return pillUnits;
  }

  

  Future<List<Map<String, dynamic>>> getPillData() async {
    final db = await database;
    _logger.info('Querying all pill data');
    return await db.query('pill_data');
  }

  Future<List<String>> getPillNames() async {
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
    return await db.query('food_data', orderBy: 'timestamp ASC');
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
    return await db.query('mood_data', orderBy: 'timestamp ASC');
  }

  Future<void> insertJournalData(Map<String, dynamic> journalData) async {
    final db = await database;
    await db.insert('journal_data', journalData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted journal data');
  }

  Future<List<Map<String, dynamic>>> getJournalData() async {
    final db = await database;
    _logger.info('Querying all journal data');
    return await db.query('journal_data', orderBy: 'timestamp ASC');
  }

  Future<void> insertSleepData({required String timestamp, required String sleepTime, String? wakeTime, String? dreamLog, bool wakingUp = false,}) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS sleep_log (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT,
        sleep_time TEXT,
        wake_time TEXT,
        dream_log TEXT,
        STILL_ASLEEP INTEGER
      )
    ''');
    await db.insert(
      'sleep_log',
      {
        'timestamp': timestamp,
        'sleep_time': sleepTime,
        'wake_time': wakeTime,
        'dream_log': dreamLog,
        'STILL_ASLEEP': wakingUp ? 0 : 1,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateSleepLog(int id, DateTime adjustedSleepTime, DateTime wakeTime, String dreamLog) async {
    final db = await database;
    await db.update(
      'sleep_log',
      {
        'wake_time': DateFormat('yyyy-MM-dd HH:mm:ss').format(wakeTime),
        'sleep_time': DateFormat('yyyy-MM-dd HH:mm:ss').format(adjustedSleepTime),
        'dream_log': dreamLog,
        'STILL_ASLEEP': 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteSleepData(int id) async {
    final db = await database;
    return await db.delete(
      'sleep_log',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> getMaxSleepLogId() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT MAX(id) as max_id FROM sleep_log');
    return result.first['max_id'] as int;

  }

  Future<void> insertMindData(Map<String, dynamic> mindData) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS sleep_log (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT,
        length INTEGER,
        depth INTEGER,
        thought_log TEXT,
      )
    ''');
    await db.insert('mind_data', mindData, conflictAlgorithm: ConflictAlgorithm.replace);
    _logger.info('Inserted mood data');
  }

  Future<int> updateMindLog(int id, Map<String, dynamic> newData) async {
    final db = await database;
    return await db.update(
      'mind_data',
      newData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getMindData() async {
    final db = await database;
    _logger.info('Querying all mind data');
    return await db.query('mind_data', orderBy: 'timestamp ASC');
  }
}
