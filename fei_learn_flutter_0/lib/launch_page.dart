import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauchPage extends StatefulWidget {
  LauchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LauchPageState createState() => _LauchPageState();
}

class _LauchPageState extends State<LauchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转'),
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
        children: <Widget>[
          RaisedButton(
            onPressed: () => _launchURL(),
            child: Text('打开百度'),
          ),
          RaisedButton(
            onPressed: () => _openMap(),
            child: Text('打开地图'),
          ),
        ],
      )),
    );
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    //Andriod
    const url = 'geo:52.32,4.97';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      const url = 'http://maps.apple.com/?ll=44.34,4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
