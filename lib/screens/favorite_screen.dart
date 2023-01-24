import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  const FavoritesScreen({required this.favMeals, super.key});

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text('You currently have no favorites, start adding some!!'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: favMeals[i].id,
              title: favMeals[i].title,
              imageUrl: favMeals[i].imageUrl,
              affordability: favMeals[i].affordability,
              duration: favMeals[i].duration,
              complexity: favMeals[i].complexity,
            );
          },
        itemCount: favMeals.length,
      );
    }
  }
}
