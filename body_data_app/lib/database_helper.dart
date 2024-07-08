import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';

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
      },
    );
  }

  Future<int> insertPoopData(Map<String, dynamic> data) async {
    final db = await database;
    int id = await db.insert('poop_data', data);
    _logger.info('Inserted poop data with id: $id');
    return id;
  }

  Future<int> insertPillData(Map<String, dynamic> data) async {
    final db = await database;
    int id = await db.insert('pill_data', data);
    _logger.info('Inserted pill data with id: $id');
    return id;
  }

  Future<Map<String, String?>> getPillDetails(String pillName) async {
    final db = await database;
    _logger.info('Querying pill details for: $pillName');
    
    List<Map<String, dynamic>> result = await db.query(
      'pill_data',
      columns: ['dosage', 'unit'],
      where: 'pill_name = ?',
      whereArgs: [pillName],
      orderBy: 'timestamp DESC',
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

  Future<List<Map<String, dynamic>>> getPoopData() async {
    final db = await database;
    _logger.info('Querying all poop data');
    return await db.query('poop_data');
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
}
