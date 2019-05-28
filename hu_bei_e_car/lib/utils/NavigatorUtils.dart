import 'package:flutter/material.dart';
import 'CustomRouteUtils.dart';

class NavigatorUtils {
  static intent(BuildContext context, Widget widget, Function operations) {
    Navigator.push(context, Translate(widget)).then(operations);
  }

  static intentAndFinish(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, Translate(widget));
  }
}
