import 'package:flutter/material.dart';

import 'stateFull_Group_page.dart';
import 'fultter_layout_page.dart';
import 'stateLessLearn.dart';
import 'gesture_page.dart';
import 'resourse_page.dart';
import 'launch_page.dart';
import 'camera_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: RootNavigation('Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由器'),
        ),
        body: RootNavigation(),
      ),
      routes: <String, WidgetBuilder>{
        'layout': (BuildContext context) => FullterLayout(),
        'stateFlull': (BuildContext context) => StateFullGroup(),
        'stateLess': (BuildContext context) => GroupLesson(),
        'gesture':(BuildContext context) => GesturePage(),
        'resourse':(BuildContext context) => ResoursePage(),
        'launch':(BuildContext context) => LauchPage(),
        'camera':(BuildContext context) => CameraPage(),
      },
    );
  }
}

class RootNavigation extends StatefulWidget {
  @override
  _RootNavigationState createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(title: Text('${byName?'':'不'}通过路由名跳转'), value: byName, onChanged: (value){
            setState(() {
              byName = value;
            });
          }),
          _item('GroupLesson', GroupLesson(), 'stateLess'),
          _item('layout', FullterLayout(), 'layout'),
          _item('stateFlull', StateFullGroup(), 'stateFlull'),
          _item('gesture', GesturePage(), 'gesture'),
          _item('resourse', ResoursePage(), 'resourse'),
          _item('launch', LauchPage(), 'launch'),
          _item('camera', CameraPage(), 'camera'),
        ],
      ),
    );
  }

  _item(String title, page , String routNname) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName) {
            Navigator.pushNamed(context, routNname);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
