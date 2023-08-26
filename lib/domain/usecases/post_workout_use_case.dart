import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/domain/repositories/workout_api_repositories.dart';

class PostWorkoutUseCase {
  WorkoutApiRepository repository;

  PostWorkoutUseCase(this.repository);

  Future<Workout> call(Workout workout) async {
    final result = await repository.post(workout);

    return result;
  }
}
