import 'package:flutter/material.dart';

import 'stateFull_Group_page.dart';
import 'fultter_layout_page.dart';
import 'stateLessLearn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
