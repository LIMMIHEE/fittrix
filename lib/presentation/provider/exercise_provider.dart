import 'package:fittrix/data/repositories/exercise_api_repository_impl.dart';
import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/domain/usecases/get_exercise_use_case.dart';
import 'package:flutter/material.dart';

class ExerciseProvider with ChangeNotifier {
  List<Exercise> _exercises = [];

  List<Exercise> get exercises => _exercises;

  // api 호출
  Future<void> getExercise() async {
    GetExerciseUseCase getExerciseUseCase =
        GetExerciseUseCase(ExerciseApiRepositoryImpl());

    getExerciseUseCase.call().then((result) {
      _exercises = result;
      notifyListeners();
    });
  }
}
