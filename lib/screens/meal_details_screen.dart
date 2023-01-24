import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

import '../widgets/ingredients_title_and_list.dart';
import '../widgets/steps_title_and_list.dart';

class MealsDetailsScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function isFavorite;

  const MealsDetailsScreen(
      {super.key, required this.toggleFavorites, required this.isFavorite});
  static const routeName = '/meals-details-screen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments.toString() ?? '';
    final mealData = dummyMeals.firstWhere((meal) => meal.id == mealId);
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: isLandscape ? screenHeight * 0.5 : screenHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    mealData.imageUrl,
                  ),
                ),
              ),
              // child: Image.network(
              //   mealData.imageUrl,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SizedBox(
              height: isLandscape ? screenHeight * 0.25 : screenHeight * 0.15,
              child: Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(0),
                child: IngredientsTitleAndList(
                  mealData: mealData,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SizedBox(
              height: isLandscape ? screenHeight * 0.40 : screenHeight * 0.35,
              child: StepsTitleAndList(
                mealData: mealData,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          toggleFavorites(mealData.id);
        },
        child: isFavorite(mealData.id)
            ? Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.primary,
              )
            : Icon(Icons.favorite_border,
                color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
