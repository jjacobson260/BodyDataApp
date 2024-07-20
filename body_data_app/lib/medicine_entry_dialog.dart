import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'date_time_picker_dialog.dart'; 

class MedicineEntryDialog extends StatefulWidget {
  final bool isEditMode;
  final Map<String, dynamic>? initialData;

  MedicineEntryDialog({this.isEditMode=false, this.initialData});

  @override
  _MedicineEntryDialogState createState() => _MedicineEntryDialogState();
}

class _MedicineEntryDialogState extends State<MedicineEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedMedicineName = '';
  String _newMedicineName = '';
  late String _dosage = '';
  late String _selectedUnit = '';
  String _newUnit = '';
  List<String> _medicineNames = [];
  List<String> _medicineUnits = ['mg', 'count'];
  late DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.isEditMode && widget.initialData != null) {
      _selectedMedicineName = widget.initialData!['medicine_name'];
      _dosage = widget.initialData!['dosage'];
      _selectedUnit = widget.initialData!['unit'];
      _selectedDateTime = DateTime.parse(widget.initialData!['timestamp']);
    } 
    _fetchMedicineNames();
    _fetchMedicineUnits();
  }

  Future<void> _fetchMedicineNames() async {
    List<String> names = await DatabaseHelper().getMedicineNames();
    setState(() {
      _medicineNames = names;
    });
  }

  Future<void> _fetchMedicineUnits() async {
    List<String> units = await DatabaseHelper().getMedicineUnits();
    setState(() {
      _medicineUnits.addAll(units);
      _medicineUnits = _medicineUnits.toSet().toList(); // Remove duplicates
    });
  }

  Future<void> _fetchMedicineDetails(String medicineName) async {
    Map<String, String?> details = await DatabaseHelper().getMedicineDetails(medicineName);
    setState(() {
      _dosage = details['dosage'] ?? '';
      _selectedUnit = details['unit'] ?? '';
    });
  }

  Future<void> _saveMedicineData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String medicineName = _selectedMedicineName == 'New Medicine' ? _newMedicineName : _selectedMedicineName;
      String unit = _selectedUnit == 'New Unit' ? _newUnit : _selectedUnit;
      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDateTime);

      Map<String, dynamic> data = {
        'timestamp': timestamp,
        'medicine_name': medicineName,
        'dosage': _dosage,
        'unit': unit,
      };

      if (widget.isEditMode && widget.initialData != null) {
        await DatabaseHelper().updateMedicineData(widget.initialData!['id'], data);
      } else {
        await DatabaseHelper().insertMedicineData(data);
      }

      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Medicine data saved'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Enter Medicine Data'),
          DateTimePickerDialog(
            initialDateTime: _selectedDateTime,
            onDateTimeSelected: (dateTime) {
              setState(() {
                _selectedDateTime = dateTime;
              });
            },
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedMedicineName.isNotEmpty ? _selectedMedicineName : null,
                decoration: InputDecoration(labelText: 'Medicine Name'),
                items: _medicineNames.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList()
                  ..add(
                    DropdownMenuItem<String>(
                      value: 'New Medicine',
                      child: Text('Add New Medicine'),
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    _selectedMedicineName = value!;
                    if (_selectedMedicineName != 'New Medicine') {
                      _fetchMedicineDetails(_selectedMedicineName);
                    } else {
                      _dosage = '';
                      _selectedUnit = '';
                    }
                  });
                },
                validator: (value) {
                  if ((value == null || value.isEmpty) && _newMedicineName.isEmpty) {
                    return 'Please select or enter a medicine name';
                  }
                  return null;
                },
              ),
              if (_selectedMedicineName == 'New Medicine')
                TextFormField(
                  decoration: InputDecoration(labelText: 'New Medicine Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new medicine name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newMedicineName = value!;
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
                items: _medicineUnits.map((unit) {
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
              Center(
                child: ElevatedButton(
                  onPressed: _saveMedicineData,
                  child: Text('Save'),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
