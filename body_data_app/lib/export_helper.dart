
import 'package:body_data_app/models/export.dart';
import 'package:path_provider/path_provider.dart';
import 'database_helper.dart';
import 'package:csv/csv.dart';
import 'dart:io';

class ExportHelper {
  static Future<String> exportData({required String table, required bool isFullExport}) async {
    DatabaseHelper db = DatabaseHelper();

    // Determine export type
    String query;
    String exportType;
    Future<List> data;
    List<Map<String, dynamic>> mapData = [];
    if (isFullExport) {
      data = db.getAllFromTable(table);
      exportType = "full";
      mapData = await db.getAllDataFromTableAsMap(table);
    } else {
      var lastExport = await db.getLastIncrementalExportByTable(table);
      mapData = await db.getAllFromTableSinceDateAsMap(table, lastExport);
      exportType = "incremental";
    }

    List<List<dynamic>> csvData = [
      mapData.first.keys.toList(), // headers
      ...mapData.map((row) => row.values.toList())
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    // Get directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/poop_data_${exportType}_${DateTime.now().millisecondsSinceEpoch}.csv';

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
