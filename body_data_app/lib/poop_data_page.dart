import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class PoopDataPage extends StatefulWidget {
  @override
  _PoopDataPageState createState() => _PoopDataPageState();
}

class _PoopDataPageState extends State<PoopDataPage> {
  List<Map<String, dynamic>> _records = [];

  void _retrieveRecords() async {
    final records = await DatabaseHelper().getPoopData();
    setState(() {
      _records = records;
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveRecords();
  }

  Future<void> _exportToCsv() async {
    List<List<dynamic>> rows = [];

    // Add header row
    rows.add(['Timestamp', 'Bristol Rating', 'Urgency', 'Blood']);

    // Add data rows
    for (var entry in _records) {
      rows.add([
        entry['timestamp'],
        entry['bristol_rating'],
        entry['urgency'],
        entry['blood'] ? 'Yes' : 'No', // Convert boolean to 'Yes' or 'No'
      ]);
    }

    // Generate a file name with current timestamp
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String csvFileName = 'poop_data_export_$timestamp.csv'; // Example filename format: poop_data_export_20240706_150000.csv

    // Get the device's documents directory to save the file
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String csvFilePath = '${documentsDirectory.path}/$csvFileName';

    // Write the CSV file
    File csvFile = File(csvFilePath);
    String csvString = const ListToCsvConverter().convert(rows);
    await csvFile.writeAsString(csvString);

    // Show a message or notification that export is complete
    print('CSV file exported to: $csvFilePath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poop Data'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              _exportToCsv();
            },
          ),
        ),
      ),
      body: 
        _records.isEmpty
      ? Center(child: Text('No records found'))
      : ListView.builder(
        itemCount: _records.length,
        itemBuilder: (context, index) {
          final record = _records[index];
          return ListTile(
            title: Text('Timestamp: ${record['timestamp']}'),
            subtitle: Text(
                'Bristol Rating: ${record['bristol_rating']}\nUrgency: ${record['urgency']}\nBlood: ${record['blood'] == 1 ? "Yes" : "No"}'),
          );  
        },
      ),
    );
  }
}
