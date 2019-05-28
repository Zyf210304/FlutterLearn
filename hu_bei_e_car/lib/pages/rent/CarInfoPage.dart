import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class CarInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarInfoState();
  }
}

class _CarInfoState extends State<CarInfoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: TitleBar(
        context,
        "车辆信息",
        bgColor: 0xFF196FD5,
        textColor: 0xFFFFFFFF,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: ScreenAdaptUtils.px(64),
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(46),
              ),
              child: Text(
                "车辆信息",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(30),
                  color: Color(0xFF999999),
                ),
              ),
            ),
            _selectItem(context, "车辆类型", 0),
            _selectItem(context, "车辆品牌", 1),
            _selectItem(context, "车辆型号", 2),
            _selectItem(context, "车辆颜色", 3),
            _fillItem(context, "汽车排量"),
            _fillItem(context, "指导价格"),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: ScreenAdaptUtils.px(77),
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(46),
              ),
              child: Text(
                "产品信息",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(30),
                  color: Color(0xFF999999),
                ),
              ),
            ),
            _selectItem(context, "选择产品", 4),
            _selectItem(context, "首付比例", 5),
            _selectItem(context, "租赁期限", 6),
            _selectItem(context, "付款方式", 7),
            _selectItem(context, "融租项目(可多选)", 8),
            _fillItem(context, "手续费"),
            _fillItem(context, "履约保证金"),
            _fillItem(context, "GPS安装费"),
            _fillItem(context, "GPS流量费"),
            _fillItem(context, "服务费"),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(
                left: ScreenAdaptUtils.px(30),
                right: ScreenAdaptUtils.px(30),
                top: ScreenAdaptUtils.px(35),
                bottom: ScreenAdaptUtils.px(55),
              ),
              height: ScreenAdaptUtils.px(88),
              decoration: BoxDecoration(
                color: Color(0xFF196FD5),
                borderRadius: BorderRadius.circular(ScreenAdaptUtils.px(6)),
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "保存信息",
                  style: TextStyle(
                    fontSize: ScreenAdaptUtils.px(30),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(44),
                top: ScreenAdaptUtils.px(25),
              ),
              child: Text(
                "温馨提示",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(24),
                  color: Color(0xFF5697E3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(44),
                top: ScreenAdaptUtils.px(25),
                bottom: ScreenAdaptUtils.px(44),
              ),
              child: Text(
                """1、所有资料请如实填写\n2、提交申请前，请联系您的业务经理完成车辆信息补录。""",
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(24),
                  color: Color(0xFF999999),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _selectItem(BuildContext context, String text, int flag) {
  return GestureDetector(
    onTap: () {
      switch (flag) {
        case 8:
          List<String> list = List(3);

          showModalBottomSheet(
            context: context,
            builder: (context) =>
                Container(
                  color: Colors.white,
                  height: ScreenAdaptUtils.px(375),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(30),
                          top: ScreenAdaptUtils.px(55),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "融资项目(可多选)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenAdaptUtils.px(36),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "确定",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(30),
                                  color: Color(0xFF196FD5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
//                      GridView.count(
//                        crossAxisCount: 3,
//                        children: list.map((item) {
//                          return Container(
//                            width: ScreenAdaptUtils.px(224),
//                            height: ScreenAdaptUtils.px(66),
//                            decoration: BoxDecoration(
//                              color: list.length == 0
//                                  ? Color(0xFFF6F6F6)
//                                  : Color(0xFF196FD5),
//                              borderRadius: BorderRadius.circular(
//                                  ScreenAdaptUtils.px(66)),
//                            ),
//                            child: Text(
//                              "剩余车价",
//                              style: TextStyle(
//                                fontSize: ScreenAdaptUtils.px(26),
//                                color: list.length == 0
//                                    ? Colors.black
//                                    : Colors.white,
//                              ),
//                            ),
//                          );
//                        }).toList(),
//                      ),
                    ],
                  ),
                ),
          );
          break;
      }
    },
    child: Container(
      alignment: Alignment.centerLeft,
      height: ScreenAdaptUtils.px(100),
      padding: EdgeInsets.only(
        left: ScreenAdaptUtils.px(44),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: ScreenAdaptUtils.px(30),
                color: Color(0xFF424242),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ScreenAdaptUtils.px(400),
            ),
            child: Text(
              "选项",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenAdaptUtils.px(30),
                color: Color(0xFF424242),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(30),
              right: ScreenAdaptUtils.px(30),
            ),
            child: Icon(
              Icons.home,
              size: ScreenAdaptUtils.px(40),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _fillItem(BuildContext context, String text) {
  return Container(
    alignment: Alignment.centerLeft,
    height: ScreenAdaptUtils.px(100),
    padding: EdgeInsets.only(
      left: ScreenAdaptUtils.px(44),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: ScreenAdaptUtils.px(30),
              color: Color(0xFF424242),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ScreenAdaptUtils.px(400),
          ),
          child: Text(
            "选项",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenAdaptUtils.px(30),
              color: Color(0xFF424242),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: ScreenAdaptUtils.px(100),
          ),
        ),
      ],
    ),
  );
}
