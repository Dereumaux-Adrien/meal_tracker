part of 'dietary_day_cubit.dart';

abstract class DietaryDayState {
  const DietaryDayState();
}

class DietaryDayLoading extends DietaryDayState {
  @override
  String toString() => 'MealDayLoading';
}

class DietaryDayLoaded extends DietaryDayState {
  /// This state saves the DietaryDay
  final DietaryDay dietaryDay;

  /// Constructor
  const DietaryDayLoaded({required this.dietaryDay});

  @override
  String toString() => 'MealDayLoaded { dietaryDay: $dietaryDay }';
}
