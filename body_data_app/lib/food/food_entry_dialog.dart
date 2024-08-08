import 'dart:io';
import 'package:body_data_app/models/food.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../date_time_picker_dialog.dart'; 
import '../image_selector_widget.dart';
import 'ingredient_info.dart';
import '../database_helper.dart';

class FoodEntryDialog extends StatefulWidget {
  const FoodEntryDialog({super.key});

  @override
  _FoodEntryDialogState createState() => _FoodEntryDialogState();
}

class _FoodEntryDialogState extends State<FoodEntryDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now(); // Track selected datetime
  File? _image;

  final List<IngredientInfo> _ingredients = []; // List of all ingredients
  List<IngredientInfo> _selectedIngredients = []; // List of selected ingredients


  final picker = ImagePicker();


  Future<void> _saveFoodData() async {

    Food foodData = Food();
    foodData.timestamp = _selectedDateTime;
    foodData.description = _descriptionController.text;
    foodData.image_path = _image?.path;
    foodData.ingredients_json = '';
    foodData.location = '';
    foodData.recipe_id = -1;
    
    await DatabaseHelper().insertFoodData(foodData);

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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

  void _onIngredientSelectionChanged(List<IngredientInfo> selectedIngredients) {
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
          const Text('Enter Food Data'),
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
                decoration: const InputDecoration(labelText: 'Description'),
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
              const SizedBox(height: 8),
              ImageSelector(
                onImageSelected: (image) {
                  setState(() {
                    _image = image;
                  });
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _saveFoodData,
                  child: const Text('Save'),
                ),
              )          
            ],
          ),
        ),
      ),
    );
  }
}
