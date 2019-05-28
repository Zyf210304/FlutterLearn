import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/constant/Constant.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/utils/ToastUtils.dart';
import 'package:hu_bei_e_car/utils/StringUtils.dart';
import 'package:hu_bei_e_car/utils/CustomRouteUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RegisterPage.dart';
import 'ModifyPasswordPage.dart';
import 'package:hu_bei_e_car/pages/MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var _phone;
  var _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF4A4A4A),
        ),
        title: Text(
          "登录",
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: ScreenAdaptUtils.px(36),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                child: Icon(
                  Icons.home,
                  size: ScreenAdaptUtils.px(148),
                ),
                padding: EdgeInsets.only(top: ScreenAdaptUtils.px(50)),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: ScreenAdaptUtils.px(50),
                      left: ScreenAdaptUtils.px(100),
                      right: ScreenAdaptUtils.px(100)),
                  width: MediaQuery.of(context).size.width,
                  height: ScreenAdaptUtils.px(90),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      hintText: "请输入手机号码",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (text) {
                      setState(() => _phone = text);
                    },
                  )),
              Padding(
                child: Divider(
                  height: ScreenAdaptUtils.onePX(),
                  color: Color(0xFFE5E5E5),
                ),
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(100),
                  right: ScreenAdaptUtils.px(100),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(60),
                    left: ScreenAdaptUtils.px(100),
                    right: ScreenAdaptUtils.px(100)),
                width: MediaQuery.of(context).size.width,
                height: ScreenAdaptUtils.px(90),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    hintText: "请输入密码",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onChanged: (text) {
                    setState(() => _password = text);
                  },
                ),
              ),
              Padding(
                child: Divider(
                  height: ScreenAdaptUtils.onePX(),
                  color: Color(0XFFE5E5E5),
                ),
                padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(100),
                    right: ScreenAdaptUtils.px(100)),
              ),
              loginButton(context, _phone, _password),
              Padding(
                padding: EdgeInsets.only(top: ScreenAdaptUtils.px(100)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, Translate(ModifyPasswordPage()));
                      },
                      child: Text(
                        '忘记密码?',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: ScreenAdaptUtils.px(26),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        '快速注册',
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(26),
                          color: Color(0xFF196FD5),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, Translate(RegisterPage()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget loginButton(BuildContext context, String phone, String password) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: ScreenAdaptUtils.px(88),
    margin: EdgeInsets.only(
        top: ScreenAdaptUtils.px(100),
        left: ScreenAdaptUtils.px(30),
        right: ScreenAdaptUtils.px(30)),
    child: new FlatButton(
      child: Text(
        "登录",
        style: TextStyle(
          fontSize: ScreenAdaptUtils.px(36),
          color: Colors.white,
        ),
      ),
      color: Color(0xFF196FD5),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenAdaptUtils.px(6)),
        ),
      ),
      onPressed: () {
        if (StringUtils.isEmpty(phone)) {
          ToastUtils.showToast("手机号码不能为空");
          return;
        }
        if (StringUtils.isEmpty(password)) {
          ToastUtils.showToast("密码不能为空");
          return;
        }

        SharedPreferences.getInstance().then((sharedPrefs) {
          sharedPrefs.setBool(Constant.IS_LOGIN, true);
          Navigator.pushAndRemoveUntil(
            context,
            Translate(MainPage()),
            (router) => router == null,
          );
        });
      },
    ),
  );
}
