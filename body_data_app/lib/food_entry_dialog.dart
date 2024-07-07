import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class FoodEntryDialog extends StatefulWidget {
  @override
  _FoodEntryDialogState createState() => _FoodEntryDialogState();
}

class _FoodEntryDialogState extends State<FoodEntryDialog> {
  String _description = '';
  File? _image;
  
  final picker = ImagePicker();

  void _saveData() async {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    final data = {
      'timestamp': formattedDate,
      'description': _description,
      'image_path': _image?.path, // Store image path if it exists
    };

    await DatabaseHelper().insertFoodData(data);

    Navigator.of(context).pop();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Food Data'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            SizedBox(height: 16),
            _image != null
                ? Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : SizedBox.shrink(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Text('📷'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Text('🖼️'),
                ),
              ],
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _saveData,
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
