import 'package:flutter/material.dart';
import 'thought_log_dialog.dart';

class ThoughtOptionsDialog extends StatelessWidget {
  final VoidCallback onStartThinking;

  const ThoughtOptionsDialog({super.key, required this.onStartThinking});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thought Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              onStartThinking();
              Navigator.of(context).pop();
            },
            child: const Text('Start Thinking'),
          ),
          const SizedBox(height: 7),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showLogThoughtDialog(context);
            },
            child: const Text('Log Thinking'),
          ),
        ],
      ),
    );
  }
  

  void _showLogThoughtDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ThoughtLogDialog();
      },
    );
  }
}
