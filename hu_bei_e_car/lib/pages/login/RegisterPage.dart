import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hu_bei_e_car/utils/ToastUtils.dart';
import 'package:hu_bei_e_car/utils/StringUtils.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _RegisterPageState();
  }

}

class _RegisterPageState extends State<RegisterPage> {

  var _phone;
  var _validateCode;
  var _password;
  var _validateContent = "发送验证码";
  var _duration = 60;
  var _isClick = false;
  var _timer;

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("注册",
          style: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_left),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.router, size: 25,),
                Flexible(child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入手机号码',
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (text) {
                    setState(() => _phone = text);
                  },
                )),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.router, size: 25,),
                Flexible(child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入验证码',
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (text) {
                    setState(() => _validateCode = text);
                  },
                )),
                FlatButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      // 调用接口，开始倒计时，设置更改文字
                      if (_isClick) return;
                      setState(() {
                        _isClick = true;
                      });

                      print('我执行了');
                      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if (_duration == 0) {
                            _cancelTimer();
                            _duration = 60;
                            _isClick = false;
                            _validateContent = "重新申请";
                          } else {
                            _duration--;
                            _validateContent = "剩余${_duration}s";
                          }
                        });
                      });
                    },
                    child: Text(_validateContent,
                      style: TextStyle(
                          fontSize: 14
                      ),))
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.router, size: 25,),
                Flexible(child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入密码',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    setState(() => _password = text);
                  },
                ))
              ],
            ),
          ),
          Container(
            width: 360,
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(44 * .96))
                ),
                onPressed: () {
                  if (StringUtils.isEmpty(_phone)) {
                    ToastUtils.showToast("手机号码不能为空");
                    return;
                  }
                  if (StringUtils.isEmpty(_validateCode)) {
                    ToastUtils.showToast("验证码不能为空");
                    return;
                  }
                  if (StringUtils.isEmpty(_password)) {
                    ToastUtils.showToast("密码不能为空");
                    return;
                  }
                  print(
                      'phone == $_phone, validateCode == $_validateCode, password == $_password');
                },
                child: Text("注册")),
          ),
        ],
      ),
    );
  }

}
