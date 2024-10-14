import 'package:flutter/material.dart';
import 'package:meal_tracker/models/meal.dart';

import 'dietary_component.dart';

/// Widget oShowing an already created meal
class MealCard extends StatelessWidget {
  /// The Meal on which this Widget is based
  final Meal meal;

  /// Constructor
  const MealCard({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () {
          // Todo: edit this meal
          // Navigator.pushNamed(
          //   context,
          //   MarkerDataEditorScreen.route,
          //   arguments: markerData,
          // );
        },
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.mealType.string,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  DietaryComponent(
                    dietaryComponentTitle: "Fat",
                    dietaryComponentLevel: meal.fatLevel,
                  ),
                  DietaryComponent(
                    dietaryComponentTitle: "Sugar",
                    dietaryComponentLevel: meal.sugarLevel,
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
