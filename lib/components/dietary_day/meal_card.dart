import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/blocs/dietary_day/dietary_day_cubit.dart';
import 'package:meal_tracker/models/meal.dart';

import 'dietary_component.dart';
import '../dietary_day_drawer/meal_bottom_sheet.dart';

/// Widget oShowing an already created meal
class MealCard extends StatelessWidget {
  /// The id that the meal is saved at in the list
  final int listId;

  /// The Meal on which this Widget is based
  final Meal meal;

  /// Constructor
  const MealCard({
    super.key,
    required this.meal,
    required this.listId,
  });

  @override
  Widget build(BuildContext context) {
    final dietaryCubit = BlocProvider.of<DietaryDayCubit>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return MealBottomSheet(
                meal: meal,
                returnNewMeal: (newMeal) =>
                    dietaryCubit.updateMeal(listId: listId, meal: newMeal),
              );
            },
          );
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
