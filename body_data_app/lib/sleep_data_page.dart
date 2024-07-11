import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'sleep_entry_dialog.dart';

class SleepDataPage extends StatefulWidget {
  @override
  _SleepDataPageState createState() => _SleepDataPageState();
}

class _SleepDataPageState extends State<SleepDataPage> {
  List<Map<String, dynamic>> _sleepLogs = [];

  @override
  void initState() {
    super.initState();
    _fetchSleepLogs();
  }

  Future<void> _fetchSleepLogs() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> logs = await db.query('sleep_data');
    setState(() {
      _sleepLogs = logs;
    });
  }

  // this needs to be fixed
  void _editSleepLog(Map<String, dynamic> sleepLog) async {
    final sleepLogId = sleepLog['id'];
    final sleepTime = DateTime.parse(sleepLog['sleep_time']);
    await showDialog(
      context: context,
      builder: (context) {
        return SleepEntryDialog();
      },
    );
    _fetchSleepLogs();
  }

  void _deleteSleepLog(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete('sleep_data', where: 'id = ?', whereArgs: [id]);
    _fetchSleepLogs();
  }

  String _calculateSleepHours(String sleepTime, String wakeTime) {
    final sleepDateTime = DateTime.parse(sleepTime);
    final wakeDateTime = DateTime.parse(wakeTime);
    final duration = wakeDateTime.difference(sleepDateTime);
    final sleepHours = duration.inMinutes / 60;
    return sleepHours.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Data'),
      ),
      body: ListView.builder(
        itemCount: _sleepLogs.length,
        itemBuilder: (context, index) {
          final sleepLog = _sleepLogs[index];
          final sleepTime = sleepLog['sleep_time'];
          final wakeTime = sleepLog['wake_time'] ?? '';
          final sleepHours = wakeTime.isNotEmpty ? _calculateSleepHours(sleepTime, wakeTime) : '';
          final dreamLog = sleepLog['dream_log'] ?? '';

          return Card(
            child: ListTile(
              title: Text('Sleep Time: $sleepTime\nWake Time: $wakeTime\nHours of Sleep: $sleepHours'),
              subtitle: Text('Dream Log: $dreamLog'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editSleepLog(sleepLog),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteSleepLog(sleepLog['id']),
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
