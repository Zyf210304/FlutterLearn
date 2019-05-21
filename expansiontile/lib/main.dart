import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const List_About = {
  '1': ['1', '2', '3', '4'],
  '2': ['1', '3', '3', '4'],
  '3': ['1', '5', '3', '4'],
  '4': ['1', '2', '8', '4'],
  '5': ['1', '7', '3', '4'],
  '6': ['6', '2', '3', '4'],
  '7': ['1', '2', '3', '00'],
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ExpansionTile'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    List_About.keys.forEach((key) {
      widgets.add(_listItem(key, List_About[key]));
    });
    return widgets;
  }

  Widget _listItem(String key, List<String> list_about) {
    return ExpansionTile(
        title: Text(
        key, 
        style:TextStyle(
          fontSize: 20, 
          color: Colors.blue
          )
        ),
        backgroundColor: Colors.lightGreenAccent,
        children: list_about.map((values)=>_buildSub(values)).toList(),
    );
  }
          
  Widget  _buildSub(String values) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child:Text(values, style: TextStyle(color: Colors.white),),
      ),
    );
  }

  
}
