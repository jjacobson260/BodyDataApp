import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'date_time_picker_dialog.dart'; // Import your DateTimePickerDialog

class FoodEntryDialog extends StatefulWidget {
  @override
  _FoodEntryDialogState createState() => _FoodEntryDialogState();
}

class _FoodEntryDialogState extends State<FoodEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now(); // Track selected datetime
  File? _image;

  final picker = ImagePicker();


  Future<void> _saveFoodData() async {
    String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDateTime);

    Map<String, dynamic> foodData = {
      'timestamp': timestamp,
      'description': _descriptionController.text,
      'image_path': _image?.path,
      // Handle image file saving as per your implementation
    };

    await DatabaseHelper().insertFoodData(foodData);

    Navigator.of(context).pop(); // Close the dialog

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Food data saved'),
    ));
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Enter Food Data'),
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
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              _image != null
                ? Center(
                    child: Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ))
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
              SizedBox(height: 16),
              // Add image selection widget or logic here
              Center(
                child: ElevatedButton(
                  onPressed: _saveFoodData,
                  child: Text('Save'),
                ),
              )          
            ],
          ),
        ),
      ),
    );
  }
}
