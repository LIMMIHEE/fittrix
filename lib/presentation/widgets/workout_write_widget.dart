import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/presentation/colors.dart';
import 'package:flutter/material.dart';

class WorkoutWriteLayout extends StatelessWidget {
  const WorkoutWriteLayout({super.key, required this.messageController});

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(18),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: white),
      child: Column(
        children: [
          const Row(
            children: [
              Text('기록',
                  style: TextStyle(
                    color: mainBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  '필수입력',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 18),
            constraints: const BoxConstraints(minHeight: 150),
            decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                  hintText: '운동에 대한 기록을 적어주세요.',
                  hintStyle: TextStyle(color: Color(0xB26E6E6E)),
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}

class WorkoutImageLayout extends StatelessWidget {
  const WorkoutImageLayout({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 250),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(exercise.imageUrl, loadingBuilder:
                (_, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, fit: BoxFit.fill),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 40, right: 24),
          child: Text(
            exercise.imageCopyright,
            style: const TextStyle(color: Colors.black45),
          ),
        )
      ],
    );
  }
}
