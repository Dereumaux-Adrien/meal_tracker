import 'dart:convert';

import 'package:intl/intl.dart';

import 'meal.dart';

/// A day taken by the user
class DietaryDay {
  /// Date to identify the day
  final String date;

  /// List of meals taken in the day
  final List<Meal> mealList;

  /// Constructor
  DietaryDay({
    String? date,
    List<Meal>? mealList,
  })  : date = date ?? DateFormat('yyyy-MM-dd').format(DateTime.now()),
        mealList = mealList ?? List<Meal>.empty();

  /// Allows updating the entity by returning the updated version
  DietaryDay copyWith({
    String? date,
    List<Meal>? mealList,
  }) {
    return DietaryDay(
      date: date ?? this.date,
      mealList: mealList ?? this.mealList,
    );
  }

  /// Parses the class to JSON format
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'mealList': jsonEncode(mealList),
    };
  }

  /// To parse from JSON format
  factory DietaryDay.fromJson(Map<String, dynamic> json) {
    var l = jsonDecode(json['mealList'] as String) as Iterable?;
    var meals = <Meal>[];
    if (l != null && l.toList().isNotEmpty) {
      l.toList().forEach((dynamic mealJson) {
        meals.add(Meal.fromJson(mealJson as Map<String, dynamic>));
      });
    }

    return DietaryDay(
      date: json['date'],
      mealList: meals,
    );
  }

  @override
  String toString() {
    return 'DietaryDay { date: $date, mealList: ${mealList.toString()} }';
  }
}
