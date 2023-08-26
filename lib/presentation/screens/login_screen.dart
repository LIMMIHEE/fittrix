import 'package:fittrix/presentation/colors.dart';
import 'package:fittrix/presentation/common/utils.dart';
import 'package:fittrix/presentation/provider/login_provider.dart';
import 'package:fittrix/presentation/widgets/common_widget.dart';
import 'package:fittrix/presentation/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    pwController.addListener(textFieldOnChanged);
    super.initState();
  }

  @override
  void dispose() {
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFieldRow(
                icon: Icons.vpn_key_outlined,
                hintText: "비밀번호",
                controller: pwController,
              ),
            ),
            BottomButton(
              text: "로그인",
              onTap: completeButtonOnTap,
              backgroundColor: completeCheck() ? mainColor : gray,
            ),
          ],
        ),
      ),
    );
  }

  bool completeCheck() {
    return pwController.text.isNotEmpty;
  }

  void textFieldOnChanged() {
    if (completeCheck()) {
      setState(() {});
    }
  }

  void completeButtonOnTap() {
    if (!completeCheck()) {
      Utils.showSnackBar(context, "비밀번호를 입력해주세요.");
    } else {
      context
          .read<LoginProvider>()
          .checkLogin(pwController.text)
          .then((isLogin) {
        if (isLogin) {
          Navigator.pop(context, true);
        } else {
          Utils.showSnackBar(context, '유효한 비밀번호가 아닙니다.');
        }
      });
    }
  }
}
