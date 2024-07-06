import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class PillEntryDialog extends StatefulWidget {
  @override
  _PillEntryDialogState createState() => _PillEntryDialogState();
}

class _PillEntryDialogState extends State<PillEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _pillName = '';
  String _dosage = '';
  String _unit = '';

  Future<void> _savePillData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      Map<String, dynamic> pillData = {
        'timestamp': timestamp,
        'pill_name': _pillName,
        'dosage': _dosage,
        'unit': _unit,
      };

      await DatabaseHelper().insertPillData(pillData);

      Navigator.of(context).pop(); // Close the dialog

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Pill data saved'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Pill Data'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Pill Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a pill name';
                }
                return null;
              },
              onSaved: (value) {
                _pillName = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dosage'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the dosage';
                }
                return null;
              },
              onSaved: (value) {
                _dosage = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Unit'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the unit';
                }
                return null;
              },
              onSaved: (value) {
                _unit = value!;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _savePillData,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
