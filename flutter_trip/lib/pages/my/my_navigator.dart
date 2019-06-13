import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MYPage extends StatefulWidget {
  @override
  _MYPageState createState() => _MYPageState();
}

class _MYPageState extends State<MYPage> {

  @override
  void initState(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}
