import 'package:fittrix/data/repositories/workout_api_repository_impl.dart';
import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/domain/usecases/post_workout_use_case.dart';
import 'package:fittrix/presentation/provider/workout_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test Workout provider', () {
    test('test for Workout setType', () {
      final workoutProvider = WorkoutProvider();

      workoutProvider.setType('런지');
      expect(workoutProvider.type, '런지');
    });

    test('test for post Workout', () async {
      PostWorkoutUseCase postWorkoutUseCase =
          PostWorkoutUseCase(WorkoutApiRepositoryImpl());

      final workout = Workout(
        message: '',
        exerciseType: 'mockType',
      );

      final postWorkout = await postWorkoutUseCase.call(workout);

      expect(postWorkout.exerciseType, workout.exerciseType);
    });
  });
}
