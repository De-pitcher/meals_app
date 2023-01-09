import 'package:flutter/foundation.dart';

import '../dummy_data.dart';
import 'meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _items = [...dummyMeals];

  List<Meal> get items => [..._items];

  List<Meal> get favoriteMeals => _items
      .where(
        (meal) => meal.isFavorite,
      )
      .toList();

  Meal selectedMeal(String mealId) => _items.firstWhere(
        (meal) => meal.id == mealId,
      );

  // void _removeMeal(String mealId) {
  //   _items.removeWhere((meal) => meal.id == mealId);
  // }
}
