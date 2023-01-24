import 'package:flutter/Material.dart';

import '../models/meal.dart';
import 'title_widget.dart';

class IngredientsTitleAndList extends StatelessWidget {
  final Meal mealData;
  const IngredientsTitleAndList({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TitleWidget('Ingredients'),
        SizedBox(
          width: double.infinity,
          height: mediaQuery.orientation == Orientation.landscape
              ? mediaQuery.size.height * 0.09
              : mediaQuery.size.height * 0.07,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 4,
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: EdgeInsets.all(
                    mediaQuery.size.height * 0.012,
                  ),
                  child: Text(
                    mealData.ingredients[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              );
            }),
            itemCount: mealData.ingredients.length,
          ),
        ),
      ],
    );
  }
}
