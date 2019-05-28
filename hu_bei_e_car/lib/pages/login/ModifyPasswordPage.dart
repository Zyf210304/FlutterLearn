import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class ModifyPasswordPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _ModifyPasswordPageState();
  }

}


class _ModifyPasswordPageState extends State<ModifyPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(context, "忘记密码"),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Page"),
          )
        ],
      ),
    );
  }

}
