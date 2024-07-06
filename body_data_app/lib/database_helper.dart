import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'body_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE poop_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            bristol_rating INTEGER,
            urgency INTEGER,
            blood BOOLEAN
          )
        ''');
        await db.execute('''
          CREATE TABLE pill_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            pill_name TEXT,
            dosage TEXT,
            unit TEXT
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

  Future<List<Map<String, dynamic>>> getPoopData() async {
    final db = await database;
    return await db.query('poop_data');
  }

  Future<List<Map<String, dynamic>>> getPillData() async {
    final db = await database;
    return await db.query('pill_data');
  }
}
