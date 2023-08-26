import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/domain/repositories/exercise_api_repositories.dart';

class GetExerciseUseCase {
  ExerciseApiRepository repository;

  GetExerciseUseCase(this.repository);

  Future<List<Exercise>> call() async {
    final result = await repository.fetch();

    return result;
  }
}
