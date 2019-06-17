import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Offset> _points = List<Offset>();
  List<Uint8List> images = List();
  GlobalKey rootWidgetKey = GlobalKey();
  GlobalKey anchorKey = GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;//这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }

  
  @override
  
  Widget build(BuildContext context) {

    

    return MaterialApp(
      
      home: Scaffold(
        body: SafeArea(
          child: Center(
            key:rootWidgetKey,
            child: Column(
            children: <Widget>[
              Text("签名板"),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(color: Colors.grey),
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      RenderBox obj = context.findRenderObject();
                      Offset _localPosition =
                          obj.globalToLocal(details.globalPosition);

                      RenderBox renderBox =
                          anchorKey.currentContext.findRenderObject();
                      var offset = renderBox.localToGlobal(Offset.zero);
                      Offset _newLocation = Offset(
                          _localPosition.dx - offset.dx,
                          _localPosition.dy - offset.dy);
                      // if(_localPosition.dx < 300 && _localPosition.dy < 200){
                      // print(" x = ${_localPosition.dx}  y = ${_localPosition.dy},");

                      if (0 < _newLocation.dx &&
                          _newLocation.dx < 300 &&
                          0 < _newLocation.dy &&
                          _newLocation.dy < 200) {
                        _points = List.from(_points)..add(_newLocation);
                      }

                      // }
                    });
                  },
                  onPanEnd: (DragEndDetails details) => _points..add(null),
                  child: CustomPaint(
                    key: anchorKey,
                    painter: Signature(_points),
                    size: Size.infinite,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text('存储签名'),
                  onPressed: () {
                    _capturePng();
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                itemBuilder: (context, index) {
                  return Image.memory(
                    images[index],
                    fit: BoxFit.cover,
                  );
                  },
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                ),
             )

            ],
          )),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () => _points.clear(),
        ),
      ),
    );




  }
}



class Signature extends CustomPainter {
  List<Offset> points;
  Signature(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }


  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
