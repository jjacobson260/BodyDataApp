import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class PillDataPage extends StatefulWidget {
  @override
  _PillDataPageState createState() => _PillDataPageState();
}

class _PillDataPageState extends State<PillDataPage> {
  final _formKey = GlobalKey<FormState>();
  String _pillName = '';
  String _dosage = '';
  String _unit = '';
  List<Map<String, dynamic>> _pillData = [];

  @override
  void initState() {
    super.initState();
    _fetchPillData();
  }

  Future<void> _fetchPillData() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getPillData();
    setState(() {
      _pillData = data;
    });
  }

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

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Pill data saved'),
      ));

      _fetchPillData(); // Refresh the data after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pill Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _savePillData,
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _pillData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_pillData[index]['pill_name']),
                    subtitle: Text(
                        'Dosage: ${_pillData[index]['dosage']} ${_pillData[index]['unit']} at ${_pillData[index]['timestamp']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
