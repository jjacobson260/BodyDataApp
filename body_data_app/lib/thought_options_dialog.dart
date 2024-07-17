import 'package:flutter/material.dart';
import 'thought_log_dialog.dart';

class ThoughtOptionsDialog extends StatelessWidget {
  final VoidCallback onStartThinking;

  ThoughtOptionsDialog({required this.onStartThinking});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thought Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              onStartThinking();
              Navigator.of(context).pop();
            },
            child: Text('Start Thinking'),
          ),
          SizedBox(height: 7),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showLogThoughtDialog(context);
            },
            child: Text('Log Thinking'),
          ),
        ],
      ),
    );
  }
  

  void _showLogThoughtDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThoughtLogDialog();
      },
    );
  }
}
