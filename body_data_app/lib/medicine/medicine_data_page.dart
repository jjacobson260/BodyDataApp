import 'package:flutter/material.dart';
import '../database_helper.dart';
import 'medicine_entry_dialog.dart';

class MedicineDataPage extends StatefulWidget {
  const MedicineDataPage({super.key});

  @override
  MedicineDataPageState createState() => MedicineDataPageState();
}

class MedicineDataPageState extends State<MedicineDataPage> {
  List<Map<String, dynamic>> records = [];

  @override
  void initState() {
    super.initState();
    _retrieveRecords();
  }

  Future<void> _retrieveRecords() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getMedicineDataAsMap();
    setState(() {
      records = data;
    });
  }

  Future<void> _editRecord(Map<String, dynamic> record) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MedicineEntryDialog(
          isEditMode: true,
          initialData: record,
        );
      },
    );
    _retrieveRecords();
  }

  Future<void> _deleteRecord(int id) async {
    await DatabaseHelper().deleteMedicineData(id);
    _retrieveRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Data'),
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          final medicineName = record['medicine_name'] ?? 'Unknown';
          final dosage = record['dosage']?.toString() ?? 'Unknown';
          final unit = record['unit'] ?? 'Unknown';
          final timestamp = record['timestamp'] ?? 'Unknown';
          final id = record['id'] ?? 0;

          return ListTile(
            title: Text(medicineName),
            subtitle: Text('Dosage: $dosage $unit at $timestamp'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Edit') {
                  _editRecord(record);
                } else if (value == 'Delete') {
                  _deleteRecord(id);
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
    );
  }
}
