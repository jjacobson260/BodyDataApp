import 'package:flutter/material.dart';
import '../database_helper.dart';
import 'thought_entry_dialog.dart';
import 'package:intl/intl.dart';

class ThoughtDataPage extends StatefulWidget {
  const ThoughtDataPage({super.key});

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
    final db = DatabaseHelper();
    final List<Map<String, dynamic>> logs = await db.getThoughtDataAsMap();
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
        return const ThoughtEntryDialog();
      },
    );
    _fetchThoughtLogs();
  }

  void _deleteThoughtLog(int id) async {
    final db = DatabaseHelper();
    await db.deleteThoughtData(id);
    _fetchThoughtLogs();
  }

  String _calculateThoughtMinutes(DateTime timestamp) {
    final duration = timestamp.difference(DateTime.now());
    int thoughtMinutes = duration.inMinutes;
    return thoughtMinutes.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thought Data'),
      ),
      body: ListView.builder(
        itemCount: _thoughtLogs.length,
        itemBuilder: (context, index) {
          final log = _thoughtLogs[index];
          final timestamp = DateFormat('MM-dd-yy HH:mm').format(log['timestamp']);
          final length = log['length'];
          final thoughtMinutes = length != null ? _calculateThoughtMinutes(log['timestamp'],) : '';
          final depth = log['depth'];
          final thoughtLog = log['thought_data'] ?? '';

          return Card(
            child: ListTile(
              title: Text(timestamp),
              subtitle: Text('length: $length \ndepth: $depth \nThought Log: $thoughtLog'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editThoughtLog(thoughtLog),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
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
