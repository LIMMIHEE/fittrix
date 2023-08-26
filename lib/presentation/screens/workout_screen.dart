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
    final workouts =
        context.select((WorkoutProvider provider) => provider.workouts);

    return Scaffold(
      body: SingleChildScrollView(
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
