/// DietaryComponentLevel are the levels of different groups included in the diet
enum DietaryComponentLevel {
  /// Low quantity of the dietary group
  low,

  /// Medium quantity of the dietary group
  medium,

  /// High quantity of the dietary group
  high,
}

/// Extension used to translate DietaryComponentLevel to strings to simplify the database
extension DietaryComponentLevelToString on DietaryComponentLevel? {
  /// Gets the string from the MarkerColors, used to save in database
  String get string {
    switch (this) {
      case DietaryComponentLevel.low:
        return 'Low';
      case DietaryComponentLevel.medium:
        return 'Medium';
      case DietaryComponentLevel.high:
        return 'High';
      default:
        return 'Low';
    }
  }
}

/// Gets the DietaryComponentLevel from a String, used to retrieve from database
DietaryComponentLevel dietaryComponentLevelFromString(String? string) {
  switch (string) {
    case 'Low':
      return DietaryComponentLevel.low;
    case 'Medium':
      return DietaryComponentLevel.medium;
    case 'High':
      return DietaryComponentLevel.high;
    default:
      return DietaryComponentLevel.low;
  }
}

/// Gets all the DietaryComponentLevel as a list used to condensate the code
List<DietaryComponentLevel> listDietaryComponentLevels = [
  DietaryComponentLevel.low,
  DietaryComponentLevel.medium,
  DietaryComponentLevel.high,
];
