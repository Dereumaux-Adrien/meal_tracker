import 'package:hive/hive.dart';
import 'package:meal_tracker/models/dietary_day.dart';

/// Background storage based on Hive
class HiveStorage {
  /// Using a singleton to not always recreate a new instance of this class
  /// that was created only for simplicity
  HiveStorage._privateConstructor();

  static final HiveStorage _instance = HiveStorage._privateConstructor();

  /// Default constructor for the singleton
  factory HiveStorage() {
    return _instance;
  }

  /// Hive Box where we store our Dietary Days
  final Box<Map<String, dynamic>> dietaryDayBox =
      Hive.box<Map<String, dynamic>>(name: "DietaryDayBox");

  /// Sets the DietaryDay in the box, can be used for adding and update
  void setDietaryDay({
    required DietaryDay dietaryDay,
  }) {
    dietaryDayBox[dietaryDay.date] = dietaryDay.toJson();
  }

  /// Gets the DietaryDay associated with the date given
  DietaryDay? getDietaryDay({
    /// Date at the format 'yyyy-MM-dd'
    required String date,
  }) {
    final result = dietaryDayBox[date];
    return result != null ? DietaryDay.fromJson(result) : null;
  }
}
