import 'dart:io';
import 'package:flutter/material.dart';
import '../database_helper.dart';
import '../full_screen_image_page.dart';
import '../models/food.dart';
import 'package:intl/intl.dart';

class FoodDataPage extends StatefulWidget {
  const FoodDataPage({super.key});

  @override
  _FoodDataPageState createState() => _FoodDataPageState();
}

class _FoodDataPageState extends State<FoodDataPage> {
  List<Map<String, dynamic>> _foodData = [];

  @override
  void initState() {
    super.initState();
    _fetchFoodData();
  }

  Map<String, dynamic> convertFoodToMap(Food food) {
    final map = {
      'id': food.id,
      'timestamp': food.timestamp,
      'description': food.description,
      'image_path': food.image_path,
      'ingredients_json': food.ingredients_json,
      'recipe_id': food.recipe_id,
      'location': food.location
    };
    return map;
  }

  Future<void> _fetchFoodData() async {
    List<Food> data = await DatabaseHelper().getFoodData();
    final dataMap = data.map((object) {
      return convertFoodToMap(object);
    }).toList();
    setState(() {
      _foodData = dataMap;
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
        title: const Text('Food Data'),
      ),
      body: ListView.builder(
        itemCount: _foodData.length,
        itemBuilder: (context, index) {
          final item = _foodData[index];
          return Card(
            child: ListTile(
              
              title: Text(DateFormat('MM-dd-yy HH:mm').format(item['timestamp'])),
              subtitle: Text(item['description']),
              trailing: item['image_path'] != null
                  ? GestureDetector(
                      onTap: () => _showFullScreenImage(context, item['image_path']),
                      child: Image.file(
                        File(item['image_path']),
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
