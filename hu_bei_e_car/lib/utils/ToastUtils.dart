import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastUtils {

  static Future<bool> showToast(String msg,
      {bgColor: 0x88000000, textColor: 0xFFFFFFFF, fontSize: 14 * .96,
        duration: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM}) {
    return Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Color(bgColor),
        textColor: Color(textColor),
        gravity: gravity,
        fontSize: fontSize,
        toastLength: duration);
  }

}