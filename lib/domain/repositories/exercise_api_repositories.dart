import 'package:fittrix/domain/entities/exercise.dart';

abstract class ExerciseApiRepository {
  Future<List<Exercise>> fetch();
}
