import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientWidget extends StatelessWidget {
  final Ingredient ingredient;
  final bool isSelected;
  final void Function(bool selected) onSelected;

  const IngredientWidget({super.key, 
    required this.ingredient,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(!isSelected);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ingredient.icon.contains('assets/') // Check if it's a PNG
                ? Image.asset(ingredient.icon, height: 50, width: 50)
                : Text(
                    ingredient.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
            const SizedBox(height: 8.0),
            Text(ingredient.name),
            // Display category (optional)
            Text(
              ingredient.category,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
