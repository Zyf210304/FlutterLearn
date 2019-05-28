import 'dart:async';

import 'package:hu_bei_e_car/entity/CityEntity.dart';
import 'package:hu_bei_e_car/event_bus/ChangeLetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hu_bei_e_car/event_bus/CityEvent.dart';
import 'package:hu_bei_e_car/http/Api.dart';
import 'package:hu_bei_e_car/http/HttpUtils.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:hu_bei_e_car/widget/QuickIndexBar.dart';
import 'package:hu_bei_e_car/widget/TitleBar.dart';

class CityListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CityListState();
  }
}

GlobalKey headerKey = GlobalKey();

class _CityListState extends State<CityListPage> {
  double touchY = -1.0;
  List<HotListEntity> _hotList = List();
  List<CityListEntity> _cityList = List();
  List<GlobalKey> _globalKeyList = List();
  StreamSubscription subscription;
  String _letter = 'A';
  ScrollController scrollController = ScrollController();
  double _scrollDistance = 0;
  double _headerHeight = 0;

  @override
  void initState() {
    subscription = eventBus.on<ChangeLetterEvent>().listen((event) {
      setState(() {
        _letter = event.letter;
        if (_headerHeight == 0) {
          _headerHeight = headerKey.currentContext.size.height;
        }
        _scrollDistance += _headerHeight;

        for (int i = 0, length = _cityList.length; i < length; i++) {
          if (_letter == _cityList[i].initial) {
            scrollController.animateTo(
              _scrollDistance,
              duration: new Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
            break;
          }
          if (i == 0) {
            _scrollDistance += ScreenAdaptUtils.px(60);
          } else if (_cityList[i].initial != _cityList[i - 1].initial) {
            _scrollDistance += ScreenAdaptUtils.px(60);
          }
          _scrollDistance += ScreenAdaptUtils.px(91);
        }
      });
    });
    getCity();
    super.initState();
  }

  void getCity() {
    HttpUtils().post(Api.CITY_LIST, null, (map) {
      setState(() {
        CityEntity cityEntity = CityEntity.fromJson(map);
        _cityList.clear();
        _cityList.addAll(cityEntity.cityList);

        _globalKeyList.clear();
        List.generate(_cityList.length, (index) {
          _globalKeyList.add(GlobalKey());
        });

        _hotList.clear();
        _hotList.addAll(cityEntity.hotList);
      });
    }, (error) {});
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double height = screenHeight -
        ScreenAdaptUtils.px(88) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: TitleBar(
        context,
        '城市列表',
        backImg: 'images/ic_back.png',
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: height,
            child: ListView.builder(
              controller: scrollController,
              itemCount: _cityList.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _headerItem(context, _hotList);
                }
                return _cityItem(
                    context,
                    _cityList[index - 1],
                    index == 1 ? _cityList[index - 1] : _cityList[index - 2],
                    _globalKeyList[index - 1]);
              },
            ),
          ),
          Positioned(
            right: 0,
            width: ScreenAdaptUtils.px(50),
            child: GestureDetector(
              onPanStart: (start) {
                RenderBox renderBox = context.findRenderObject();
                Offset startOffset =
                    renderBox.globalToLocal(start.globalPosition);
                setState(() {
                  touchY = startOffset.dy -
                      ScreenAdaptUtils.px(88) -
                      MediaQuery.of(context).padding.top;
                });
              },
              onPanUpdate: (update) {
                RenderBox renderBox = context.findRenderObject();
                Offset updateOffset =
                    renderBox.localToGlobal(update.globalPosition);
                setState(() {
                  touchY = updateOffset.dy -
                      ScreenAdaptUtils.px(88) -
                      MediaQuery.of(context).padding.top;
                  _scrollDistance = 0;
                });
              },
              onPanEnd: (end) {
                setState(() {
                  touchY = -1;
                  _scrollDistance = 0;
                });
              },
              child: CustomPaint(
                painter: QuickIndexBar(height, touchY, _letter),
                child: Container(
                  width: ScreenAdaptUtils.px(50),
                  height: height,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width:
                  touchY >= 0 && touchY < height ? ScreenAdaptUtils.px(250) : 0,
              height:
                  touchY >= 0 && touchY < height ? ScreenAdaptUtils.px(250) : 0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius:
                    BorderRadius.all(Radius.circular(ScreenAdaptUtils.px(20))),
              ),
              child: Text(
                _letter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenAdaptUtils.px(60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _headerItem(BuildContext context, List<HotListEntity> hotList) {
  return Column(
    key: headerKey,
    children: <Widget>[
      Container(
        color: Color(0xFFF5F5F5),
        height: ScreenAdaptUtils.px(60),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: ScreenAdaptUtils.px(25),
        ),
        child: Text(
          '当前城市',
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF333333),
          ),
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: ScreenAdaptUtils.px(25),
        ),
        height: ScreenAdaptUtils.px(90),
        child: Text(
          '杭州市',
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF333333),
          ),
        ),
      ),
      Container(
        color: Color(0xFFF5F5F5),
        height: ScreenAdaptUtils.px(60),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: ScreenAdaptUtils.px(25),
        ),
        child: Text(
          '热门城市',
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF333333),
          ),
        ),
      ),
      Wrap(
        spacing: ScreenAdaptUtils.px(10),
        runSpacing: ScreenAdaptUtils.px(10),
        children: hotList.map((item) {
          return Card(
            margin: EdgeInsets.all(0),
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  print('name == ${item.fullName}');
                },
                splashColor: Color(0xFFCCCCCC),
                child: Container(
                  width: ScreenAdaptUtils.px(230),
                  height: ScreenAdaptUtils.px(90),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenAdaptUtils.px(20))),
                  ),
                  child: Text(
                    item.fullName,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenAdaptUtils.px(28),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Widget _cityItem(BuildContext context, CityListEntity item,
    CityListEntity prevItem, GlobalKey globalKey) {
  return Column(
    key: globalKey,
    children: <Widget>[
      (item.fullName == prevItem.fullName || item.initial != prevItem.initial)
          ? Container(
              color: Color(0xFFF5F5F5),
              height: ScreenAdaptUtils.px(60),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(25),
              ),
              child: Text(
                item.initial,
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(28),
                  color: Color(0xFF333333),
                ),
              ),
            )
          : Container(),
      Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            cityEventBus.fire(CityEvent(item.code, item.fullName));
            Navigator.pop(context);
          },
          splashColor: Color(0xFFCCCCCC),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(25),
            ),
            height: ScreenAdaptUtils.px(90),
            child: Text(
              item.fullName,
              style: TextStyle(
                fontSize: ScreenAdaptUtils.px(28),
                color: Color(0xFF333333),
              ),
            ),
          ),
        ),
      ),
      Divider(
        height: ScreenAdaptUtils.onePX(),
        color: Color(0xFFE5E5E5),
      ),
    ],
  );
}
