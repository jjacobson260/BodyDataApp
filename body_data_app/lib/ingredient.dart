import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class Ingredient {
  final String name;
  final String category;
  final String icon; // This could be a path to a PNG or an emoji
  

  Ingredient({required this.name, required this.category, required this.icon });

  Future<void> insertIngredients(List<Ingredient> ingredients) async {
  final db = await DatabaseHelper().database;

  for (var ingredient in ingredients) {
    DatabaseHelper().insertIngredient(ingredient);
  }
}
}

final List<Ingredient> ingredients = [

  // Fruits
  Ingredient(name: 'Apple', icon: '🍎', category: 'plant'),
  Ingredient(name: 'Banana', icon: '🍌', category: 'plant'),
  Ingredient(name: 'Grapes', icon: '🍇', category: 'plant'),
  Ingredient(name: 'Watermelon', icon: '🍉', category: 'plant'),
  Ingredient(name: 'Orange', icon: '🍊', category: 'plant'),
  Ingredient(name: 'Lemon', icon: '🍋', category: 'plant'),
  Ingredient(name: 'Strawberry', icon: '🍓', category: 'plant'),
  Ingredient(name: 'Cherry', icon: '🍒', category: 'plant'),
  Ingredient(name: 'Peach', icon: '🍑', category: 'plant'),
  Ingredient(name: 'Pineapple', icon: '🍍', category: 'plant'),
  Ingredient(name: 'Mango', icon: '🥭', category: 'plant'),
  Ingredient(name: 'Blueberry', icon: '🫐', category: 'plant'),
  Ingredient(name: 'Kiwi', icon: '🥝', category: 'plant'),
  Ingredient(name: 'Tomato', icon: '🍅', category: 'plant'),

  // Vegetables
  Ingredient(name: 'Carrot', icon: '🥕', category: 'plant'),
  Ingredient(name: 'Corn', icon: '🌽', category: 'plant'),
  Ingredient(name: 'Hot Pepper', icon: '🌶️', category: 'plant'),
  Ingredient(name: 'Cucumber', icon: '🥒', category: 'plant'),
  Ingredient(name: 'Broccoli', icon: '🥦', category: 'plant'),
  Ingredient(name: 'Garlic', icon: '🧄', category: 'plant'),
  Ingredient(name: 'Onion', icon: '🧅', category: 'plant'),
  Ingredient(name: 'Potato', icon: '🥔', category: 'plant'),
  Ingredient(name: 'Sweet Potato', icon: '🍠', category: 'plant'),
  Ingredient(name: 'Mushroom', icon: '🍄', category: 'plant'),
  Ingredient(name: 'Leafy Green', icon: '🥬', category: 'plant'),
  Ingredient(name: 'Bell Pepper', icon: '🫑', category: 'plant'),
  Ingredient(name: 'Eggplant', icon: '🍆', category: 'plant'),
  Ingredient(name: 'Avocado', icon: '🥑', category: 'plant'),

  // Animals (Animal)
  Ingredient(name: 'Chicken', icon: '🐔', category: 'animal'),
  Ingredient(name: 'Beef', icon: '🐄', category: 'animal'),
  Ingredient(name: 'Pork', icon: '🐖', category: 'animal'),
  Ingredient(name: 'Turkey', icon: '🦃', category: 'animal'),
  Ingredient(name: 'Fish', icon: '🐟', category: 'animal'),
  Ingredient(name: 'Shrimp', icon: '🦐', category: 'animal'),
  Ingredient(name: 'Crab', icon: '🦀', category: 'animal'),
  Ingredient(name: 'Lobster', icon: '🦞', category: 'animal'),
  Ingredient(name: 'Duck', icon: '🦆', category: 'animal'),
  Ingredient(name: 'Lamb', icon: '🐑', category: 'animal'),
  Ingredient(name: 'Goat', icon: '🐐', category: 'animal'),
  Ingredient(name: 'Rabbit', icon: '🐇', category: 'animal'),
  Ingredient(name: 'Squid', icon: '🦑', category: 'animal'),
  Ingredient(name: 'Octopus', icon: '🐙', category: 'animal'),
  Ingredient(name: 'Dog', icon: '🐕', category: 'animal'),
  Ingredient(name: 'Guinea Pig', icon: '🐹', category: 'animal'),
  Ingredient(name: 'Lizard', icon: '🦎', category: 'animal'),
  Ingredient(name: 'Snake', icon: '🐍', category: 'animal'),

  // Products (product)
  Ingredient(name: 'Milk', icon: '🥛', category: 'product'),
  Ingredient(name: 'Eggs', icon: '🥚', category: 'product'),
  Ingredient(name: 'Cheese', icon: '🧀', category: 'product'),
  Ingredient(name: 'Honey', icon: '🍯', category: 'product'),
  Ingredient(name: 'Tofu', icon: "assets/icon/tofu.png", category: "product"),

];
