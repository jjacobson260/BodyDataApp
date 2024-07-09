import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'pill_entry_dialog.dart';


class PillDataPage extends StatefulWidget {
  @override
  PillDataPageState createState() => PillDataPageState();
}

class PillDataPageState extends State<PillDataPage> {
  List<Map<String, dynamic>> records = [];

  @override
  void initState() {
    super.initState();
    _retrieveRecords();
  }

  Future<void> _retrieveRecords() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getPillData();
    setState(() {
      records = data;
    });
  }

  Future<void> _editRecord(Map<String, dynamic> record) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return PillEntryDialog(
          isEditMode: true,
          initialData: record,
        );
      },
    );
    _retrieveRecords();
  }

  Future<void> _deleteRecord(int id) async {
    await DatabaseHelper().deletePillData(id);
    _retrieveRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pill Data'),
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(records[index]['pill_name']),
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
