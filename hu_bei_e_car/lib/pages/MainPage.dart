import 'package:flutter/material.dart';
import 'home/HomePage.dart';
import 'choosecar/ChooseCarPage.dart';
import 'find/FindPage.dart';
import 'mine/MinePage.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  var _index = 0;
  List<Widget> _list = [HomePage(), ChooseCarPage(), FindPage(), MinePage()];
  var appBarTitles = ['首页', '选车', '发现', '我的'];
  var tabImages;

  Image getTabImage(String path) {
    return Image.asset(
      path,
      width: ScreenAdaptUtils.px(46),
      height: ScreenAdaptUtils.px(46),
    );
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _index) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _index) {
      return new Text(
        appBarTitles[curIndex],
        style: new TextStyle(
          color: Color(0xFF196FD5),
          fontSize: ScreenAdaptUtils.px(24),
        ),
      );
    } else {
      return new Text(
        appBarTitles[curIndex],
        style: new TextStyle(
          color: Color(0xFFA6A6A6),
          fontSize: ScreenAdaptUtils.px(24),
        ),
      );
    }
  }

  void initData() {
    tabImages = [
      [
        getTabImage("images/ic_home_normal.png"),
        getTabImage("images/ic_home_select.png"),
      ],
      [
        getTabImage("images/ic_car_chose_normal.png"),
        getTabImage("images/ic_car_chose_select.png"),
      ],
      [
        getTabImage("images/ic_find_normal.png"),
        getTabImage("images/ic_find_select.png"),
      ],
      [
        getTabImage("images/ic_mine_normal.png"),
        getTabImage("images/ic_mine_select.png"),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _index,
        children: _list,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: getTabIcon(0),
            title: getTabTitle(0),
          ),
          new BottomNavigationBarItem(
            icon: getTabIcon(1),
            title: getTabTitle(1),
          ),
          new BottomNavigationBarItem(
            icon: getTabIcon(2),
            title: getTabTitle(2),
          ),
          new BottomNavigationBarItem(
            icon: getTabIcon(3),
            title: getTabTitle(3),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedFontSize: ScreenAdaptUtils.px(24),
        unselectedFontSize: ScreenAdaptUtils.px(24),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
