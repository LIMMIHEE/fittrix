import 'package:fittrix/presentation/common/pref_util.dart';
import 'package:fittrix/presentation/provider/login_provider.dart';
import 'package:fittrix/presentation/provider/video_provider.dart';
import 'package:fittrix/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => VideoProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '피트릭스 사전과제',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3457DF)),
          fontFamily: 'Pretendard'),
      home: const MainScreen(),
    );
  }
}
