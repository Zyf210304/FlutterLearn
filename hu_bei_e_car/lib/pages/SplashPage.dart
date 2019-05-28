import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/constant/Constant.dart';
import 'package:hu_bei_e_car/pages/MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/LoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    var duration = Duration(milliseconds: 1500);
    new Future.delayed(duration, () => _intentPage());
    super.initState();
  }

  void _intentPage() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      bool isLogin = sharedPrefs.getBool(Constant.IS_LOGIN);
      isLogin = isLogin == null ? false : isLogin;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => isLogin ? MainPage() : LoginPage()),
          (router) => router == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Text("SplashPage"),
    ));
  }
}
