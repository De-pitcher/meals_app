import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../providers/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  
  final List<Meal> availableMeals; //! TODO: reomve this!!!
  const CategoryMealsScreen(
      this.availableMeals,
      {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Consumer<Meals>(
        builder: (ctx, meals, _) => ListView.builder(
          itemBuilder: (ctx, index) {
            final displayedMeal = meals.items
                .where(
                  (meal) => meal.categories.contains(categoryId),
                )
                .toList();
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
              // removeItem: _removeMeal,
            );
          },
          itemCount: meals.items.length,
        ),
      ),
    );
  }
}
