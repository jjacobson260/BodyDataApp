import 'package:flutter/material.dart';
import '../database_helper.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:logging/logging.dart';
import '../models/sleep.dart';


class SleepEntryDialog extends StatefulWidget {
  const SleepEntryDialog({super.key});

  @override
  _SleepEntryDialogState createState() => _SleepEntryDialogState();
}

class _SleepEntryDialogState extends State<SleepEntryDialog> {
  int _minutesToFallAsleep = 5;
  final TextEditingController _dreamLogController = TextEditingController();

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
            title: const Center(child: Text('Waking Up')),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Minutes to Sleep?'),
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
                      decoration: const InputDecoration(
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
                        await dbHelper.deleteSleepData(latestEntry.id);
                        Navigator.of(context).pop();
                      },
                      child: const Text('No Sleep'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final wakeTime = now;
                        // Parse existing sleep time
                        var sleepTime = latestEntry.sleep_time;
                        // Add minutes to sleep time
                        final updatedSleepTime = sleepTime.add(Duration(minutes: _minutesToFallAsleep));
                        // Format updated sleep time to string
                        final updatedSleepTimeStr = updatedSleepTime;

                        Sleep sleepData = Sleep();
                        sleepData.id = latestEntry.id;
                        sleepData.sleep_time = updatedSleepTimeStr;
                        sleepData.wake_time = wakeTime;
                        sleepData.dream_log = _dreamLogController.text;
                        sleepData.STILL_ASLEEP = false;
                        
                        _logger.info('Updating: ${sleepData.id} with data: $sleepData');
                        await dbHelper.updateSleepData(sleepData);

                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
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
