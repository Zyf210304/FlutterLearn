import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class ReserveSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(context, "预定结果"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenAdaptUtils.px(240),
            color: Color(0xFFFF5454),
            alignment: Alignment.center,
            child: Text(
              "恭喜你，预订成功",
              style: TextStyle(
                fontSize: ScreenAdaptUtils.px(40),
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(40),
              top: ScreenAdaptUtils.px(40),
            ),
            child: Text(
              "温馨提示",
              style: TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold,
                fontSize: ScreenAdaptUtils.px(28),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(40),
              top: ScreenAdaptUtils.px(30),
            ),
            child: Text(
              "购车服务员将会在24小时内与您联系确认购车资格认证",
              style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.bold,
                fontSize: ScreenAdaptUtils.px(24),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF196FD5),
              borderRadius: BorderRadius.circular(ScreenAdaptUtils.px(6)),
            ),
            margin: EdgeInsets.only(
              top: ScreenAdaptUtils.px(150),
              left: ScreenAdaptUtils.px(40),
              right: ScreenAdaptUtils.px(40),
            ),
            width: MediaQuery.of(context).size.width,
            height: ScreenAdaptUtils.px(88),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              textColor: Colors.white,
              child: Text(
                "确定",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
