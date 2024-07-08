import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'package:csv/csv.dart';
import 'dart:io';

class ExportHelper {
  static Future<String> exportData({required String table, required bool isFullExport}) async {
    final db = await DatabaseHelper().database;

    // Determine export type
    String query;
    String exportType;
    if (isFullExport) {
      query = 'SELECT * FROM poop_data'; // Replace with your table name
      exportType = 'full';
    } else {
      query = '''
        SELECT * FROM poop_data 
        WHERE timestamp > (
          SELECT COALESCE(MAX(last_export), '1970-01-01T00:00:00.000') 
          FROM export_log 
          WHERE export_type = "incremental"
        )
      ''';
      exportType = 'incremental';
    }

    // Fetch data
    List<Map<String, dynamic>> data = await db.rawQuery(query);

    // Convert data to CSV
    List<List<dynamic>> csvData = [
      data.first.keys.toList(), // headers
      ...data.map((row) => row.values.toList())
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    // Get directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/poop_data_$exportType\_${DateTime.now().millisecondsSinceEpoch}.csv';

    // Write to file
    final file = File(filePath);
    await file.writeAsString(csv);

    // Update export log
    if (!isFullExport) {
      await db.insert('export_log', {
        'export_type': 'incremental',
        'last_export': DateTime.now().toIso8601String(),
      });
    }

    return filePath;
  }
}
