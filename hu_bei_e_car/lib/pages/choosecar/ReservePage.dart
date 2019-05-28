import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/pages/choosecar/ReserveSuccessPage.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/utils/NavigatorUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';
// import 'package:flutter_html_textview/flutter_html_textview.dart';

class ReservePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservePageState();
  }
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(context, "预约详情"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: ScreenAdaptUtils.px(80),
                  color: Color(0xFFF5F5F5),
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(20),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*您已完成实名认证",
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: ScreenAdaptUtils.px(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(20),
                    bottom: ScreenAdaptUtils.px(20),
                    left: ScreenAdaptUtils.px(30),
                  ),
                  child: Text(
                    "预订人信息",
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(28),
                      color: Color(0xFF666666),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "姓名",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: ScreenAdaptUtils.px(24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenAdaptUtils.px(10),
                          bottom: ScreenAdaptUtils.px(10),
                        ),
                        child: Text(
                          "手机号",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: ScreenAdaptUtils.px(24),
                          ),
                        ),
                      ),
                      Text(
                        "身份证号",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: ScreenAdaptUtils.px(24),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(40),
                    bottom: ScreenAdaptUtils.px(20),
                    left: ScreenAdaptUtils.px(30),
                  ),
                  child: Text(
                    "车辆信息",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: ScreenAdaptUtils.px(28),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: ScreenAdaptUtils.px(300),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "http://via.placeholder.com/350x150",
                        width: ScreenAdaptUtils.px(300),
                        height: ScreenAdaptUtils.px(300),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(20),
                          top: ScreenAdaptUtils.px(30),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "data",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF666666),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenAdaptUtils.px(10),
                                bottom: ScreenAdaptUtils.px(10),
                              ),
                              child: Text(
                                "data",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(24),
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                            Text(
                              "data",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF666666),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenAdaptUtils.px(10),
                                bottom: ScreenAdaptUtils.px(10),
                              ),
                              child: Text(
                                "data",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(24),
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                            Text(
                              "data",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(30),
                    top: ScreenAdaptUtils.px(20),
                    bottom: ScreenAdaptUtils.px(20),
                  ),
                  color: Colors.white,
                  child: Text(
                    "赠送内容",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: ScreenAdaptUtils.px(28),
                    ),
                  ),
                ),
                // HtmlTextView(
                //     data:
                //         '<body style="color: white;">Hello world! <a href="www.html5rocks.com">HTML5 rocks!</a></body>'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              NavigatorUtils.intentAndFinish(context, ReserveSuccessPage());
            },
            child: Container(
              color: Color(0xFF196FD5),
              width: MediaQuery.of(context).size.width,
              height: ScreenAdaptUtils.px(100),
              alignment: Alignment.center,
              child: Text(
                "车辆预定",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(32),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
