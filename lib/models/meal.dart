import 'package:meal_tracker/models/dietary_component_level.dart';
import 'package:meal_tracker/models/meal_type.dart';

export 'dietary_component_level.dart';
export 'meal_type.dart';

/// A meal taken by the user
class Meal {
  /// Type of meal
  final MealType mealType;

  /// Fat Level
  final DietaryComponentLevel fatLevel;

  /// Sugar Level
  final DietaryComponentLevel sugarLevel;

  /// Constructor
  Meal({
    MealType? mealType,
    DietaryComponentLevel? fatLevel,
    DietaryComponentLevel? sugarLevel,
  })  : mealType = mealType ?? MealType.snack,
        fatLevel = fatLevel ?? DietaryComponentLevel.low,
        sugarLevel = sugarLevel ?? DietaryComponentLevel.low;

  /// Allows updating the entity by returning the updated version
  Meal copyWith(
      {MealType? mealType,
      DietaryComponentLevel? fatLevel,
      DietaryComponentLevel? sugarLevel}) {
    return Meal(
        mealType: mealType ?? this.mealType,
        fatLevel: fatLevel ?? this.fatLevel,
        sugarLevel: sugarLevel ?? this.sugarLevel);
  }

  /// Parses the class to JSON format
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'mealType': mealType.string,
      'fatLevel': fatLevel.string,
      'sugarLevel': sugarLevel.string
    };
  }

  /// To parse from JSON format
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        mealType: mealTypeFromString(json['mealType'] as String?),
        fatLevel: dietaryComponentLevelFromString(json['fatLevel'] as String?),
        sugarLevel:
            dietaryComponentLevelFromString(json['sugarLevel'] as String?));
  }

  @override
  String toString() {
    return 'Meal { mealType: ${mealType.string}, fatLevel: ${fatLevel.string}, sugarLevel: ${sugarLevel.string} }';
  }
}
