import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'screenshot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();


  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.add(pngBytes);
      return pngBytes;//这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    
    return RepaintBoundary(
      key: rootWidgetKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
              "http://qiniu.nightfarmer.top/test.gif",
              width: 300,
              height: 300,
            ),
            FlatButton(
              onPressed: () {
                
                _capturePng();
                setState(() {
                  
                });
                print(images.length);
              },
              child: Text("全屏截图"),
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
        ),
      ),
    );

    
  }
}
