import 'dart:io';
import 'package:flutter/material.dart';
import '../database_helper.dart';
import '../full_screen_image_page.dart';
import '../models/journal.dart';
import 'package:intl/intl.dart';

class JournalDataPage extends StatefulWidget {
  const JournalDataPage({super.key});

  @override
  _JournalDataPageState createState() => _JournalDataPageState();
}

class _JournalDataPageState extends State<JournalDataPage> {
  List<Journal> _journalData = [];

  @override
  void initState() {
    super.initState();
    _fetchJournalData();
  }

  Future<void> _fetchJournalData() async {
    List<Journal> data = await DatabaseHelper().getJournalData();
    setState(() {
      _journalData = data;
    });
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
      ),
      body: ListView.builder(
        itemCount: _journalData.length,
        itemBuilder: (context, index) {
          final item = _journalData[index];
          final imagePath = item.image_path ?? '';
          return Card(
            child: ListTile(
              title: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(item.timestamp)),
              subtitle: Text(item.entry),
              trailing: item.image_path != null
                  ? GestureDetector(
                      onTap: () => _showFullScreenImage(context, imagePath),
                      child: Image.file(
                        File(imagePath),
                        height: 50,
                        width: 50,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}

