import 'package:flutter/material.dart';
import 'sleep_log_dialog.dart';

class SleepOptionsDialog extends StatelessWidget {
  final VoidCallback onStartSleep;

  SleepOptionsDialog({required this.onStartSleep});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sleep'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              onStartSleep();
              Navigator.of(context).pop();
            },
            child: Text('Start Sleep'),
          ),
          SizedBox(height: 7),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showLogSleepDialog(context);
            },
            child: Text('Log Sleep'),
          ),
        ],
      ),
    );
  }
  

  void _showLogSleepDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SleepLogDialog();
      },
    );
  }
}
