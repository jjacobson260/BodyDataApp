import 'package:flutter/material.dart';
import 'database_helper.dart';

class JournalDataPage extends StatefulWidget {
  @override
  _JournalDataPageState createState() => _JournalDataPageState();
}

class _JournalDataPageState extends State<JournalDataPage> {
  List<Map<String, dynamic>> _journalData = [];

  @override
  void initState() {
    super.initState();
    _fetchJournalData();
  }

  Future<void> _fetchJournalData() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getJournalData();
    setState(() {
      _journalData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal'),
      ),
      body: ListView.builder(
        itemCount: _journalData.length,
        itemBuilder: (context, index) {
          final item = _journalData[index];
          return Card(
            child: ListTile(
              title: Text(item['timestamp']),
              subtitle: Text(item['entry']),
            ),
          );
        },
      ),
    );
  }
}
