import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class MindEntryDialog extends StatefulWidget {
  final int mindLogId;

  MindEntryDialog({required this.mindLogId});

  @override
  _MindEntryDialogState createState() => _MindEntryDialogState();
}

class _MindEntryDialogState extends State<MindEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  int _minutesToFallAsleep = 0;
  String _dreamLog = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Sleep Log'),
    );
  }

}
