import 'package:flutter/material.dart';

import 'package:menu_ap/models/meal.dart';
import 'package:menu_ap/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  // final String categoryId;
  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: categoryMeals.isEmpty
          ? Center(
              child: Text(
              "Ahhh such empty!",
              style: Theme.of(context).textTheme.subtitle1,
            ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    duration: categoryMeals[index].duration,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability);
              },
              itemCount: categoryMeals.length,
            ),
    );
  }
}
