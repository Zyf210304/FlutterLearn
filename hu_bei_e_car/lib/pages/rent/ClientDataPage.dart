import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/pages/rent/CityListPage.dart';
import 'package:hu_bei_e_car/utils/CustomRouteUtils.dart';
import 'AuthorizeInfoPage.dart';
import 'CarInfoPage.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class ClientDataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ClientDataState();
  }
}

class _ClientDataState extends State<ClientDataPage>
    with TickerProviderStateMixin {
  Text _setTextStatus(String text, int status) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ScreenAdaptUtils.px(30),
        color: status == 1 ? Colors.red : Colors.blue,
      ),
    );
  }

  double downY = 0.0;
  double scrollY = 0.0;
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        ScreenAdaptUtils.px(100);
    print('height == $height');
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: TitleBar(
        context,
        "进件材料",
        bgColor: 0xFF196FD5,
        textColor: 0xFFFFFFFF,
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onPanDown: (details) {
              if (isExpand) {
                return;
              }
              setState(() {
                downY = details.globalPosition.dy;
              });
            },
            onPanUpdate: (details) {
              if (isExpand) {
                return;
              }
              setState(() {
                double moveY = details.globalPosition.dy;
                scrollY = downY - moveY;
                if (scrollY >= height * .6) {
                  scrollY = height * .6;
                  isExpand = true;
                }
              });
              print('scrollY == $scrollY');
            },
            onPanEnd: (details) {
              if (scrollY > height * 0.3 && !isExpand) {
                print('-=--=-=-=--=-==-==-');
                animTop(scrollY, height);
              }
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenAdaptUtils.px(100),
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(44),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, Translate(CarInfoPage()));
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "车辆信息",
                            style: TextStyle(
                              color: Color(0xFF424242),
                              fontSize: ScreenAdaptUtils.px(30),
                            ),
                          ),
                        ),
                        Text(
                          "未完成",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(28),
                            color: Color(0xFFE4E4E4),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(ScreenAdaptUtils.px(30)),
                          child: Container(
                            color: Colors.red,
                            width: ScreenAdaptUtils.px(40),
                            height: ScreenAdaptUtils.px(40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "个人信息", 1),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "房产/现住址情况", 2),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "工作/经营情况", 3),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "联系人信息", 4),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "其他资产", 5),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "图片资料", 6),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "授权信息", 7),
                Divider(
                  height: ScreenAdaptUtils.px(1),
                  color: Color(0xFFE5E5E5),
                ),
                _listItem(context, "进度查询", 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: ScreenAdaptUtils.px(88),
                  margin: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(30),
                    right: ScreenAdaptUtils.px(30),
                    top: ScreenAdaptUtils.px(45),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF196FD5),
                    borderRadius: BorderRadius.circular(ScreenAdaptUtils.px(6)),
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "提交材料",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(30),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(15),
                  ),
                  child: Text(
                    "如实填写 发现不实将会驳回",
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(22),
                      color: Color(0xFF5697E3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, height - scrollY),
            child: Container(
              color: Colors.red,
              child: ListView(
                children: <Widget>[
                  Text(
                    "data",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "data",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void animTop(double scrollY, double height) {
    AnimationController animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    final curve =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    Animation<double> animation;
    animation = Tween(begin: height - scrollY, end: height * 0.4).animate(curve)
      ..addListener(() {
        print('动画正在执行');
        setState(() {
          scrollY = height * .6;
          print('value == ${animation.value}');
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isExpand = true;
        }
      });
    animationController.forward();
  }
}

Widget _listItem(BuildContext context, String text, int flag) {
  return Container(
    height: ScreenAdaptUtils.px(100),
    color: Colors.white,
    padding: EdgeInsets.only(
      left: ScreenAdaptUtils.px(44),
    ),
    child: GestureDetector(
      onTap: () {
        switch (flag) {
          case 2:
            Navigator.push(context, Translate(CityListPage()));
            break;
          case 7:
            Navigator.push(context, Translate(AuthorizeInfoPage()));
            break;
        }
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF424242),
                fontSize: ScreenAdaptUtils.px(30),
              ),
            ),
          ),
          Text(
            "未完成",
            style: TextStyle(
              fontSize: ScreenAdaptUtils.px(28),
              color: Color(0xFFE4E4E4),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenAdaptUtils.px(30)),
            child: Container(
              color: Colors.red,
              width: ScreenAdaptUtils.px(40),
              height: ScreenAdaptUtils.px(40),
            ),
          ),
        ],
      ),
    ),
  );
}
