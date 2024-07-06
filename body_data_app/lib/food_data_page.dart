import 'dart:io';
import 'package:flutter/material.dart';
import 'database_helper.dart';

class FoodDataPage extends StatefulWidget {
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

  Future<void> _fetchFoodData() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().getFoodData();
    setState(() {
      _foodData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Data'),
      ),
      body: ListView.builder(
        itemCount: _foodData.length,
        itemBuilder: (context, index) {
          final item = _foodData[index];
          return Card(
            child: ListTile(
              leading: Image.file(
                File(item['image_path']),
                height: 50,
                width: 50,
              ),
              title: Text(item['description']),
              subtitle: Text(item['timestamp']),
            ),
          );
        },
      ),
    );
  }
}
