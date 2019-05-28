import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';

class CarStoreAddress extends Dialog {
  String _newValue = '语文';
  Function selectItem;

  CarStoreAddress(this._newValue, this.selectItem);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenAdaptUtils.px(600),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(ScreenAdaptUtils.px(15))),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdaptUtils.px(30),
                    bottom: ScreenAdaptUtils.px(15),
                  ),
                  child: Text(
                    "请选择门店地址",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenAdaptUtils.px(36),
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: '语文',
                  title: Text('语文'),
                  groupValue: _newValue,
                  onChanged: (value) {
                    _newValue = value;
                    selectItem(value);
                  },
                ),
                RadioListTile<String>(
                  value: '数学',
                  title: Text('数学'),
                  groupValue: _newValue,
                  onChanged: (value) {
                    _newValue = value;
                    selectItem(value);
                  },
                ),
                RadioListTile<String>(
                  value: '英语',
                  title: Text('英语'),
                  groupValue: _newValue,
                  onChanged: (value) {
                    _newValue = value;
                    selectItem(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
