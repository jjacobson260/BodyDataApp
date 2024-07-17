import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'database_helper.dart';
import 'full_screen_image_page.dart';

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
        title: Text('Food Data'),
      ),
      body: ListView.builder(
        itemCount: _foodData.length,
        itemBuilder: (context, index) {
          final item = _foodData[index];
          return Card(
            child: ListTile(
              
              title: Text(item['timestamp']),
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
                  : SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
