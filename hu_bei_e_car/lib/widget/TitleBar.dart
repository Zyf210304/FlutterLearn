import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';

class TitleBar extends PreferredSize {
  TitleBar(BuildContext context, String text,
      {bgColor: 0xFFFFFFFF,
      textColor: 0xFF333333,
      height: 100,
      backImg: "images/ic_back_white.png"})
      : super(
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              highlightColor: Color(bgColor),
              icon: ImageIcon(
                AssetImage(backImg),
                size: ScreenAdaptUtils.px(40),
              ),
              iconSize: ScreenAdaptUtils.px(height),
              padding: EdgeInsets.all(0),
            ),
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            backgroundColor: Color(bgColor),
            title: Text(
              text,
              style: TextStyle(
                fontSize: ScreenAdaptUtils.px(36),
                color: Color(textColor),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(ScreenAdaptUtils.px(height)),
        );
}
