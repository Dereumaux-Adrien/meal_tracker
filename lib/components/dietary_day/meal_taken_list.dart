import 'package:flutter/material.dart';
import 'package:meal_tracker/components/dietary_day/meal_card.dart';
import 'package:meal_tracker/models/meal.dart';

/// Widget containing our list of meals that were added by the user
class MealTakenList extends StatelessWidget {
  final List<Meal> mealTakenList;

  const MealTakenList({super.key, required this.mealTakenList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealTakenList.length,
      itemBuilder: (context, index) {
        final mealTaken = mealTakenList[index];

        return MealCard(meal: mealTaken);
      },
    );
  }
}
