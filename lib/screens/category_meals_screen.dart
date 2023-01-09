import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';
import '../providers/meal.dart';
import '../providers/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals; //! TODO: reomve this!!!
  const CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    final displayedMeal = Provider.of<Meals>(context, listen: false)
        .items
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider<Meal>(
            create: (_) => displayedMeal[index],
            child: MealItem(
              meal: displayedMeal[index],
              // id: displayedMeal[index].id,
              // title: displayedMeal[index].title,
              // imageUrl: displayedMeal[index].imageUrl,
              // duration: displayedMeal[index].duration,
              // complexity: displayedMeal[index].complexity,
              // affordability: displayedMeal[index].affordability,
              // removeItem: _removeMeal,
            ),
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
