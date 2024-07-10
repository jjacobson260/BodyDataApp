import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';

class SleepEntryDialog extends StatefulWidget {
  @override
  _SleepEntryDialogState createState() => _SleepEntryDialogState();
}

class _SleepEntryDialogState extends State<SleepEntryDialog> {
  int _minutesToFallAsleep = 5;
  TextEditingController _dreamLogController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkStillAsleepEntry();
  }

  void _checkStillAsleepEntry() async {
    final dbHelper = DatabaseHelper();
    final stillAsleepEntry = await dbHelper.getStillAsleepEntry();

    if (stillAsleepEntry != null) {
      // Still asleep entry found, prompt user to update
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Waking Up')),
            content: Column(
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
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await dbHelper.deleteEntry(stillAsleepEntry['id']);
                        Navigator.of(context).pop();
                      },
                      child: Text('No Sleep'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final wakeTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

                        await dbHelper.updateSleepData(
                          stillAsleepEntry['id'],
                          sleepTime: stillAsleepEntry['sleep_time'] + Duration(minutes: _minutesToFallAsleep).inMinutes.toString(),
                          wakeTime: wakeTime,
                          dreamLog: _dreamLogController.text,
                          stillAsleep: false,
                        );

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

extension on DatabaseHelper {
  Future<Map<String, dynamic>?> getStillAsleepEntry() async {
    final db = await database;
    final result = await db.query(
      'sleep_log',
      where: 'STILL_ASLEEP = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<void> updateSleepData(
    int id, {
    required String sleepTime,
    required String wakeTime,
    String? dreamLog,
    required bool stillAsleep,
  }) async {
    final db = await database;
    await db.update(
      'sleep_log',
      {
        'sleep_time': sleepTime,
        'wake_time': wakeTime,
        'dream_log': dreamLog,
        'STILL_ASLEEP': stillAsleep ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteEntry(int id) async {
    final db = await database;
    await db.delete(
      'sleep_log',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  
}
