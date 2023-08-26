import 'dart:convert';

import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/presentation/provider/exercise_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const exerciseMockJson = '[{"name":"런지",'
      '"imageUrl":"https://mirim-hee.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F11fb86ea-c4f2-490d-a5fa-1bda8a2751d6%2FUntitled.png?table=block&id=a096aea4-567d-45fd-bd95-9156b1322129&spaceId=ea1ae92d-c8f2-433f-a828-fcf19bb0da46&width=2000&userId=&cache=v2",'
      '"imageCopyright":"Freepik - drobotdean 작가","id":"1"},'
      '{"name":"스쿼트","imageUrl":"https://mirim-hee.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9cfc4da5-77a5-4ab5-ba8d-751cec4ffe7f%2FUntitled.png?table=block&id=310b5f85-aae4-48bd-af99-1a4ad27dcfb0&spaceId=ea1ae92d-c8f2-433f-a828-fcf19bb0da46&width=2000&userId=&cache=v2",'
      '"imageCopyright":"Freepik - drobotdean 작가","id":"2"},'
      '{"name":"푸시업","imageUrl":"https://mirim-hee.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff9812ac9-701b-4280-895d-2645ec59ee50%2FUntitled.png?table=block&id=80bca716-f0a1-42e8-a527-ead301ff96a7&spaceId=ea1ae92d-c8f2-433f-a828-fcf19bb0da46&width=2000&userId=&cache=v2",'
      '"imageCopyright":"Freepik - drobotdean 작가","id":"3"},'
      '{"name":"레그 레이즈","imageUrl":"https://mirim-hee.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5548b98f-2c37-4da6-b3b9-9629e87d0a86%2FUntitled.png?table=block&id=f15297b2-b7d4-42f3-8e32-a182f3863d3d&spaceId=ea1ae92d-c8f2-433f-a828-fcf19bb0da46&width=2000&userId=&cache=v2",'
      '"imageCopyright":"Freepik - valuavitaly 작가","id":"4"}]';

  group('test exercise provider', () {
    test('test for get Workout', () {
      final exerciseProvider = ExerciseProvider();
      exerciseProvider.getExercise();

      final mock = jsonDecode(exerciseMockJson)
          .map((dynamic i) => Exercise.fromJson(i as Map<String, dynamic>))
          .toList();

      Future.delayed(const Duration(milliseconds: 500), () {
        expect(exerciseProvider.exercises, mock);
      });
    });
  });
}
