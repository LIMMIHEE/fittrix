import 'package:fittrix/presentation/provider/workout_provider.dart';
import 'package:fittrix/presentation/widgets/workout_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final type = context.select((WorkoutProvider provider) => provider.type);
    final workouts = context
        .select((WorkoutProvider provider) => provider.workouts)
        .where(
            (element) => type.isNotEmpty ? element.exerciseType == type : true)
        .toList();

    return Scaffold(
      body: (type.isEmpty || workouts.isEmpty)
          ? Center(
              child: Text(
              type.isEmpty ? "운동 종류를 선택해주세요." : "$type 운동 기록이 존재하지 않습니다.",
              style: const TextStyle(color: Colors.black45),
            ))
          : SingleChildScrollView(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    final workout = workouts[index];

                    return WorkoutListItem(workout: workout);
                  }),
            ),
    );
  }
}
