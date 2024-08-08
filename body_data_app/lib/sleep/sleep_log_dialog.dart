import 'package:flutter/material.dart';
import '../database_helper.dart';
import '../date_time_picker_dialog.dart';
import '../models/sleep.dart';

class SleepLogDialog extends StatefulWidget {
  const SleepLogDialog({super.key});

  @override
  _SleepLogDialogState createState() => _SleepLogDialogState();
}

class _SleepLogDialogState extends State<SleepLogDialog> {
  DateTime _startSleepTime = DateTime.now();
  DateTime _endSleepTime = DateTime.now();
  String _dreamLog = '';

  void _saveSleepData() async {
    Sleep sleepData = Sleep();
    sleepData.timestamp = DateTime.now();
    sleepData.sleep_time = _startSleepTime;
    sleepData.wake_time = _endSleepTime;
    sleepData.dream_log = _dreamLog;
    sleepData.location = null;
    await DatabaseHelper().insertSleepData(sleepData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log Sleep'),
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
                  initialDateTime: _startSleepTime,
                  onDateTimeSelected: (dateTime) {
                    setState(() {
                      _startSleepTime = dateTime;
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
                  initialDateTime: _endSleepTime,
                  onDateTimeSelected: (dateTime) {
                    setState(() {
                      _endSleepTime = dateTime;
                    });
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Dream Log'),
            onChanged: (value) {
              setState(() {
                _dreamLog = value;
              });
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: _saveSleepData,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
