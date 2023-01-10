import 'package:flutter/foundation.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class Meals with ChangeNotifier {
  final List<Meal> _items = [...dummyMeals];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> get items => [..._items];

  List<Meal> get favoriteMeals => _items
      .where(
        (meal) => meal.isFavorite,
      )
      .toList();

  List<Meal> filteredMeals = [];

  Meal selectedMeal(String mealId) => _items.firstWhere(
        (meal) => meal.id == mealId,
      );

  void toggleFavorite(String mealId) {
    final existingIndex = _items.indexWhere((meal) => meal.id == mealId);
    final currentMeal = _items.elementAt(existingIndex);
    final curentIsFav = currentMeal.isFavorite;
    currentMeal.isFavorite = !curentIsFav;
    _items[existingIndex] = currentMeal;
    notifyListeners();
  }

  void setFilters(Map<String, bool> filterData) {
    filters = filterData;
    filteredMeals = _items.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}
