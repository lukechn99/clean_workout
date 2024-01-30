import 'package:clean_workout/components/click_input_card.dart';
import 'package:flutter/material.dart';
import 'package:clean_workout/models/workout.dart';

class WorkoutTile extends StatefulWidget {
  const WorkoutTile({
    super.key,
    required this.workout,
  });

  final Workout workout;

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  bool _workoutTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tileStyle = theme.textTheme.labelLarge!.copyWith(
      color: theme.colorScheme.onBackground,
    );
    // final subTileStyle = theme.textTheme.bodyMedium!
    //     .copyWith(color: theme.colorScheme.onPrimary);

    return ExpansionTile(
      title: Text(widget.workout.name, style: tileStyle),
      backgroundColor: theme.colorScheme.primaryContainer,
      collapsedBackgroundColor: theme.colorScheme.primaryContainer,
      trailing: Icon(
        _workoutTileExpanded
            ? Icons.arrow_drop_down_circle
            : Icons.arrow_drop_down,
      ),
      children: <Widget>[
        ClickInputCard(description: 'Recommended sets: ${widget.workout.sets}'),
        ClickInputCard(description: 'Recommended reps: ${widget.workout.reps}'),
        ClickInputCard(
            description: 'Recommended weight: ${widget.workout.weight}')
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          _workoutTileExpanded = expanded;
        });
      },
    );
  }
}
