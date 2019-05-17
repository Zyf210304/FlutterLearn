import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class ResoursePage extends StatefulWidget {
  ResoursePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResoursePageState createState() => _ResoursePageState();
}

class _ResoursePageState extends State<ResoursePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资源'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('images/if_win_0.png'),)
              ],
            ),
      ),
    );
  }

  
}
