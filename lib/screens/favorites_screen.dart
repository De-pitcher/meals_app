import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  // final List<Meal> favoriteMeals;
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Provider.of<Meals>(context).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorite yet -  Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
