import 'package:flutter/material.dart';
import 'package:meal_tracker/components/dietary_day/meal_card.dart';
import 'package:meal_tracker/models/meal.dart';

/// Widget containing our list of meals that were added by the user
class MealTakenList extends StatelessWidget {
  /// List of meals to be displayed
  final List<Meal> mealTakenList;

  /// Constructor
  const MealTakenList({
    super.key,
    required this.mealTakenList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealTakenList.length,
      itemBuilder: (context, index) {
        return MealCard(
          listId: index,
          meal: mealTakenList[index],
        );
      },
    );
  }
}
