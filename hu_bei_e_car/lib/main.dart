import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'pages/SplashPage.dart';

void main() {
  ScreenAdaptUtils.init(750);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
