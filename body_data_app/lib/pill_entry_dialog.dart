import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class PillEntryDialog extends StatefulWidget {
  @override
  _PillEntryDialogState createState() => _PillEntryDialogState();
}

class _PillEntryDialogState extends State<PillEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPillName = '';
  String _newPillName = '';
  String _dosage = '';
  String _unit = '';
  List<String> _pillNames = [];

  @override
  void initState() {
    super.initState();
    _fetchPillNames();
  }

  Future<void> _fetchPillNames() async {
    List<String> names = await DatabaseHelper().getPillNames();
    setState(() {
      _pillNames = names;
    });
  }

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String pillName = _selectedPillName == 'New Pill' ? _newPillName : _selectedPillName;
      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      Map<String, dynamic> pillData = {
        'timestamp': timestamp,
        'pill_name': pillName,
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
            DropdownButtonFormField<String>(
              value: _selectedPillName.isNotEmpty ? _selectedPillName : null,
              decoration: InputDecoration(labelText: 'Pill Name'),
              items: _pillNames.map((name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList()
              ..add(
                DropdownMenuItem<String>(
                  value: 'New Pill',
                  child: Text('Add New Pill'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedPillName = value!;
                });
              },
              validator: (value) {
                if ((value == null || value.isEmpty) && _newPillName.isEmpty) {
                  return 'Please select or enter a pill name';
                }
                return null;
              },
            ),
            if (_selectedPillName == 'New Pill')
              TextFormField(
                decoration: InputDecoration(labelText: 'New Pill Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new pill name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPillName = value!;
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
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
