import 'package:flutter/material.dart';
import 'database_helper.dart';

class PillDataPage extends StatefulWidget {
  @override
  _PillDataPageState createState() => _PillDataPageState();
}

class _PillDataPageState extends State<PillDataPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pill Data'),
      ),
      body: ListView.builder(
        itemCount: _pillData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pillData[index]['pill_name']),
            subtitle: Text(
                'Dosage: ${_pillData[index]['dosage']} ${_pillData[index]['unit']} at ${_pillData[index]['timestamp']}'),
          );
        },
      ),
    );
  }
}
