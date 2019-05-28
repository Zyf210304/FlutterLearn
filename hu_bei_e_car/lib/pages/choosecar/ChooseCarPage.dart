import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/event_bus/CityEvent.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/utils/NavigatorUtils.dart';
import 'CarDetailsPage.dart';

class ChooseCarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ChooseCarPageState();
  }
}

class _ChooseCarPageState extends State<ChooseCarPage> {
  final List<String> _list = new List();
  String _city = '杭州市';

  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      _list.add('item == $i');
    }
    cityEventBus.on<CityEvent>().listen((event) {
      setState(() {
        _city = event.name;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _inputContent;
    String _sequence = "智能排序";
    String _brand = "品牌名称";
    String _price = "超低成本";

    return Column(
      children: <Widget>[
        Container(
          height: ScreenAdaptUtils.px(88) + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(20),
                    right: ScreenAdaptUtils.px(20),
                  ),
                  padding: EdgeInsets.only(
                    left: ScreenAdaptUtils.px(15),
                    right: ScreenAdaptUtils.px(15),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenAdaptUtils.px(60)),
                    color: Color(0xFFF2F2F2),
                  ),
                  height: ScreenAdaptUtils.px(60),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "想买什么车？",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(0, ScreenAdaptUtils.px(15), 0, 0),
                      hintStyle: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: ScreenAdaptUtils.px(28),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenAdaptUtils.px(28),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      setState(() => _inputContent = text);
                    },
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ScreenAdaptUtils.px(10),
                      right: ScreenAdaptUtils.px(10),
                    ),
                    child: Text(
                      _city,
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(28),
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  onTap: () {
                    print('-=-=-=-=-=-=-=-=');
                  },
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Color(0xFFE5E5E5),
          height: ScreenAdaptUtils.px(1),
        ),
        Container(
          color: Colors.white,
          height: ScreenAdaptUtils.px(88),
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    debugPrint("点击了智能排序");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _sequence,
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: ScreenAdaptUtils.px(28),
                        ),
                      ),
                      Icon(Icons.home),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    debugPrint("点击了品牌名称");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _brand,
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: ScreenAdaptUtils.px(28),
                        ),
                      ),
                      Icon(Icons.home),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    debugPrint("点击了超低成本");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _price,
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: ScreenAdaptUtils.px(28),
                        ),
                      ),
                      Icon(Icons.home),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 0,
            ),
            itemCount: _list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  NavigatorUtils.intent(context, CarDetailsPage(), null);
                },
                child: _chooseCarItem(context),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _chooseCarItem(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        height: ScreenAdaptUtils.px(20),
        color: Color(0xFFF1F1F1),
      ),
      Container(
        padding: EdgeInsets.only(
          left: ScreenAdaptUtils.px(20),
        ),
        height: ScreenAdaptUtils.px(240),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Image.network(
              "http://via.placeholder.com/350x150",
              width: ScreenAdaptUtils.px(200),
              height: ScreenAdaptUtils.px(152),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(20),
                top: ScreenAdaptUtils.px(30),
                right: ScreenAdaptUtils.px(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "英朗英朗英朗英朗英朗英朗",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(28),
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenAdaptUtils.px(20),
                      bottom: ScreenAdaptUtils.px(20),
                    ),
                    child: Text(
                      "指导价：10.99万-18.99万",
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(20),
                        color: Color(0xFFA6A6A6),
                      ),
                    ),
                  ),
                  Text(
                    "首付：1.1万起",
                    style: TextStyle(
                      fontSize: ScreenAdaptUtils.px(24),
                      color: Color(0xFFFF5454),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
