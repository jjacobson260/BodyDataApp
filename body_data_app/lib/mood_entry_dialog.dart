import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'emoji_selection_widget.dart';
import 'models/mood.dart';

class MoodEntryDialog extends StatefulWidget {
  @override
  _MoodEntryDialogState createState() => _MoodEntryDialogState();
}

class _MoodEntryDialogState extends State<MoodEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  int _moodRating = 3;
  List<String> _selectedEmojis = [];
  String _note = '';

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      DateTime timestamp = DateTime.now();

      Mood moodData = Mood();
      moodData.timestamp = timestamp;
      moodData.rating = _moodRating;
      moodData.moods_json = _selectedEmojis.join('|');
      moodData.note = _note;

      await DatabaseHelper().insertMoodData(moodData);

      Navigator.of(context).pop(); // Close the dialog

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Mood data saved'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Mood Data'),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Mood Rating: $_moodRating'),
                Slider(
                  value: _moodRating.toDouble(),
                  min: 1,
                  max: 7,
                  divisions: 6,
                  label: '$_moodRating',
                  onChanged: (value) {
                    setState(() {
                      _moodRating = value.toInt();
                    });
                  },
                ),
                SizedBox(height: 16),
                Text('Select Moods:'),
                Container(
                  child: EmojiSelectionWidget(
                    onSelectionChanged: (selectedEmojis) {
                      setState(() {
                        _selectedEmojis = selectedEmojis;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Note'),
                  maxLines: 10,
                  onSaved: (value) {
                    _note = value!;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _saveData,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
