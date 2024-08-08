import 'package:flutter/material.dart';

class EmojiSelectionWidget extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  const EmojiSelectionWidget({super.key, required this.onSelectionChanged});

  @override
  _EmojiSelectionWidgetState createState() => _EmojiSelectionWidgetState();
}

class _EmojiSelectionWidgetState extends State<EmojiSelectionWidget> {
  final List<String> _selectedEmojis = [];
  final List<String> _emojis = [
    '😊', '😢', '😡', '😲',
    '😍', '😎', '🤯', '😴',
    '🥳', '🤢', '😱', '🤔',
  ];

  void _toggleEmojiSelection(String emoji) {
    setState(() {
      if (_selectedEmojis.contains(emoji)) {
        _selectedEmojis.remove(emoji);
      } else {
        _selectedEmojis.add(emoji);
      }
      widget.onSelectionChanged(_selectedEmojis);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust the number of columns as needed
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, // Aspect ratio 1:1, square cells
      ),
      itemCount: _emojis.length,
      itemBuilder: (BuildContext context, int index) {
        String emoji = _emojis[index];
        bool isSelected = _selectedEmojis.contains(emoji);
        return GestureDetector(
          onTap: () => _toggleEmojiSelection(emoji),
          child: Container(
            padding: const EdgeInsets.all(4.0), // Adjust padding as needed
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
