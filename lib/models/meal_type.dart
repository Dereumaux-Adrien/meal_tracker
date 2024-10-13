/// MealType are the different types of meals
enum MealType {
  /// Breakfast
  breakfast,

  /// Lunch
  lunch,

  /// Dinner
  dinner,

  /// Snack
  snack,
}

/// Extension used to translate MealType to strings to simplify the database
extension MealTypeToString on MealType? {
  /// Gets the string from the MarkerColors, used to save in database
  String get string {
    switch (this) {
      case MealType.breakfast:
        return 'Breakfast';
      case MealType.lunch:
        return 'Lunch';
      case MealType.dinner:
        return 'Dinner';
      case MealType.snack:
        return 'Snack';
      default:
        return 'Snack';
    }
  }
}

/// Gets the MealType from a String, used to retrieve from database
MealType mealTypeFromString(String? string) {
  switch (string) {
    case 'Breakfast':
      return MealType.breakfast;
    case 'Lunch':
      return MealType.lunch;
    case 'Dinner':
      return MealType.dinner;
    case 'Snack':
      return MealType.snack;
    default:
      return MealType.snack;
  }
}

/// Gets all the MealType as a list used to condensate the code
List<MealType> listMealTypes = [
  MealType.breakfast,
  MealType.lunch,
  MealType.dinner,
  MealType.snack,
];
