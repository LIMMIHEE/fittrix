import 'package:fittrix/domain/entities/exercise.dart';
import 'package:fittrix/presentation/colors.dart';
import 'package:fittrix/presentation/common/utils.dart';
import 'package:fittrix/presentation/provider/exercise_provider.dart';
import 'package:fittrix/presentation/provider/login_provider.dart';
import 'package:fittrix/presentation/provider/video_provider.dart';
import 'package:fittrix/presentation/screens/login_screen.dart';
import 'package:fittrix/presentation/screens/video_screen.dart';
import 'package:fittrix/presentation/screens/workout_screen.dart';
import 'package:fittrix/presentation/screens/workout_write_screen.dart';
import 'package:fittrix/presentation/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bucket = PageStorageBucket();

  // 실질적 화면은 2가지
  // 운동 기록 리스트와 영상 재생 화면
  List<Widget> screens = [const WorkoutScreen(), const VideoScreen()];

  bool exerciseVisible = false;
  int currentTab = 2;

  @override
  void initState() {
    context.read<ExerciseProvider>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin =
        context.select((LoginProvider provider) => provider.isLogin);
    final exercises =
        context.select((ExerciseProvider provider) => provider.exercises);

    return Scaffold(
      body: Stack(
        children: [
          PageStorage(
            bucket: bucket,
            child: screens[currentTab == 1 ? 0 : 1],
          ),
          Visibility(
            visible: exerciseVisible,
            child: ExerciseListLayout(
              exercises: exercises,
              itemTap: workoutWriteNavigator,
            ),
          )
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          const Divider(
            height: 1,
            color: Colors.black45,
          ),
          BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (value) => bottomNavigationOnTap(value, isLogin),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              for (int index = 0; index < 3; index++)
                BottomNavigationBarItem(
                    icon: BottomNavigatorItem(
                      isCurrentTab: index == currentTab,
                      text: tabLabel(index),
                    ),
                    label: '')
            ],
          ),
        ],
      ),
    );
  }

  String tabLabel(int index) {
    switch (index) {
      case 0:
        return '운동 기록\n하기';
      case 1:
        return '운동 기록\n보기';
      case 2:
        return '로그인';
    }

    return '로그인';
  }

  void bottomNavigationOnTap(int index, bool isLogin) {
    if (index != 2 && !isLogin) {
      Utils.showSnackBar(context, "로그인 후 이용가능합니다.");
    } else if (!isLogin) {
      loginNavigator();
    } else {
      setState(() {
        if (index == 1) {
          context.read<VideoProvider>().pauseVideo();
        } else {
          context.read<VideoProvider>().playVideo();
        }

        if (index == 2) {
          Utils.showSnackBar(context, "로그인 상태입니다.");
        }

        exerciseVisible = index == 2
            ? false
            : (index == currentTab)
                ? !exerciseVisible
                : true;
        currentTab = index;
      });
    }
  }

  Future<void> workoutWriteNavigator(Exercise exercise) async {
    if (currentTab == 0) {
      context.read<VideoProvider>().pauseVideo();

      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WorkoutWriteScreen(exercise)));

      if (result != null) {
        setState(() {
          currentTab = 1;
          exerciseVisible = false;
        });
      }
      context.read<VideoProvider>().playVideo();
    }
  }

  Future<void> loginNavigator() async {
    context.read<VideoProvider>().pauseVideo();

    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));

    // 로그인 성공시 운동 기록 화면으로 전환
    if (result != null) {
      setState(() {
        currentTab = 1;
      });
    }
  }
}
