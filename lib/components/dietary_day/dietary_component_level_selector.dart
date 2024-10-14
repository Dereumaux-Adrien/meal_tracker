import 'package:flutter/material.dart';
import 'package:meal_tracker/components/dietary_day/dietary_component.dart';
import 'package:meal_tracker/models/dietary_component_level.dart';

/// Widget allowing the selection of a DietaryComponentLevel
class DietaryComponentLevelSelector extends StatefulWidget {
  /// The name of the Dietary Component
  final String dietaryComponentTitle;

  /// The DietaryComponent on which this Widget is based
  final DietaryComponentLevel dietaryComponentLevel;

  /// Constructor
  const DietaryComponentLevelSelector({
    super.key,
    required this.dietaryComponentLevel,
    required this.dietaryComponentTitle,
  });

  @override
  State<DietaryComponentLevelSelector> createState() =>
      _DietaryComponentLevelSelectorState();
}

class _DietaryComponentLevelSelectorState
    extends State<DietaryComponentLevelSelector> {
  Set<DietaryComponentLevel> _segmentedButtonSelection =
      <DietaryComponentLevel>{DietaryComponentLevel.low};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                widget.dietaryComponentTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        SegmentedButton<DietaryComponentLevel>(
          multiSelectionEnabled: false,
          emptySelectionAllowed: false,
          showSelectedIcon: false,expandedInsets: EdgeInsets.all(10),
          selected: _segmentedButtonSelection,
          onSelectionChanged: (Set<DietaryComponentLevel> newSelection) {
            setState(() {
              _segmentedButtonSelection = newSelection;
            });
          },
          segments: [
            ButtonSegment<DietaryComponentLevel>(
              value: DietaryComponentLevel.low,
              label: Text(DietaryComponentLevel.low.string),
            ),
            ButtonSegment<DietaryComponentLevel>(
              value: DietaryComponentLevel.medium,
              label: Text(DietaryComponentLevel.medium.string),
            ),
            ButtonSegment<DietaryComponentLevel>(
              value: DietaryComponentLevel.high,
              label: Text(DietaryComponentLevel.high.string),
            ),
          ],
        ),
      ],
    );
  }
}
