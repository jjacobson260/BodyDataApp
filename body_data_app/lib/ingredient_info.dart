import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class IngredientInfo {
  final String name;
  final String category;
  final String icon; // This could be a path to a PNG or an emoji
  

  IngredientInfo({required this.name, required this.category, required this.icon });

  Future<void> insertIngredientInfos(List<IngredientInfo> ingredients) async {
  final db = await DatabaseHelper().database;

  for (var ingredient in ingredients) {
    DatabaseHelper().insertIngredient(ingredient);
  }
}
}

final List<IngredientInfo> ingredients = [

  // Fruits
  IngredientInfo(name: 'Apple', icon: '🍎', category: 'plant'),
  IngredientInfo(name: 'Banana', icon: '🍌', category: 'plant'),
  IngredientInfo(name: 'Grapes', icon: '🍇', category: 'plant'),
  IngredientInfo(name: 'Watermelon', icon: '🍉', category: 'plant'),
  IngredientInfo(name: 'Orange', icon: '🍊', category: 'plant'),
  IngredientInfo(name: 'Lemon', icon: '🍋', category: 'plant'),
  IngredientInfo(name: 'Strawberry', icon: '🍓', category: 'plant'),
  IngredientInfo(name: 'Cherry', icon: '🍒', category: 'plant'),
  IngredientInfo(name: 'Peach', icon: '🍑', category: 'plant'),
  IngredientInfo(name: 'Pineapple', icon: '🍍', category: 'plant'),
  IngredientInfo(name: 'Mango', icon: '🥭', category: 'plant'),
  IngredientInfo(name: 'Blueberry', icon: '🫐', category: 'plant'),
  IngredientInfo(name: 'Kiwi', icon: '🥝', category: 'plant'),
  IngredientInfo(name: 'Tomato', icon: '🍅', category: 'plant'),

  // Vegetables
  IngredientInfo(name: 'Carrot', icon: '🥕', category: 'plant'),
  IngredientInfo(name: 'Corn', icon: '🌽', category: 'plant'),
  IngredientInfo(name: 'Hot Pepper', icon: '🌶️', category: 'plant'),
  IngredientInfo(name: 'Cucumber', icon: '🥒', category: 'plant'),
  IngredientInfo(name: 'Broccoli', icon: '🥦', category: 'plant'),
  IngredientInfo(name: 'Garlic', icon: '🧄', category: 'plant'),
  IngredientInfo(name: 'Onion', icon: '🧅', category: 'plant'),
  IngredientInfo(name: 'Potato', icon: '🥔', category: 'plant'),
  IngredientInfo(name: 'Sweet Potato', icon: '🍠', category: 'plant'),
  IngredientInfo(name: 'Mushroom', icon: '🍄', category: 'plant'),
  IngredientInfo(name: 'Leafy Green', icon: '🥬', category: 'plant'),
  IngredientInfo(name: 'Bell Pepper', icon: '🫑', category: 'plant'),
  IngredientInfo(name: 'Eggplant', icon: '🍆', category: 'plant'),
  IngredientInfo(name: 'Avocado', icon: '🥑', category: 'plant'),

  // Animals (Animal)
  IngredientInfo(name: 'Chicken', icon: '🐔', category: 'animal'),
  IngredientInfo(name: 'Beef', icon: '🐄', category: 'animal'),
  IngredientInfo(name: 'Pork', icon: '🐖', category: 'animal'),
  IngredientInfo(name: 'Turkey', icon: '🦃', category: 'animal'),
  IngredientInfo(name: 'Fish', icon: '🐟', category: 'animal'),
  IngredientInfo(name: 'Shrimp', icon: '🦐', category: 'animal'),
  IngredientInfo(name: 'Crab', icon: '🦀', category: 'animal'),
  IngredientInfo(name: 'Lobster', icon: '🦞', category: 'animal'),
  IngredientInfo(name: 'Duck', icon: '🦆', category: 'animal'),
  IngredientInfo(name: 'Lamb', icon: '🐑', category: 'animal'),
  IngredientInfo(name: 'Goat', icon: '🐐', category: 'animal'),
  IngredientInfo(name: 'Rabbit', icon: '🐇', category: 'animal'),
  IngredientInfo(name: 'Squid', icon: '🦑', category: 'animal'),
  IngredientInfo(name: 'Octopus', icon: '🐙', category: 'animal'),
  IngredientInfo(name: 'Dog', icon: '🐕', category: 'animal'),
  IngredientInfo(name: 'Guinea Pig', icon: '🐹', category: 'animal'),
  IngredientInfo(name: 'Lizard', icon: '🦎', category: 'animal'),
  IngredientInfo(name: 'Snake', icon: '🐍', category: 'animal'),

  // Products (product)
  IngredientInfo(name: 'Milk', icon: '🥛', category: 'product'),
  IngredientInfo(name: 'Eggs', icon: '🥚', category: 'product'),
  IngredientInfo(name: 'Cheese', icon: '🧀', category: 'product'),
  IngredientInfo(name: 'Honey', icon: '🍯', category: 'product'),
  IngredientInfo(name: 'Tofu', icon: "assets/icon/tofu.png", category: "product"),

];
