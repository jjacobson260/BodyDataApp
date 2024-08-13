import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../database_helper.dart';
import '../date_time_picker_dialog.dart';
import '../models/thought.dart';

class ThoughtLogDialog extends StatefulWidget {
  const ThoughtLogDialog({super.key});

  @override
  _ThoughtLogDialogState createState() => _ThoughtLogDialogState();
}

class _ThoughtLogDialogState extends State<ThoughtLogDialog> {

  final Logger _logger = Logger('ThoughtLogDialog');

  var db = DatabaseHelper();
  DateTime _startThoughtTime = DateTime.now();
  DateTime _endThoughtTime = DateTime.now();
  int _depth = 1;
  String _thoughtLog = '';

  int calculateMinutesBetween(DateTime startDateTime, DateTime endDateTime) {
    Duration difference = endDateTime.difference(startDateTime);
    int differenceInMinutes = difference.inMinutes;

    return differenceInMinutes;
  }

  void _saveThoughtData() async {
    Thought? lastThought = await db.getStillThinkingEntry();
    if (lastThought != null) {
      _startThoughtTime = lastThought.start_time ?? DateTime.now();
    }
    final length = calculateMinutesBetween(_startThoughtTime, _endThoughtTime);
    Thought thoughtData = await db.getStillThinkingEntry() ?? Thought();
    thoughtData.timestamp = DateTime.now();
    thoughtData.start_time = _startThoughtTime;
    thoughtData.end_time = _endThoughtTime;
    thoughtData.length = length;
    thoughtData.depth = _depth;
    thoughtData.thought_log = _thoughtLog;
    thoughtData.location = null;
    thoughtData.STILL_THINKING = false;
    _logger.info("updating thought id: ${thoughtData.id} with data: $thoughtData");
    await DatabaseHelper().updateThoughtData(thoughtData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log Thought'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text('Start'),
              ),
              Expanded(
                flex: 5,
                child: DateTimePickerDialog(
                  initialDateTime: _startThoughtTime,
                  onDateTimeSelected: (dateTime) {
                    setState(() {
                      _startThoughtTime = dateTime;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text('End'),
              ),
              Expanded(
                flex: 5,
                child: DateTimePickerDialog(
                  initialDateTime: _endThoughtTime,
                  onDateTimeSelected: (dateTime) {
                    setState(() {
                      _endThoughtTime = dateTime;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: Text('Depth: $_depth')),
          Slider(
            value: _depth.toDouble(),
            min: 1,
            max: 7,
            divisions: 6,
            label: '$_depth',
            onChanged: (value) {
              setState(() {
                _depth = value.toInt();
              });
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Thought Log'),
            onChanged: (value) {
              setState(() {
                _thoughtLog = value;
              });
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: _saveThoughtData,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
