import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:clean_workout/models/workout.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  var currentDayWorkouts = <Workout>[Workout("Pushups", 3, 10, 0)];

  void addWorkout(Workout workout) {
    currentDayWorkouts.add(workout);
  }

  void resetWorkouts() {
    currentDayWorkouts = [];
  }
}
