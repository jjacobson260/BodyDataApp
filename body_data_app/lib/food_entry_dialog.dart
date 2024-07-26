import 'dart:io';
import 'package:body_data_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_time_picker_dialog.dart'; 
import 'image_selector_widget.dart';
import 'ingredient_picker.dart';
import 'ingredient.dart';
import 'drift_database_helper.dart';
import 'drift_tables.dart';

class FoodEntryDialog extends StatefulWidget {
  @override
  _FoodEntryDialogState createState() => _FoodEntryDialogState();
}

class _FoodEntryDialogState extends State<FoodEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now(); // Track selected datetime
  File? _image;

  List<Ingredient> _ingredients = []; // List of all ingredients
  List<Ingredient> _selectedIngredients = []; // List of selected ingredients


  final picker = ImagePicker();


  Future<void> _saveFoodData() async {
    String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDateTime);

    Map<String, dynamic> foodData = {
      'timestamp': timestamp,
      'description': _descriptionController.text,
      'image_path': _image?.path,
    };
    await DriftDatabaseHelper(appDatabase).insert(FoodData(), foodData);

    Navigator.of(context).pop();

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

  void _onIngredientSelectionChanged(List<Ingredient> selectedIngredients) {
    setState(() {
      _selectedIngredients = selectedIngredients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
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
              /*SizedBox(height: 8),
              IngredientPicker(
                selectedIngredients: _selectedIngredients,
                onSelectionChanged: _onIngredientSelectionChanged,
              ),  */            
              SizedBox(height: 8),
              ImageSelector(
                onImageSelected: (image) {
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SizedBox(height: 16),
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
