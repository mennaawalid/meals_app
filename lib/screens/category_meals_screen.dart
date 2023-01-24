// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  static const routeName = '/category-meals-screen';
  const CategoryMealsScreen({
    super.key,
    required this.availableMeals,
  });

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = '';
  List<Meal> displayedMeals = [];

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'] ?? '';
    categoryTitle = routeArguments['title'] ?? '';
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: displayedMeals[i].id,
              title: displayedMeals[i].title,
              imageUrl: displayedMeals[i].imageUrl,
              affordability: displayedMeals[i].affordability,
              duration: displayedMeals[i].duration,
              complexity: displayedMeals[i].complexity,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
