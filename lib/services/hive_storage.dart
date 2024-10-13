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
  final Box<DietaryDay> dietaryDayBox =
      Hive.box<DietaryDay>(name: "DietaryDayBox");

  /// Adds the DietaryDay to the box
  void setDietaryDay({
    required DietaryDay dietaryDay,
  }) {
    dietaryDayBox.put(dietaryDay.date, dietaryDay);
  }

  /// Gets the DietaryDay
  DietaryDay? getDietaryDay({
    /// Date at the format 'yyyy-MM-dd'
    required String date,
  }) {
    return dietaryDayBox.get(date);
  }
}
