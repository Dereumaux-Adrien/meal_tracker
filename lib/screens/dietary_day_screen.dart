import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/blocs/dietary_day/dietary_day_cubit.dart';
import 'package:meal_tracker/components/dietary_day/meal_taken_list.dart';
import 'package:meal_tracker/components/dietary_day/meal_types_offering.dart';
import 'package:meal_tracker/models/meal.dart';

/// Screen displaying the Nutrition, would rename it to Daily Diet if we get one
/// like this for each day
class DietaryDayScreen extends StatelessWidget {
  /// Route to bind to this page
  static const String route = '/dietary_day';

  /// Constructor
  const DietaryDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dietaryDayCubit = DietaryDayCubit();
    dietaryDayCubit.loadDietaryDay();
    return BlocProvider<DietaryDayCubit>(
      create: (context) => dietaryDayCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Nutrition"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MealTypesOffering(),
            Expanded(
              child: BlocBuilder<DietaryDayCubit, DietaryDayState>(
                builder: (context, state) {
                  if (state is DietaryDayLoaded) {
                    return MealTakenList(
                      mealTakenList: state.dietaryDay.mealList,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
