import 'package:flutter/foundation.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _items = [...dummyMeals];

  List<Meal> get items => [..._items];


  // void _removeMeal(String mealId) {
  //   _items.removeWhere((meal) => meal.id == mealId);
  // }
}
