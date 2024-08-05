import 'package:body_data_app/models/thought.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'package:logging/logging.dart';
import 'models/thought.dart';

class ThoughtEntryDialog extends StatefulWidget {

  @override
  _ThoughtEntryDialogState createState() => _ThoughtEntryDialogState();
}



class _ThoughtEntryDialogState extends State<ThoughtEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _entry = '';
  int _depth = 1;
  int _length = 0;

  final Logger _logger = Logger('ThoughtEntryDialog');

  int calculateMinutesBetween(DateTime startDateTime, DateTime endDateTime) {
    Duration difference = endDateTime.difference(startDateTime);
    int differenceInMinutes = difference.inMinutes;

    return differenceInMinutes;
  }

  @override
  void initState() {
    super.initState();
    _checkStillThinkingEntry();
  }

  void _checkStillThinkingEntry() async {
    final dbHelper = DatabaseHelper();
    final latestEntry = await dbHelper.getStillThinkingEntry();
    _logger.info("checkStillThinking Called");
    if (latestEntry != null) {
      // Still asleep entry found, prompt user to update
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Your Thoughts'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Text('Depth: $_depth')),
                  Slider(
                    value: _depth.toDouble(),
                    min: 1,
                    max: 7,
                    divisions: 6,
                    label: '$_depth',
                    onChanged: (value) {
                      setState(() {
                        _depth = value.toInt();
                      });
                    },
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Thought Entry'),
                      maxLines: 17,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Thoughts';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _entry = value!;
                      },
                    ),
                  ),
                  
                ]
              )
            ),
            actions: 
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await dbHelper.deleteThoughtData(latestEntry.id);
                        Navigator.of(context).pop();
                      },
                      child: Text('No Thoughts'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        // Parse existing sleep time
                        final startTime = latestEntry.timestamp;
                        // Add minutes to sleep time
                        final thoughtTime = calculateMinutesBetween(startTime, now);

                        Thought thoughtData = Thought();
                        thoughtData.id = latestEntry.id;
                        thoughtData.end_time = DateTime.now();
                        thoughtData.length = thoughtTime;
                        thoughtData.depth = _depth;
                        thoughtData.thought_log = _entry;
                        thoughtData.STILL_THINKING = false;

                        _logger.info('Updating: ${thoughtData.id} with data: $thoughtData');
                        await dbHelper.updateThoughtData(thoughtData);

                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ],
          );
         },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
