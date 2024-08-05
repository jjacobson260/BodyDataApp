import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'image_selector_widget.dart';
import 'models/journal.dart';


class JournalEntryDialog extends StatefulWidget {
  @override
  _JournalEntryDialogState createState() => _JournalEntryDialogState();
}

class _JournalEntryDialogState extends State<JournalEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _entry = '';
  File? _image;

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final timestamp = DateTime.now();

      Journal journalData = Journal();
      journalData.timestamp = timestamp;
      journalData.entry = _entry;
      journalData.image_path = _image?.path;

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
      content: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Journal Entry'),
                maxLines: 17,
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
            SizedBox(height: 8),
              ImageSelector(
                onImageSelected: (image) {
                  setState(() {
                    _image = image;
                  });
                },
              ),

          ]
        )
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
