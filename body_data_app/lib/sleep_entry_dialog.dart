import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';


class SleepEntryDialog extends StatefulWidget {
  @override
  _SleepEntryDialogState createState() => _SleepEntryDialogState();
}

class _SleepEntryDialogState extends State<SleepEntryDialog> {
  int _minutesToFallAsleep = 5;
  TextEditingController _dreamLogController = TextEditingController();

  final Logger _logger = Logger('SleepEntryDialog');


  @override
  void initState() {
    super.initState();
    _checkStillAsleepEntry();
  }

  void _checkStillAsleepEntry() async {
    final dbHelper = DatabaseHelper();
    final latestEntry = await dbHelper.getStillAsleepEntry();

    if (latestEntry != null) {
      // Still asleep entry found, prompt user to update
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Waking Up')),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Minutes to Sleep?'),
                    NumberPicker(
                      value: _minutesToFallAsleep,
                      minValue: 5,
                      maxValue: 255,
                      step: 5,
                      onChanged: (value) => setState(() => _minutesToFallAsleep = value),
                      axis: Axis.horizontal,
                    ),
                    TextField(
                      controller: _dreamLogController,
                      decoration: InputDecoration(
                        labelText: 'Dream Log',
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await dbHelper.deleteSleepData(latestEntry['id']);
                        Navigator.of(context).pop();
                      },
                      child: Text('No Sleep'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final wakeTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                        // Parse existing sleep time
                        final sleepTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(latestEntry['sleep_time']);
                        // Add minutes to sleep time
                        final updatedSleepTime = sleepTime.add(Duration(minutes: _minutesToFallAsleep));
                        // Format updated sleep time to string
                        final updatedSleepTimeStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedSleepTime);

                        final latestId = latestEntry['id'];
                        final sleepData = {
                          'sleep_time': updatedSleepTimeStr,
                          'wake_time': wakeTime,
                          'dream_log': _dreamLogController.text,
                          'STILL_ASLEEP': 0,
                        };
                        _logger.info('Updating: $latestId with data: $sleepData');
                        await dbHelper.updateSleepData(latestId, sleepData);

                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ],

          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
