import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';

class SelectRentProjectDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        height: ScreenAdaptUtils.px(375),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "融资项目(可多选)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenAdaptUtils.px(36),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}