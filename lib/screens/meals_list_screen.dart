import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class MealsListScreen extends StatelessWidget {
  static const String routeName = "/meals-list";
  const MealsListScreen(this.availableMeals, {Key? key}) : super(key: key);

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArguments['title'];
    final categoryID = routeArguments['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    print(categoryMeals);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            )),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
