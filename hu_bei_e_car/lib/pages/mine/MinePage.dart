import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/pages/rent/RentApplicationPage.dart';
import 'package:hu_bei_e_car/utils/CustomRouteUtils.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenAdaptUtils.px(404),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/ic_user_bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          width: ScreenAdaptUtils.px(40),
                          height: ScreenAdaptUtils.px(40),
                          margin: EdgeInsets.only(
                            right: ScreenAdaptUtils.px(30),
                            top: ScreenAdaptUtils.px(80),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: ScreenAdaptUtils.px(30),
                            right: ScreenAdaptUtils.px(30),
                          ),
                          child: ClipOval(
                            
                            child:Container(
                              decoration: BoxDecoration(color:Colors.yellow),
                              width: 50,
                              height: 50,
                              child: Icon(Icons.person,
                              size:45,
                              color:Colors.white,
                            )
                           
                            
                          ),
                            // color: Colors.yellow,
                            // width: ScreenAdaptUtils.px(100),
                            // height: ScreenAdaptUtils.px(100),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "立即登录",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenAdaptUtils.px(36),
                              ),
                            ),
                            Text(
                              "0成本买新车",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenAdaptUtils.px(32),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      color: Color(0x661B66BF),
                      height: ScreenAdaptUtils.px(120),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: ScreenAdaptUtils.px(30),
                                    right: ScreenAdaptUtils.px(30),
                                  ),
                                  child: Container(
                                    color: Colors.black,
                                    width: ScreenAdaptUtils.px(52),
                                    height: ScreenAdaptUtils.px(56),
                                  ),
                                ),
                                Text(
                                  "购车资格评估",
                                  style: TextStyle(
                                      fontSize: ScreenAdaptUtils.px(28),
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              debugPrint("点击了立即评估");
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "立即评估",
                                  style: TextStyle(
                                    fontSize: ScreenAdaptUtils.px(28),
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: ScreenAdaptUtils.px(10),
                                    right: ScreenAdaptUtils.px(20),
                                  ),
                                  child: Icon(
                                    Icons.home,
                                    size: ScreenAdaptUtils.px(50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ScreenAdaptUtils.px(20),
                color: Color(0xFFF1F1F1),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("点击了常见问题");
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenAdaptUtils.px(40),
                                bottom: ScreenAdaptUtils.px(20),
                              ),
                              child: Icon(
                                Icons.home,
                                size: ScreenAdaptUtils.px(50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdaptUtils.px(40),
                              ),
                              child: Text(
                                "常见问题",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: ScreenAdaptUtils.px(28),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("点击了在线客服");
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenAdaptUtils.px(40),
                                bottom: ScreenAdaptUtils.px(20),
                              ),
                              child: Icon(
                                Icons.home,
                                size: ScreenAdaptUtils.px(50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdaptUtils.px(40),
                              ),
                              child: Text(
                                "在线客服",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: ScreenAdaptUtils.px(28),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("点击了邀请有礼");
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenAdaptUtils.px(40),
                                bottom: ScreenAdaptUtils.px(20),
                              ),
                              child: Icon(
                                Icons.home,
                                size: ScreenAdaptUtils.px(50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdaptUtils.px(40),
                              ),
                              child: Text(
                                "邀请有礼",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: ScreenAdaptUtils.px(28),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ScreenAdaptUtils.px(20),
                color: Color(0xFFF1F1F1),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, Translate(RentApplicationPage()));
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(30),
                    right: ScreenAdaptUtils.px(30),
                  ),
                  height: ScreenAdaptUtils.px(100),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "租赁申请",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(28),
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "实名认证",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "我的积分",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "我的预约",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "我的收藏",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "客服电话",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "操作指南",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                  right: ScreenAdaptUtils.px(30),
                ),
                height: ScreenAdaptUtils.px(100),
                child: Row(
                  children: <Widget>[
                    Text(
                      "系统设置",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
