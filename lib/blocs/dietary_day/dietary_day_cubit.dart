import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meal_tracker/models/dietary_day.dart';
import 'package:meal_tracker/models/meal.dart';
import 'package:meal_tracker/services/hive_storage.dart';

part 'dietary_day_state.dart';

class DietaryDayCubit extends Cubit<DietaryDayState> {
  DietaryDayCubit() : super(DietaryDayLoading());

  /// Starts the loading of the existing saved DietaryDay
  void loadDietaryDay() {
    emit(DietaryDayLoading());
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final dietaryDay =
        HiveStorage().getDietaryDay(date: date) ?? DietaryDay(date: date);
    emit(DietaryDayLoaded(dietaryDay: dietaryDay));
  }

  /// Adds a meal to the DietaryDay
  void addMeal({required Meal meal}) {
    var _state = state;
    if (_state is DietaryDayLoaded) {
      final newMealList = _state.dietaryDay.mealList..add(meal);
      final newDietaryDay = _state.dietaryDay.copyWith(mealList: newMealList);
      emit(DietaryDayLoaded(dietaryDay: newDietaryDay));
    }
  }

  /// Updates a Meal in the DietaryDay
  void updateMeal({required int listId, required Meal meal}) {
    var _state = state;
    if (_state is DietaryDayLoaded) {
      _state.dietaryDay.mealList.replaceRange(listId, listId + 1, [meal]);
      emit(DietaryDayLoaded(dietaryDay: _state.dietaryDay));
    }
  }

  /// Saves the DietaryDietaryDay to the database
  /// Until this is done, reloading will reset the changes
  void saveDietaryDay() {
    var _state = state;
    if (_state is DietaryDayLoaded) {
      HiveStorage().setDietaryDay(dietaryDay: _state.dietaryDay);
    }
  }
}
