import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/blocs/dietary_day/dietary_day_cubit.dart';
import 'package:meal_tracker/components/dietary_day/meal_bottom_sheet.dart';
import 'package:meal_tracker/models/meal.dart';

/// Widget offering to create a new Meal for the day
class MealAddingCard extends StatelessWidget {
  /// The MealType on which this Widget is based
  final MealType mealType;

  /// Constructor
  const MealAddingCard({
    super.key,
    required this.mealType,
  });

  @override
  Widget build(BuildContext context) {
    final dietaryCubit = BlocProvider.of<DietaryDayCubit>(context);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 0,
        maxHeight: 200.0,
        minWidth: 0,
        maxWidth: 200.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return MealBottomSheet(
                  meal: Meal(mealType: mealType),
                  returnNewMeal: (newMeal) => dietaryCubit.addMeal(newMeal),
                );
              },
            );
          },
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              mealType.string,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              // style: Theme.of(context).textTheme.headline5,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
