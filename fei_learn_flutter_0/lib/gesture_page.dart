import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class GesturePage extends StatefulWidget {
  GesturePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX = 0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('检测手势操作'),
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
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _printMsg('点击'),
                  onDoubleTap: () => _printMsg('双击'),
                  onLongPress: () => _printMsg('长按'),
                  onTapCancel: () => _printMsg('取消'),
                  onTapUp: (e) => _printMsg('松开'),
                  onTapDown: (e) => _printMsg('松开'),
                  child: Container(
                    padding: EdgeInsets.all(60),
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(
                      '点我',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                ),
                Text(printString),
              ],
            ),
            Positioned(
              left: moveX,
              top: moveY,
              child: GestureDetector(
                onPanUpdate: (e) => _doMove(e),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      if (msg == '点击') {
        printString = '点击';
      } else {
        printString += ', $msg';
      }
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
  }
}
