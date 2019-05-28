import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/utils/NavigatorUtils.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'ReservePage.dart';
import 'dart:ui';

class CarDetailsPage extends StatefulWidget {
  final String tag;

  CarDetailsPage({Key key, this.tag}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CarDetailsPageState();
  }
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  final List<String> _bannerList = List()
    ..add("http://via.placeholder.com/350x150")
    ..add("http://via.placeholder.com/350x150")
    ..add("http://via.placeholder.com/350x150");
  final ScrollController _controller = ScrollController();
  bool _visibleTitle = false;
  GlobalKey _myKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset >= ScreenAdaptUtils.px(380)) {
        setState(() {
          _visibleTitle = true;
        });
      } else {
        setState(() {
          _visibleTitle = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              controller: _controller,
              headerSliverBuilder: (context, index) {
                return <Widget>[
                  SliverAppBar(
                    primary: true,
                    pinned: true,
                    leading: IconButton(
                      icon: Image.asset(
                        _visibleTitle
                            ? 'images/ic_back.png'
                            : 'images/ic_back_white.png',
                        width: ScreenAdaptUtils.px(45),
                        height: ScreenAdaptUtils.px(45),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    expandedHeight: ScreenAdaptUtils.px(500),
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        _visibleTitle ? '车辆详情' : '',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: ScreenAdaptUtils.px(36),
                        ),
                      ),
                      background: Hero(
                        tag: "Hero${widget.tag}",
                        child: Swiper(
                          key: _myKey,
                          itemCount: _bannerList.length,
                          pagination: SwiperPagination(),
                          itemBuilder: (context, index) {
                            return Image.network(
                              _bannerList[index],
                              height: ScreenAdaptUtils.px(500),
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: Center(
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("$index"),
                      );
                    }),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: ScreenAdaptUtils.px(100),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      print("${_myKey.currentContext.size}");
                      debugPrint("点击了收藏");
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenAdaptUtils.px(8),
                            bottom: ScreenAdaptUtils.px(0),
                          ),
                          child: Icon(
                            Icons.home,
                            size: ScreenAdaptUtils.px(50),
                          ),
                        ),
                        Text(
                          "收藏",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(28),
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      NavigatorUtils.intent(context, ReservePage(), null);
                    },
                    child: Container(
                      color: Color(0XFF196FD5),
                      alignment: Alignment.center,
                      child: Text(
                        "立即预约",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenAdaptUtils.px(36),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
