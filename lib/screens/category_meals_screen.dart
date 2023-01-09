// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals-screen';
  const CategoryMealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'] ?? '';
    final categoryTitle = routeArguments['title'] ?? '';
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: categoryMeals[i].id,
              title: categoryMeals[i].title,
              imageUrl: categoryMeals[i].imageUrl,
              affordability: categoryMeals[i].affordability,
              duration: categoryMeals[i].duration,
              complexity: categoryMeals[i].complexity,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
