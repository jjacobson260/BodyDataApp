import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

class FullScreenImagePage extends StatelessWidget {
  final String imagePath;

  const FullScreenImagePage({super.key, required this.imagePath});

  Future<void> _saveImageToGallery(BuildContext context) async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final result = await ImageGallerySaver.saveFile(imagePath);
        if (result["isSuccess"]) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image saved to gallery')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save image')));
        }
      } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
        if (selectedDirectory != null) {
          final fileName = path.basename(imagePath);
          final newPath = path.join(selectedDirectory, fileName);
          final file = File(imagePath);
          await file.copy(newPath);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image saved to $newPath')));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving image: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: () => _saveImageToGallery(context),
          ),
        ],
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
        ),
      ),
    );
  }
}
