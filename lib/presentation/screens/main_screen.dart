import 'package:fittrix/presentation/common/utils.dart';
import 'package:fittrix/presentation/provider/login_provider.dart';
import 'package:fittrix/presentation/provider/video_provider.dart';
import 'package:fittrix/presentation/screens/login_screen.dart';
import 'package:fittrix/presentation/screens/video_screen.dart';
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
  List<Widget> screens = [Container(), Container(), const VideoScreen()];

  int currentTab = 2;

  @override
  Widget build(BuildContext context) {
    final isLogin =
        context.select((LoginProvider provider) => provider.isLogin);

    return Scaffold(
      body: Stack(
        children: [
          PageStorage(
            bucket: bucket,
            child: screens[currentTab],
          ),
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
              for (int index = 0; index < screens.length; index++)
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
        currentTab = index;

        if (index == 2) {
          context.read<VideoProvider>().playVideo();
        } else {
          context.read<VideoProvider>().pauseVideo();
        }
      });
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
