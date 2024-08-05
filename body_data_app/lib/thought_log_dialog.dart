import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'date_time_picker_dialog.dart';
import 'models/thought.dart';

class ThoughtLogDialog extends StatefulWidget {
  @override
  _ThoughtLogDialogState createState() => _ThoughtLogDialogState();
}

class _ThoughtLogDialogState extends State<ThoughtLogDialog> {
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

    final length = calculateMinutesBetween(_startThoughtTime, _endThoughtTime);
    Thought thoughtData = Thought();
    thoughtData.timestamp = DateTime.now();
    thoughtData.start_time = _startThoughtTime;
    thoughtData.end_time = _endThoughtTime;
    thoughtData.length = length;
    thoughtData.depth = _depth;
    thoughtData.thought_log = _thoughtLog;
    thoughtData.STILL_THINKING = false;

    await DatabaseHelper().insertThoughtData(thoughtData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log Thought'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Start'),
                flex: 2,
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
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text('End'),
                flex: 2,
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
          SizedBox(height: 8),
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
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(labelText: 'Thought Log'),
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
          child: Text('Save'),
        ),
      ],
    );
  }
}
