import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../database_helper.dart';

class MoodDataPage extends StatefulWidget {
  const MoodDataPage({super.key});

  @override
  _MoodDataPageState createState() => _MoodDataPageState();
}

class _MoodDataPageState extends State<MoodDataPage> {
  List<Map<String, dynamic>> _moodData = [];

  @override
  void initState() {
    super.initState();
    _fetchMoodData();
  }

  Future<void> _fetchMoodData() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getMoodDataAsMap();
    setState(() {
      _moodData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Data'),
      ),
      body: ListView.builder(
        itemCount: _moodData.length,
        itemBuilder: (context, index) {
          final item = _moodData[index];
          return Card(
            child: ListTile(
              title: Text(DateFormat('MM-dd-yy HH:mm').format(item['timestamp'])),
              subtitle: Text("Rating: ${item['rating']}\nMoods: ${item['moods']}\n${item['note']}"),
            ),
          );
        },
      ),
    );
  }
}
