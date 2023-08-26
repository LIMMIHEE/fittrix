import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/presentation/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigatorItem extends StatelessWidget {
  const BottomNavigatorItem(
      {required this.text, required this.isCurrentTab, super.key});

  final String text;
  final bool isCurrentTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCurrentTab ? mainColor : gray,
        border: Border.all(color: const Color(0xFFA8A8A8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isCurrentTab ? white : mainBlack,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ExerciseListLayout extends StatelessWidget {
  const ExerciseListLayout({
    super.key,
    required this.exercises,
    required this.itemTap,
  });

  final Function(Exercise) itemTap;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      margin: const EdgeInsets.only(bottom: 18),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exercises.length,
          itemBuilder: (BuildContext context, int index) {
            final exercise = exercises[index];
            return GestureDetector(
                onTap: () => itemTap(exercise),
                child: ExerciseListItem(
                    exercise: exercise,
                    isLastItem: index == exercises.length - 1));
          }),
    );
  }
}

class ExerciseListItem extends StatelessWidget {
  const ExerciseListItem(
      {super.key, required this.exercise, required this.isLastItem});

  final Exercise exercise;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      decoration: BoxDecoration(
        color: white,
        border: Border(
            top: const BorderSide(width: 1),
            left: const BorderSide(width: 1),
            right: const BorderSide(width: 1),
            bottom: isLastItem ? const BorderSide(width: 1) : BorderSide.none),
      ),
      child: Text(
        exercise.name,
        style: const TextStyle(
          color: mainBlack,
          fontSize: 16,
        ),
      ),
    );
  }
}
