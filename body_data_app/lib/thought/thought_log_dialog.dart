import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../database_helper.dart';
import '../date_time_picker_dialog.dart';
import '../models/thought.dart';
import 'package:intl/intl.dart';

class ThoughtLogDialog extends StatefulWidget {
  final int? thoughtId;

  const ThoughtLogDialog({super.key, this.thoughtId});

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

  String thoughtToString(Thought thought) {
    var thoughtStr = """     timestamp: ${DateFormat('MM-dd-yy HH:mm').format(thought.timestamp)}
    thought_log: ${thought.thought_log}
    start_time: ${thought.start_time != null ? DateFormat('MM-dd-yy HH:mm').format(thought.start_time!) : ""}
    end_time: ${thought.end_time != null ? DateFormat('MM-dd-yy HH:mm').format(thought.end_time!) : ""}
    length: ${thought.length}
    depth: ${thought.depth}
    location: ${thought.location}
    STILL_THINKING: ${thought.STILL_THINKING}
    """;
    return thoughtStr;
  }

  void _loadExistingThought(int thoughtId) async {
    final existingThought = await db.getThoughtById(thoughtId);
    if (existingThought != null) {
      setState(() {
        _startThoughtTime = existingThought.start_time ?? DateTime.now();
        _endThoughtTime = existingThought.end_time ?? DateTime.now();
        _depth = existingThought.depth ?? 1;
        _thoughtLog = existingThought.thought_log ?? '';
      });
    }
  }

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
    _logger.info("updating thought id: ${thoughtData.id} with data: ${thoughtToString(thoughtData)}");
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
