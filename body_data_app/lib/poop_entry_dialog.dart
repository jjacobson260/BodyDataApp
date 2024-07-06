import 'package:flutter/material.dart';
import 'database_helper.dart';

class PoopEntryDialog extends StatefulWidget {
  @override
  _PoopEntryDialogState createState() => _PoopEntryDialogState();
}

class _PoopEntryDialogState extends State<PoopEntryDialog> {
  int? _bristolRating;
  int? _urgency;
  bool _blood = false;

  void _submit() async {
    final record = {
      'timestamp': DateTime.now().toIso8601String(),
      'bristol_rating': _bristolRating,
      'urgency': _urgency,
      'blood': _blood ? 1 : 0,
    };

    await DatabaseHelper().insertRecord(record);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log Your Poop'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Bristol Rating'),
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
