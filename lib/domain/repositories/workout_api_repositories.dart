import 'package:fittrix/domain/entities/workout.dart';

abstract class WorkoutApiRepository {
  Future<Workout> post(Workout workout);

  Future<List<Workout>> get();
}
