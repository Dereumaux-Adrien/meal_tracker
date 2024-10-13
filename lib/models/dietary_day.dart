import 'meal.dart';

/// A day taken by the user
class DietaryDay {
  /// List of meals taken in the day
  final Meal? breakfast;
  final Meal? lunch;
  final Meal? dinner;
  final Meal? snack;

  /// Constructor
  DietaryDay({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.snack,
  });

  /// Allows updating the entity by returning the updated version
  DietaryDay copyWith({
    Meal? breakfast,
    Meal? lunch,
    Meal? dinner,
    Meal? snack,
  }) {
    return DietaryDay(
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
      snack: snack ?? this.snack,
    );
  }

  /// Parses the class to JSON format
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'breakfast': breakfast.toString,
      'lunch': lunch.toString,
      'dinner': dinner.toString,
      'snack': snack.toString
    };
  }

  /// To parse from JSON format
  factory DietaryDay.fromJson(Map<String, dynamic> json) {
    return DietaryDay(
      breakfast: Meal.fromJson(json['breakfast']),
      lunch: Meal.fromJson(json['lunch']),
      dinner: Meal.fromJson(json['dinner']),
      snack: Meal.fromJson(json['snack']),
    );
  }

  @override
  String toString() {
    return 'DietaryDay { breakfast: ${breakfast.toString()}, lunch: ${lunch.toString()}, dinner: ${dinner.toString()}, snack: ${snack.toString()} }';
  }
}
