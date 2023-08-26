import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/domain/entities/workout.dart';
import 'package:fittrix/presentation/colors.dart';
import 'package:fittrix/presentation/common/utils.dart';
import 'package:fittrix/presentation/provider/workout_provider.dart';
import 'package:fittrix/presentation/widgets/common_widget.dart';
import 'package:fittrix/presentation/widgets/workout_write_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutWriteScreen extends StatefulWidget {
  const WorkoutWriteScreen(this.exercise, {super.key});

  final Exercise exercise;

  @override
  State<WorkoutWriteScreen> createState() => _WorkoutWriteScreenState();
}

class _WorkoutWriteScreenState extends State<WorkoutWriteScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    messageController.addListener(textFieldOnChanged);
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,
          title: Text(
            '${widget.exercise.name} 기록하기',
            style: const TextStyle(
              color: mainBlack,
            ),
          ),
          backgroundColor: white),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              color: const Color(0xffEEEEEE),
              child: Column(
                children: [
                  WorkoutImageLayout(exercise: widget.exercise),
                  WorkoutWriteLayout(messageController: messageController),
                ],
              ),
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            child: BottomButton(
              text: "완료",
              onTap: completeButtonOnTap,
              backgroundColor: completeCheck() ? mainColor : gray,
            ),
          ),
        ],
      ),
    );
  }

  bool completeCheck() {
    return messageController.text.isNotEmpty;
  }

  void textFieldOnChanged() {
    if (completeCheck()) {
      setState(() {});
    }
  }

  void completeButtonOnTap() {
    if (!completeCheck()) {
      Utils.showSnackBar(context, "기록사항을 입력해주세요.",
          margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 24));
    } else {
      final newWorkout = Workout(
        createTime: DateTime.now().toString(),
        exerciseType: widget.exercise.name,
        message: messageController.text,
      );

      context.read<WorkoutProvider>().postWorkout(newWorkout).then((value) {
        Utils.showSnackBar(context, '저장되었습니다.');
        Navigator.pop(context, true);
      });
    }
  }
}
