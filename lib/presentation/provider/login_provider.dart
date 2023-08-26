import 'package:fittrix/presentation/common/pref_util.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogin = false;

  LoginProvider() {
    setLoginState();
  }

  Future<bool> checkLogin(String pw) async {
    if ('12345' == pw) {
      isLogin = true;
      saveLoginPrefs(pw);
      notifyListeners();
    }

    return isLogin;
  }

  //로그인 정보 저장
  Future<void> saveLoginPrefs(String pw) async {
    await PrefUtil.setBool('Login', true);
  }

  //로그인 정보 가져오기
  Future<void> setLoginState() async {
    isLogin = PrefUtil.getBool('Login');
  }
}
