import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home/home_navigator.dart';
import 'package:flutter_trip/pages/my/my_navigator.dart';
import 'package:flutter_trip/pages/search/search_navigator.dart';
import 'package:flutter_trip/pages/travel/travel_navigator.dart';

class TabNavgitor extends StatefulWidget {
  @override
  _TabNavgitorState createState() => _TabNavgitorState();
}

class _TabNavgitorState extends State<TabNavgitor> {
  
  final _defaultColor = Colors.grey;
  final _selectColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MYPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(
        icon: Icon(Icons.home, color: _defaultColor,), 
        title: Text('首页', style: TextStyle(color: _currentIndex == 0 ? _selectColor : _defaultColor),),
        activeIcon: Icon(Icons.home, color: _selectColor,), 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.search, color: _defaultColor,), 
        title: Text('搜索', style: TextStyle(color: _currentIndex == 1 ? _selectColor : _defaultColor),),
        activeIcon: Icon(Icons.search, color: _selectColor,), 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.card_travel, color: _defaultColor,), 
        title: Text('旅拍', style: TextStyle(color: _currentIndex == 2 ? _selectColor : _defaultColor),),
        activeIcon: Icon(Icons.card_travel, color: _selectColor,), 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.account_circle, color: _defaultColor,), 
        title: Text('我的', style: TextStyle(color: _currentIndex == 3 ? _selectColor : _defaultColor),),
        activeIcon: Icon(Icons.account_circle, color: _selectColor,), 
        ),
      ],),
    );
  }
}
