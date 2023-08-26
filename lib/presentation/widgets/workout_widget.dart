import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Text(
              DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(workout.createTime)),
              style: const TextStyle(
                color: mainBlack,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: Text(
              workout.message,
              style: const TextStyle(
                color: mainBlack,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
