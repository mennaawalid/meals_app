import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'title_widget.dart';

class StepsTitleAndList extends StatelessWidget {
  final Meal mealData;
  const StepsTitleAndList({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TitleWidget('Steps'),
        SizedBox(
          width: double.infinity,
          height: mediaQuery.height * 0.28,
          child: ListView.separated(
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(mealData.steps[index]),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text('${(index + 1)}'),
                ),
              );
            }),
            itemCount: mealData.steps.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
