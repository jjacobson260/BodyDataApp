import 'package:flutter/material.dart';
import 'poop_entry_dialog.dart';
import '../database_helper.dart';
import '../export_helper.dart';
import 'poop_stats_widget.dart';

class PoopDataPage extends StatefulWidget {
  const PoopDataPage({super.key});

  @override
  _PoopDataPageState createState() => _PoopDataPageState();
}

class _PoopDataPageState extends State<PoopDataPage> {
  List<Map<String, dynamic>> _records = [];

  void _retrieveRecords() async {
    final records = await DatabaseHelper().getPoopDataAsMap();
    setState(() {
      _records = records;
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveRecords();
  }

  Future<void> _exportData(BuildContext context, {required bool isFullExport}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    String filePath = await ExportHelper.exportData(table: 'poop_data', isFullExport: isFullExport);

    Navigator.of(context).pop(); // Close the loading dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Export Complete'),
          content: Text('Data exported to: $filePath'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _editRecord(Map<String, dynamic> record) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return PoopEntryDialog(
          isEditMode: true,
          initialData: record,
        );
      },
    );
    _retrieveRecords();
  }

  Future<void> _deleteRecord(int id) async {
    await DatabaseHelper().deletePoopData(id);
    _retrieveRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poop Data'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'Full Export') {
                await _exportData(context, isFullExport: true);
              } else if (value == 'Incremental Export') {
                await _exportData(context, isFullExport: false);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Full Export', 'Incremental Export'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const Center(child: PoopStatsWidget()),
          Expanded(
            child:_records.isEmpty
            ? const Center(child: Text('No records found'))
            : ListView.builder(
              itemCount: _records.length,
              itemBuilder: (context, index) {
                final record = _records[index];
                return ListTile(
                  title: Text('Timestamp: ${record['timestamp']}'),
                  subtitle: Text(
                      'Bristol Rating: ${record['bristol_rating']}\nUrgency: ${record['urgency']}\nBlood: ${record['blood'] == 1 ? "Yes" : "No"}'),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Edit') {
                        _editRecord(record);
                      } else if (value == 'Delete') {
                        _deleteRecord(record['id']);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Edit', 'Delete'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                );
              },
            ),
          )
          
        ]
      ) 
    );
  }
}
