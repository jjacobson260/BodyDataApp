import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'mind_entry_dialog.dart';

class MindDataPage extends StatefulWidget {
  @override
  _MindDataPageState createState() => _MindDataPageState();
}

class _MindDataPageState extends State<MindDataPage> {
  List<Map<String, dynamic>> _mindLogs = [];

  @override
  void initState() {
    super.initState();
    _fetchMindLogs();
  }

  Future<void> _fetchMindLogs() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> logs = await db.query('mind_log');
    setState(() {
      _mindLogs = logs;
    });
  }

  void _editMindLog(Map<String, dynamic> mindLog) async {
    final mindLogId = mindLog['id'];
    final length = DateTime.parse(mindLog['length']);
    await showDialog(
      context: context,
      builder: (context) {
        return MindEntryDialog(mindLogId: mindLogId);
      },
    );
    _fetchMindLogs();
  }

  void _deleteMindLog(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete('mind_log', where: 'id = ?', whereArgs: [id]);
    _fetchMindLogs();
  }

  String _calculateMindMinutes(String timestamp) {
    DateTime startDateTime = DateTime.parse(timestamp);
    final duration = startDateTime.difference(DateTime.now());
    int mindMinutes = duration.inMinutes;
    return mindMinutes.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mind Data'),
      ),
      body: ListView.builder(
        itemCount: _mindLogs.length,
        itemBuilder: (context, index) {
          final log = _mindLogs[index];
          final timestamp = log['timestamp'];
          final length = log['length'];
          final mindMinutes = length.isNotEmpty ? _calculateMindMinutes(log['timestamp']) : '';
          final depth = log['depth'];
          final mindLog = log['mind_log'] ?? '';

          return Card(
            child: ListTile(
              title: Text('$timestamp'),
              subtitle: Text('Dream Log: $mindLog'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editMindLog(mindLog),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteMindLog(mindLog['id']),
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
