import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/utils/CustomRouteUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';
import 'ClientDataPage.dart';

class RentApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RentApplicationState();
  }
}

class _RentApplicationState extends State<RentApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        context,
        "融租申请",
        bgColor: 0xFF196FD5,
        textColor: 0xFFFFFFFF,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: ScreenAdaptUtils.px(240),
            color: Color(0xFF196FD5),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(48),
                  ),
                  child: Text(
                    "可申请额度:（元）",
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(24),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(0),
                  ),
                  child: Text(
                    "2,000.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenAdaptUtils.px(100),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenAdaptUtils.px(20),
            color: Color(0xFFF5F5F5),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenAdaptUtils.px(80),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdaptUtils.px(248),
                        padding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(43),
                        ),
                        child: Text(
                          "手机号",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(30),
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),
                      Text(
                        "15895632147",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(30),
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenAdaptUtils.px(80),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdaptUtils.px(248),
                        padding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(43),
                        ),
                        child: Text(
                          "姓名",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(30),
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),
                      Text(
                        "15895632147",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(30),
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenAdaptUtils.px(80),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdaptUtils.px(248),
                        padding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(43),
                        ),
                        child: Text(
                          "身份证号",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(30),
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),
                      Text(
                        "15895632147",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(30),
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(42),
                    top: ScreenAdaptUtils.px(30),
                  ),
                  child: Text(
                    "征信授权书",
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(30),
                      color: Color(0xFF424242),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(75),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: ScreenAdaptUtils.px(180),
                              width: ScreenAdaptUtils.px(180),
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenAdaptUtils.px(35),
                            ),
                            child: Text(
                              "身份证复印件",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF3791FA),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: ScreenAdaptUtils.px(180),
                              width: ScreenAdaptUtils.px(180),
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenAdaptUtils.px(35),
                            ),
                            child: Text(
                              "征信授权书",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF3791FA),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: ScreenAdaptUtils.px(180),
                              width: ScreenAdaptUtils.px(180),
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenAdaptUtils.px(35),
                            ),
                            child: Text(
                              "授权书签署照片",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(24),
                                color: Color(0xFF3791FA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: ScreenAdaptUtils.px(88),
                  margin: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(30),
                    right: ScreenAdaptUtils.px(30),
                    top: ScreenAdaptUtils.px(80),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF196FD5),
                    borderRadius: BorderRadius.circular(ScreenAdaptUtils.px(6)),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        Translate(ClientDataPage()
                        ),
                      );
                    },
                    child: Text(
                      "确定",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
