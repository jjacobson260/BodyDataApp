import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'medicine_entry_dialog.dart';


class MedicineDataPage extends StatefulWidget {
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
    List<Map<String, dynamic>> data = await DatabaseHelper().getMedicineData();
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
        title: Text('Medicine Data'),
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(records[index]['medicine_name']),
            subtitle: Text(
                'Dosage: ${records[index]['dosage']} ${records[index]['unit']} at ${records[index]['timestamp']}'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Edit') {
                  _editRecord(records[index]);
                } else if (value == 'Delete') {
                  _deleteRecord(records[index]['id']);
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
