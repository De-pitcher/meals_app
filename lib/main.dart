import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';
import './providers/categories.dart';
import './providers/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Categories>(
          create: (_) => Categories(),
        ),
        ChangeNotifierProvider<Meals>(
          create: (_) => Meals(),
        ),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primaryColor: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
        ),
        // home: const CategoriesScreen(),
        routes: {
          '/': (_) => const TabsScreen(),
          CategoryMealsScreen.routeName: (_) => const CategoryMealsScreen(),
          MealDetailScreen.routeName: (_) => const MealDetailScreen(),
          FiltersScreen.routeName: (_) => const FiltersScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => const CategoryMealsScreen(),
          );
        },
      ),
    );
  }
}
