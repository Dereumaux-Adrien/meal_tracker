import 'package:flutter/material.dart';
import 'package:meal_tracker/models/dietary_component_level.dart';

/// Widget allowing the selection of a DietaryComponentLevel
class DietaryComponentLevelSelector extends StatefulWidget {
  /// The name of the Dietary Component
  final String dietaryComponentTitle;

  /// The DietaryComponent on which this Widget is based
  final DietaryComponentLevel dietaryComponentLevel;

  /// Function used to update the DietaryLevel
  final Function(DietaryComponentLevel newLevel) returnNewDietaryLevel;

  /// Constructor
  const DietaryComponentLevelSelector({
    super.key,
    required this.dietaryComponentLevel,
    required this.dietaryComponentTitle,
    required this.returnNewDietaryLevel,
  });

  @override
  State<DietaryComponentLevelSelector> createState() =>
      _DietaryComponentLevelSelectorState();
}

class _DietaryComponentLevelSelectorState
    extends State<DietaryComponentLevelSelector> {
  /// The existing value of the DietaryComponentLevel we want to set at the init
  late Set<DietaryComponentLevel> _segmentedButtonSelection;

  /// Variable to check if the initialisation has been done.
  /// Without it, the init will be done each time the selection change,
  /// effectively blocking it in the initial state
  bool initialised = false;

  @override
  Widget build(BuildContext context) {
    if (!initialised) {
      _segmentedButtonSelection = <DietaryComponentLevel>{
        widget.dietaryComponentLevel
      };
      initialised = true;
    }
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
          showSelectedIcon: false,
          expandedInsets: const EdgeInsets.all(10),
          selected: _segmentedButtonSelection,
          onSelectionChanged: (Set<DietaryComponentLevel> newSelection) {
            setState(() {
              _segmentedButtonSelection = newSelection;
              widget.returnNewDietaryLevel(newSelection.first);
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
