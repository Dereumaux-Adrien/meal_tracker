import 'package:flutter/material.dart';
import 'package:meal_tracker/components/dietary_day/dietary_component_level_selector.dart';
import 'package:meal_tracker/models/meal.dart';

/// Widget showing a meal to select its components
class MealBottomSheet extends StatelessWidget {
  /// The Meal on which this Widget is based
  final Meal meal;

  /// Indicates if we are updating a meal (true) or creating a new one (false)
  final bool updating;

  /// Constructor
  const MealBottomSheet({
    super.key,
    required this.meal,
    this.updating = false,
  });

  @override
  Widget build(BuildContext context) {
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
        ),
        DietaryComponentLevelSelector(
          dietaryComponentTitle: "Sugar",
          dietaryComponentLevel: meal.sugarLevel,
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
                child: Icon(Icons.close,
                    color: Theme.of(context).colorScheme.primary),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.check,
                    color: Theme.of(context).colorScheme.onPrimary),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
