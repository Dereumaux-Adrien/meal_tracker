import 'package:flutter/material.dart';
import 'package:meal_tracker/models/meal.dart';

import 'dietary_component_level_selector.dart';

/// Widget showing a meal to select its components
class MealBottomSheet extends StatelessWidget {
  /// The existing Meal on which this Widget is based
  final Meal meal;

  /// Function used to update the DietaryLevel
  final Function(Meal newMeal) returnNewMeal;

  /// Constructor
  const MealBottomSheet({
    super.key,
    required this.meal,
    required this.returnNewMeal,
  });

  @override
  Widget build(BuildContext context) {
    var fatLevel = meal.fatLevel;
    var sugarLevel = meal.sugarLevel;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              meal.mealType.string,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        DietaryComponentLevelSelector(
          dietaryComponentTitle: "Fat",
          dietaryComponentLevel: meal.fatLevel,
          returnNewDietaryLevel: (DietaryComponentLevel newLevel) {
            fatLevel = newLevel;
          },
        ),
        DietaryComponentLevelSelector(
          dietaryComponentTitle: "Sugar",
          dietaryComponentLevel: meal.sugarLevel,
          returnNewDietaryLevel: (DietaryComponentLevel newLevel) {
            sugarLevel = newLevel;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  returnNewMeal(
                    meal.copyWith(
                      fatLevel: fatLevel,
                      sugarLevel: sugarLevel,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
