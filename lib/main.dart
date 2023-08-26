import 'package:fittrix/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '피트릭스 사전과제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3457DF)),
          fontFamily: 'Pretendard'
      ),

      home: const MainScreen(),
    );
  }
}
