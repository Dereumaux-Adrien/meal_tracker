import 'package:flutter/material.dart';
import 'package:meal_tracker/models/meal.dart';

import 'meal_adding_card.dart';

/// Widget containing our existing list of meal types that can be added
class MealTypesOffering extends StatelessWidget {
  /// Constructor
  const MealTypesOffering({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        children: [
          MealAddingCard(mealType: MealType.breakfast),
          MealAddingCard(mealType: MealType.lunch),
        ],
      ),
      Row(
        children: [
          MealAddingCard(mealType: MealType.dinner),
          MealAddingCard(mealType: MealType.snack),
        ],
      ),
    ]);
  }
}
