import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class JournalEntryDialog extends StatefulWidget {
  @override
  _JournalEntryDialogState createState() => _JournalEntryDialogState();
}

class _JournalEntryDialogState extends State<JournalEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _entry = '';

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      Map<String, dynamic> journalData = {
        'timestamp': timestamp,
        'entry': _entry,
      };

      await DatabaseHelper().insertJournalData(journalData);

      Navigator.of(context).pop(); // Close the dialog

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Journal entry saved'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Journal Entry'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Journal Entry'),
          maxLines: 100,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a journal entry';
            }
            return null;
          },
          onSaved: (value) {
            _entry = value!;
          },
        ),
      ),
      actions: <Widget>[
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: _saveData,
            child: Text('Save'),
          ),
        )
      ],
    );
  }
}
