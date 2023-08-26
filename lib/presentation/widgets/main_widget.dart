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
