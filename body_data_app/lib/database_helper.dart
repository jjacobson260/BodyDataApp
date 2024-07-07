import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'body_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
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
          CREATE TABLE IF NOT EXISTS journal_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            entry TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPoopData(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('poop_data', data);
  }

  Future<int> insertPillData(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('pill_data', data);
  }

  Future<Map<String, String?>> getPillDetails(String pillName) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'pill_data',
      columns: ['dosage', 'unit'],
      where: 'pill_name = ?',
      whereArgs: [pillName],
      orderBy: 'timestamp DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return {
        'dosage': result.first['dosage'] as String?,
        'unit': result.first['unit'] as String?,
      };
    }

    return {'dosage': null, 'unit': null};
  }

  Future<List<String>> getPillUnits() async {
    final db = await database;
    var result = await db.rawQuery('SELECT DISTINCT unit FROM pill_data');
    List<String> pillUnits = result.map((e) => e['unit'] as String).toList();
    return pillUnits;
  }

  Future<List<Map<String, dynamic>>> getPoopData() async {
    final db = await database;
    return await db.query('poop_data');
  }

  Future<List<Map<String, dynamic>>> getPillData() async {
    final db = await database;
    return await db.query('pill_data');
  }

  Future<List<String>> getPillNames() async {
    final db = await database;
    var result = await db.rawQuery('SELECT DISTINCT pill_name FROM pill_data');
    List<String> pillNames = result.map((e) => e['pill_name'] as String).toList();
    return pillNames;
  }

  Future<void> insertFoodData(Map<String, dynamic> foodData) async {
    final db = await database;
    await db.insert('food_data', foodData, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getFoodData() async {
    final db = await database;
    return await db.query('food_data', orderBy: 'timestamp DESC');
  }

  Future<void> insertJournalData(Map<String, dynamic> journalData) async {
    final db = await database;
    await db.insert('journal_data', journalData, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getJournalData() async {
    final db = await database;
    return await db.query('journal_data', orderBy: 'timestamp DESC');
  }
}
