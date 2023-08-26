import 'package:fittrix/data/data_sources/api_client.dart';
import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/domain/repositories/workout_api_repositories.dart';

class WorkoutApiRepositoryImpl implements WorkoutApiRepository {
  WorkoutApiRepositoryImpl();

  final client = ApiClient();

  @override
  Future<Workout> post(Workout workout) async {
    final _result = await client.dio.fetch<dynamic>(
      client.setStreamType<Workout>(
        client.settingOptions('POST', 'workout', data: workout.toJson()),
      ),
    );

    var value = Workout.fromJson(_result.data!);

    return value;
  }

  @override
  Future<List<Workout>> get() async {
    final _result = await client.dio.fetch<List<dynamic>>(
      client.setStreamType<List<Workout>>(
        client.settingOptions('GET', 'workout'),
      ),
    );

    var value = _result.data!
        .map((dynamic i) => Workout.fromJson(i as Map<String, dynamic>))
        .toList();

    return List<Workout>.from(value);
  }
}
