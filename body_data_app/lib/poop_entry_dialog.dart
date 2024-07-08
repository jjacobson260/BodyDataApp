import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'date_time_picker_dialog.dart';

class PoopEntryDialog extends StatefulWidget {
  @override
  _PoopEntryDialogState createState() => _PoopEntryDialogState();
}

class _PoopEntryDialogState extends State<PoopEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  int _bristolRating = 3; // Initial value for Bristol Rating
  int _urgency = 3; // Initial value for Urgency
  bool _blood = false; // Initial value for Blood checkbox
  DateTime _selectedDateTime = DateTime.now(); 

  void _saveData() async {
    String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDateTime);
    final data = {
      'timestamp': timestamp,
      'bristol_rating': _bristolRating,
      'urgency': _urgency,
      'blood': _blood ? 1 : 0,
    };

    await DatabaseHelper().insertPoopData(data);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Enter Poop Data'),
          DateTimePickerDialog(
            initialDateTime: _selectedDateTime,
            onDateTimeSelected: (dateTime) {
              setState(() {
                _selectedDateTime = dateTime;
              });
            },
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bristol Rating: $_bristolRating'),
            Slider(
              value: _bristolRating.toDouble(),
              min: 1,
              max: 7,
              divisions: 6,
              label: '$_bristolRating',
              onChanged: (value) {
                setState(() {
                  _bristolRating = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            Text('Urgency: $_urgency'),
            Slider(
              value: _urgency.toDouble(),
              min: 1,
              max: 7,
              divisions: 6,
              label: '$_urgency',
              onChanged: (value) {
                setState(() {
                  _urgency = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Blood: '),
                Checkbox(
                  value: _blood,
                  onChanged: (value) {
                    setState(() {
                      _blood = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: _saveData,
                child: Text('Save'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
