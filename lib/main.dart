import 'package:flutter/material.dart';
import 'package:meals_app_state_management/screens/categories_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/meals_list_screen.dart';

import './providers/meals_providers.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availabelMeals = dummyMeals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tony Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // initialRoute: '/',
      routes: {
        // '/': (context) => const CategoriesScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        MealsListScreen.routeName: (context) =>
            MealsListScreen(_availabelMeals),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meals App"),
        ),
        body: const CategoriesScreen(),
      ),
    );
  }
}
