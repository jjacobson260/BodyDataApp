import 'package:flutter/material.dart';
import 'database_helper.dart';

class PillEntryDialog extends StatefulWidget {
  @override
  _PillEntryDialogState createState() => _PillEntryDialogState();
}

class _PillEntryDialogState extends State<PillEntryDialog> {
  int? _bristolRating;
  int? _urgency;
  String _unit;

  void _submit() async {
    final record = {
      'timestamp': DateTime.now().toIso8601String(),
      'pill': _bristolRating,
      'dose': _urgency,
      'unit': _blood ? 1 : 0,
    };

    await DatabaseHelper().insertRecord(record);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log Your Pill'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pill'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(7, (int index) {
              return Column(
                  children: [
                    Text('${index + 1}'),
                    Radio<int>(
                      value: index + 1,
                      groupValue: _bristolRating,
                      onChanged: (int? value) {
                        setState(() {
                          _bristolRating = value;
                        });
                      },
                    )
                  ],
                );
            }),
          ),
          Text('Urgency'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(7, (int index) {
              return Column(
                children: [
                  Text('${index + 1}'),
                  Radio<int>(
                    value: index + 1,
                    groupValue: _urgency,
                    onChanged: (int? value) {
                      setState(() {
                        _urgency = value;
                      });
                    },
                  ),
                ] 
              );
            }),
          ),
          CheckboxListTile(
            title: Text('Blood'),
            value: _blood,
            onChanged: (bool? value) {
              setState(() {
                _blood = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _submit,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
