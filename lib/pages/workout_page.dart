import 'package:flutter/material.dart';
import 'package:clean_workout/components/workout_tile.dart';
import 'package:clean_workout/states/app_state.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var workouts = appState.currentDayWorkouts;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Here are today\'s workouts')),
          SizedBox(width: 10),
          for (var workout in workouts) WorkoutTile(workout: workout),
          SizedBox(width: 10),
          ElevatedButton.icon(
              onPressed: () {
                print('save workout');
              },
              icon: Icon(Icons.arrow_right_rounded),
              label: Text('Finish Workout'))
        ],
      ),
    );
  }
}
