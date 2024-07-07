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
  String _selectedUnit = '';
  String _newUnit = '';
  List<String> _pillNames = [];
  List<String> _pillUnits = ['mg', 'count'];

  @override
  void initState() {
    super.initState();
    _fetchPillNames();
    _fetchPillUnits();
  }

  Future<void> _fetchPillNames() async {
    List<String> names = await DatabaseHelper().getPillNames();
    setState(() {
      _pillNames = names;
    });
  }

  Future<void> _fetchPillUnits() async {
    List<String> units = await DatabaseHelper().getPillUnits();
    setState(() {
      _pillUnits.addAll(units);
      _pillUnits = _pillUnits.toSet().toList(); // Remove duplicates
    });
  }

  Future<void> _fetchPillDetails(String pillName) async {
    Map<String, String?> details = await DatabaseHelper().getPillDetails(pillName);
    setState(() {
      _dosage = details['dosage'] ?? '';
      _selectedUnit = details['unit'] ?? '';
    });
  }

  Future<void> _savePillData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String pillName = _selectedPillName == 'New Pill' ? _newPillName : _selectedPillName;
      String unit = _selectedUnit == 'New Unit' ? _newUnit : _selectedUnit;
      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      Map<String, dynamic> pillData = {
        'timestamp': timestamp,
        'pill_name': pillName,
        'dosage': _dosage,
        'unit': unit,
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
        child: SingleChildScrollView(
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
                    if (_selectedPillName != 'New Pill') {
                      _fetchPillDetails(_selectedPillName);
                    } else {
                      _dosage = '';
                      _selectedUnit = '';
                    }
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
                initialValue: _dosage,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the dosage';
                  }
                  return null;
                },
                onChanged: (value) {
                  _dosage = value;
                },
                onSaved: (value) {
                  _dosage = value!;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedUnit.isNotEmpty ? _selectedUnit : null,
                decoration: InputDecoration(labelText: 'Unit'),
                items: _pillUnits.map((unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList()
                ..add(
                  DropdownMenuItem<String>(
                    value: 'New Unit',
                    child: Text('Add New Unit'),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedUnit = value!;
                  });
                },
                validator: (value) {
                  if ((value == null || value.isEmpty) && _newUnit.isEmpty) {
                    return 'Please select or enter a unit';
                  }
                  return null;
                },
              ),
              if (_selectedUnit == 'New Unit')
                TextFormField(
                  decoration: InputDecoration(labelText: 'New Unit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new unit';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newUnit = value!;
                  },
                ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _savePillData,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
