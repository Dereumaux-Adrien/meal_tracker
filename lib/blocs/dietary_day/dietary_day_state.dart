part of 'dietary_day_cubit.dart';

/// Abstract of DietaryDayState
abstract class DietaryDayState {
  const DietaryDayState();
}

/// State before the data is loaded
class DietaryDayLoading extends DietaryDayState {
  @override
  String toString() => 'MealDayLoading';
}

/// State after the data is loaded
class DietaryDayLoaded extends DietaryDayState {
  /// This state saves the DietaryDay
  final DietaryDay dietaryDay;

  /// Constructor
  const DietaryDayLoaded({required this.dietaryDay});

  @override
  String toString() => 'MealDayLoaded { dietaryDay: $dietaryDay }';
}
