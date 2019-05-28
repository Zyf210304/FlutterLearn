import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class AuthorizeInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AuthorizeInfoState();
  }
}

class _AuthorizeInfoState extends State<AuthorizeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: TitleBar(
        context,
        "授权信息",
        bgColor: 0xFF196FD5,
        textColor: 0xFFFFFFFF,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenAdaptUtils.px(20),
          ),
          _multiContentItem(context, "淘宝授权认证", "淘宝订单账号认证", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "运营商认证", "手机运营商认证审核", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "OCR身份认证", "", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "学信网授权认证", "学信网授权认证", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "网银认证", "网银认证审核", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "支付宝认证", "", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "社保授权认证", "社保账号认证", 0),
          Divider(
            height: ScreenAdaptUtils.px(1),
            color: Color(0xFFE5E5E5),
          ),
          _multiContentItem(context, "公积金认证", "公积金认证审核", 0),
        ],
      ),
    );
  }
}

Widget _multiContentItem(
    BuildContext context, String text, String subTitle, int flag) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: ScreenAdaptUtils.px(120),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(35),
              right: ScreenAdaptUtils.px(35),
            ),
            child: Container(
              width: ScreenAdaptUtils.px(50),
              height: ScreenAdaptUtils.px(50),
              color: Colors.red,
            ),
          ),
          subTitle == "" ? _singleContent(text) : _multiContent(text, subTitle),
          Text(
            "未完成",
            style: TextStyle(
              color: Color(0xFFE4E4E4),
              fontSize: ScreenAdaptUtils.px(26),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(25),
              right: ScreenAdaptUtils.px(25),
            ),
            child: Icon(
              Icons.home,
              size: ScreenAdaptUtils.px(50),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _multiContent(String text, String subTitle) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: ScreenAdaptUtils.px(30),
            bottom: ScreenAdaptUtils.px(5),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: ScreenAdaptUtils.px(30),
              color: Color(0xFF424242),
            ),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(20),
            color: Color(0xFFBFBFBF),
          ),
        ),
      ],
    ),
  );
}

Widget _singleContent(String text) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(30),
            color: Color(0xFF424242),
          ),
        ),
      ],
    ),
  );
}
