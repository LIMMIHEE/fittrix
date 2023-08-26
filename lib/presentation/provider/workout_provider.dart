import 'package:fittrix/data/repositories/workout_api_repository_impl.dart';
import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/domain/usecases/get_workout_use_case.dart';
import 'package:fittrix/domain/usecases/post_workout_use_case.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  String _selectType = '';

  List<Workout> get workouts => _workouts;
  String get type => _selectType;

  void setType(String type) {
    _selectType = type;

    notifyListeners();
  }

  Future<void> getWorkout() async {
    GetWorkoutUseCase getWorkoutUseCase =
        GetWorkoutUseCase(WorkoutApiRepositoryImpl());

    getWorkoutUseCase.call().then((result) {
      result.sort((b, a) => a.createTime.compareTo(b.createTime));
      _workouts = [...result];
      notifyListeners();
    });
  }

  Future<void> postWorkout(Workout workout) async {
    PostWorkoutUseCase postWorkoutUseCase =
        PostWorkoutUseCase(WorkoutApiRepositoryImpl());

    postWorkoutUseCase.call(workout).then((result) {
      final newWorkouts = [..._workouts, result];
      newWorkouts.sort((b, a) => a.createTime.compareTo(b.createTime));
      _workouts = newWorkouts;
      notifyListeners();
    });
  }
}
