import 'dart:math';

import 'package:body_data_app/models/export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'package:isar/isar.dart';
import 'package:csv/csv.dart';
import 'dart:io';

class ExportHelper {
  static Future<String> exportData({required String table, required bool isFullExport}) async {
    DatabaseHelper db = DatabaseHelper();

    // Determine export type
    String query;
    String exportType;
    var data;
    if (isFullExport) {
      data = db.getAllFromTable(table);
      exportType = "full";
    } else {
      var last_export = await db.getLastIncrementalExportByTable(table);
      data = db.getAllFromTableSinceDate(table, last_export);
      exportType = "incremental";
    }

    // Fetch data
    // Convert data to Map and then CSV
    List<Map<String, dynamic>> mapData = data.map((object) {
      
    }).toList();

    List<List<dynamic>> csvData = [
      mapData.first.keys.toList(), // headers
      ...mapData.map((row) => row.values.toList())
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    // Get directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/poop_data_$exportType\_${DateTime.now().millisecondsSinceEpoch}.csv';

    // Write to file
    final file = File(filePath);
    await file.writeAsString(csv);

    // Update export log
    Export export = Export();
    export.table = table;
    export.type = exportType;
    export.timestamp = DateTime.now();
    db.insertExport(export);

    return filePath;
  }
}
