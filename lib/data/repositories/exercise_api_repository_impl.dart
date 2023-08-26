import 'package:fittrix/data/data_sources/api_client.dart';
import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/domain/repositories/exercise_api_repositories.dart';

class ExerciseApiRepositoryImpl implements ExerciseApiRepository {
  ExerciseApiRepositoryImpl();

  final client = ApiClient();

  @override
  Future<List<Exercise>> fetch() async {
    final _result = await client.dio.fetch<List<dynamic>>(
      client.setStreamType<List<Exercise>>(
        client.settingOptions('GET', 'exercise'),
      ),
    );

    var value = _result.data!
        .map((dynamic i) => Exercise.fromJson(i as Map<String, dynamic>))
        .toList();

    return List<Exercise>.from(value);
  }
}
