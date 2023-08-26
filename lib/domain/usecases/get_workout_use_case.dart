import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/domain/repositories/workout_api_repositories.dart';

class GetWorkoutUseCase {
  WorkoutApiRepository repository;

  GetWorkoutUseCase(this.repository);

  Future<List<Workout>> call() async {
    final result = await repository.get();

    return result;
  }
}
