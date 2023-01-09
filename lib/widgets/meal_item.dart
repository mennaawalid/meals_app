import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import '../models/meal.dart';
import 'text_with_icon.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;
  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.duration,
    required this.complexity,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealsDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(screenHeight * 0.018),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height:
                        isLandscape ? screenHeight * 0.6 : screenHeight * 0.35,
                  ),
                ),
                Positioned(
                  bottom: isLandscape ? 10 : 0,
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.06,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5,
                          ),
                        ],
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(
                  isLandscape ? screenWidth * 0.02 : screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWithIcon(
                    icon: Icons.schedule,
                    text: "$duration min",
                  ),
                  TextWithIcon(
                    icon: Icons.work,
                    text: complexity.name,
                  ),
                  TextWithIcon(
                    icon: Icons.attach_money,
                    text: affordability.name,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
