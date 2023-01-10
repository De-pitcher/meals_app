import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';
import '../providers/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    final meals = Provider.of<Meals>(context, listen: false);
    final displayedMeal = meals.favoriteMeals.isNotEmpty
        ? meals.favoriteMeals
            .where(
              (meal) => meal.categories.contains(categoryId),
            )
            .toList()
        : meals.items;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: displayedMeal[index],
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
