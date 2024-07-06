import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class PoopEntryDialog extends StatefulWidget {
  @override
  _PoopEntryDialogState createState() => _PoopEntryDialogState();
}

class _PoopEntryDialogState extends State<PoopEntryDialog> {
  double _bristolRating = 1.0;
  double _urgency = 1.0;
  bool _blood = false;

  void _submitData() async {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    final data = {
      'timestamp': formattedDate,
      'bristol_rating': _bristolRating,
      'urgency': _urgency,
      'blood': _blood ? 1 : 0,
    };

    await DatabaseHelper().insertPoopData(data);

    Navigator.of(context).pop();
  }
  /*
  Widget _buildSliderWithLabels(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) => Text('${index + 1}')),
        ),
        Row(
          children: [
            Text(value.toStringAsFixed(1)),
            Expanded(
              child: Slider(
                value: value,
                min: 1.0,
                max: 7.0,
                divisions: 60, // Provides more granularity to select from 1.0 to 7.0
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
  */
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Poop Data'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bristol Rating'),
            Row(
              children: [
                Text(_bristolRating.toStringAsFixed(1)),
                Expanded(
                  child: Slider(
                    value: _bristolRating,
                    min: 1.0,
                    max: 7.0,
                    divisions: 60, // Provides more granularity to select from 1.0 to 7.0
                    onChanged: (value) {
                      setState(() {
                        _bristolRating = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Urgency'),
            Row(
              children: [
                Text(_urgency.toStringAsFixed(1)),
                Expanded(
                  child: Slider(
                    value: _urgency,
                    min: 1.0,
                    max: 7.0,
                    divisions: 60, // Provides more granularity to select from 1.0 to 7.0
                    onChanged: (value) {
                      setState(() {
                        _urgency = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _blood,
                  onChanged: (value) {
                    setState(() {
                      _blood = value!;
                    });
                  },
                ),
                Text('Blood'),
              ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
        
            
          ],
        ),
      )
    );
  }
}
