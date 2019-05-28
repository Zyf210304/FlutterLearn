import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/event_bus/ChangeLetter.dart';

class QuickIndexBar extends CustomPainter {
  List<String> _list = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  double _height;
  double _touchY;
  String _letter;

  QuickIndexBar(this._height, this._touchY, this._letter);

  @override
  void paint(Canvas canvas, Size size) {
    double itemHeight = _height / _list.length;

    Paint paint = Paint()..color = Colors.grey;
    Rect rect = Rect.fromLTRB(0, 0, ScreenAdaptUtils.px(50), _height);
    canvas.drawRect(rect, paint);

    for (int i = 0, length = _list.length; i < length; i++) {
      Color color;
      if (_touchY > itemHeight * i && _touchY <= itemHeight * (i + 1)) {
        color = Colors.blue;
        if (_list[i] != _letter) {
          eventBus.fire(ChangeLetterEvent(_list[i]));
        }
      } else {
        color = Colors.red;
      }
      ParagraphBuilder pb = ParagraphBuilder(
        ParagraphStyle(
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: ScreenAdaptUtils.px(20),
        ),
      )
        ..pushStyle(ui.TextStyle(color: color))
        ..addText(_list[i]);
      ParagraphConstraints pc =
          ParagraphConstraints(width: ScreenAdaptUtils.px(50));
      Paragraph paragraph = pb.build()..layout(pc);
      canvas.drawParagraph(
          paragraph,
          Offset(ScreenAdaptUtils.px(3),
              i * itemHeight + ((itemHeight - ScreenAdaptUtils.px(20)) / 2)));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
