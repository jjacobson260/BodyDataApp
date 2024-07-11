import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'thought_entry_dialog.dart';

class ThoughtDataPage extends StatefulWidget {
  @override
  _ThoughtDataPageState createState() => _ThoughtDataPageState();
}

class _ThoughtDataPageState extends State<ThoughtDataPage> {
  List<Map<String, dynamic>> _thoughtLogs = [];

  @override
  void initState() {
    super.initState();
    _fetchThoughtLogs();
  }

  Future<void> _fetchThoughtLogs() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> logs = await db.query('thought_data');
    setState(() {
      _thoughtLogs = logs;
    });
  }

  void _editThoughtLog(Map<String, dynamic> thoughtLog) async {
    final thoughtLogId = thoughtLog['id'];
    final length = DateTime.parse(thoughtLog['length']);
    await showDialog(
      context: context,
      builder: (context) {
        return ThoughtEntryDialog(thoughtLogId: thoughtLogId);
      },
    );
    _fetchThoughtLogs();
  }

  void _deleteThoughtLog(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete('thought_data', where: 'id = ?', whereArgs: [id]);
    _fetchThoughtLogs();
  }

  String _calculateThoughtMinutes(String timestamp) {
    DateTime startDateTime = DateTime.parse(timestamp);
    final duration = startDateTime.difference(DateTime.now());
    int thoughtMinutes = duration.inMinutes;
    return thoughtMinutes.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thought Data'),
      ),
      body: ListView.builder(
        itemCount: _thoughtLogs.length,
        itemBuilder: (context, index) {
          final log = _thoughtLogs[index];
          final timestamp = log['timestamp'];
          final length = log['length'];
          final thoughtMinutes = length.isNotEmpty ? _calculateThoughtMinutes(log['timestamp']) : '';
          final depth = log['depth'];
          final thoughtLog = log['thought_data'] ?? '';

          return Card(
            child: ListTile(
              title: Text('$timestamp'),
              subtitle: Text('Dream Log: $thoughtLog'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editThoughtLog(thoughtLog),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteThoughtLog(thoughtLog['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
