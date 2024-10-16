import 'package:flutter/material.dart';
import 'package:meal_tracker/models/dietary_component_level.dart';

/// Widget showing a Dietary Component and its Level
class DietaryComponent extends StatelessWidget {
  /// The name of the Dietary Component
  final String dietaryComponentTitle;

  /// The DietaryComponentLevel
  final DietaryComponentLevel dietaryComponentLevel;

  /// Constructor
  const DietaryComponent({
    super.key,
    required this.dietaryComponentTitle,
    required this.dietaryComponentLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          dietaryComponentTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 8, 8, 8),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              dietaryComponentLevel.string,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
