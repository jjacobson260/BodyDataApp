import 'package:body_data_app/models/poop.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'date_time_picker_dialog.dart';

class PoopEntryDialog extends StatefulWidget {
  final bool isEditMode;
  final Map<String, dynamic>? initialData;

  PoopEntryDialog({this.isEditMode=false, this.initialData});

  @override
  _PoopEntryDialogState createState() => _PoopEntryDialogState();
}

class _PoopEntryDialogState extends State<PoopEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  late int _bristolRating;
  late int _urgency;
  late bool _blood;
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    if (widget.isEditMode && widget.initialData != null) {
      _bristolRating = widget.initialData!['bristol_rating'];
      _urgency = widget.initialData!['urgency'];
      _blood = widget.initialData!['blood'] == 1;
      _selectedDateTime = DateTime.parse(widget.initialData!['timestamp']);
    } else {
      _bristolRating = 4;
      _urgency = 4;
      _blood = false;
      _selectedDateTime = DateTime.now();
    }
  }

  void _saveData() async {
    final data = Poop();
    data.timestamp = _selectedDateTime;
    data.bristolRating = _bristolRating;
    data.urgency = _urgency;
    data.blood = _blood ? true : false;

    if (widget.isEditMode && widget.initialData != null) {
      data.id = widget.initialData!['id'];
      await DatabaseHelper().updatePoopData(data);
    } else {
      await DatabaseHelper().insertPoopData(data);
    }

    Navigator.of(context).pop();
  }

  void _showBristolChart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Bristol Rating Chart'),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Image.asset('assets/bristol_stool_chart.jpg'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column (
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bristol Rating: $_bristolRating'),
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: _showBristolChart,
                ),
              ],
            ),
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
