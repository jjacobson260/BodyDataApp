import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class DateTimePickerDialog extends StatefulWidget {
  final DateTime initialDateTime;
  final void Function(DateTime selectedDateTime) onDateTimeSelected;

  DateTimePickerDialog({
    required this.initialDateTime,
    required this.onDateTimeSelected,
  });

  @override
  _DateTimePickerDialogState createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });

        widget.onDateTimeSelected(_selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.schedule), // Clock icon
      onPressed: () => _selectDateTime(context), // Open date and time picker
    );
  }
}
