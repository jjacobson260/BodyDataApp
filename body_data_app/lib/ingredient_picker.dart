import 'package:flutter/material.dart';
import 'ingredient_info.dart';
import 'ingredient_widget.dart';
import 'database_helper.dart';
import 'models/ingredient.dart';

class IngredientPicker extends StatefulWidget {
  final List<Ingredient> selectedIngredients;
  final void Function(List<Ingredient> selectedIngredients) onSelectionChanged;

  IngredientPicker({
    required this.selectedIngredients,
    required this.onSelectionChanged,
  });

  @override
  _IngredientPickerState createState() => _IngredientPickerState();
}

class _IngredientPickerState extends State<IngredientPicker> {
  List<Ingredient> _allIngredients = [];

  @override
  void initState() {
    super.initState();
    _fetchIngredients();
  }

  Future<void> _fetchIngredients() async {
    // Fetch and sort ingredients from the database
    final ingredients = await DatabaseHelper().getIngredientsByRecency();
    setState(() {
      _allIngredients = ingredients;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Group ingredients by category
    final groupedIngredients = <String, List<Ingredient>>{};
    for (var ingredient in _allIngredients) {
      if (!groupedIngredients.containsKey(ingredient.category)) {
        groupedIngredients[ingredient.category] = [];
      }
      groupedIngredients[ingredient.category]!.add(ingredient);
    }

    return SingleChildScrollView(
      child: ListView(
        children: groupedIngredients.entries.map((entry) {
          final category = entry.key;
          final ingredients = entry.value;

          return ExpansionTile(
            title: Text(category),
            children: ingredients.map((ingredient) {
              final isSelected = widget.selectedIngredients.contains(ingredient);

              return IngredientWidget(
                ingredient: ingredient,
                isSelected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedIngredients.add(ingredient);
                    } else {
                      widget.selectedIngredients.remove(ingredient);
                    }
                    widget.onSelectionChanged(widget.selectedIngredients);
                  });
                },
              );
            }).toList(),
          );
        }).toList(),
      )
    );
  }
}
