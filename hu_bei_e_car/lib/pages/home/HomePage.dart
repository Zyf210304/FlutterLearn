import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hu_bei_e_car/dialog/CarStoreAddress.dart';
import 'package:hu_bei_e_car/event_bus/CityEvent.dart';
import 'package:hu_bei_e_car/pages/choosecar/CarDetailsPage.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:math';
import 'package:hu_bei_e_car/http/HttpUtils.dart';
import 'package:hu_bei_e_car/http/Api.dart';
import 'package:hu_bei_e_car/entity/HomePageEntity.dart';
import 'package:hu_bei_e_car/utils/StringUtils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<String> _bannerList = List();
  final List<BrandEntity> _brandList = List();
  String _adPic = "";
  final List<String> _featuredCarList = List();
  final List<ShareEntity> _shareCarList = List();
  final List<String> _hotCarList = List();
  TabController _controller;
  String _city = '杭州市';
  String _newValue = '语文';
  final List<String> _bottomTextList = ["超低首付", "1成首付", "2成首付"];
  final List<String> _bottomCarList = List()
    ..add("test1")
    ..add("test2")
    ..add("test3")
    ..add("test4")
    ..add("test5");

  @override
  void initState() {
    _controller = TabController(
      vsync: this,
      length: _bottomTextList.length,
    );
    cityEventBus.on<CityEvent>().listen((event) {
      setState(() {
        _city = event.name;
      });
    });
    _getData();
    super.initState();
  }
// 720 1080
/*
  720  / 750 = 0.96 * 300 = 288 / 720  = 0.4
  1080 / 750 = 1.44 * 300 = 432 / 1080 = 0.4
 */
  void _getData() async {
    await HttpUtils().post(Api.HOME_PAGE, null, (data) {
      setState(() {
        _brandList.clear();
        HomePageEntity homePageEntity = HomePageEntity.fromJson(data);
        _brandList.addAll(homePageEntity.brandList);
        _brandList.add(BrandEntity(
            brandId: 0, brandName: "更多", logo: "images/ic_back.png"));
        _shareCarList.clear();
        _shareCarList.addAll(homePageEntity.shareList);

        _hotCarList.clear();
      });
    }, (msg) {});
  }

  void _getBottomData({index: 0}) {
    // print("$index");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: ScreenAdaptUtils.px(88),
            child: Row(
              children: <Widget>[
                GestureDetector(
                    
                    child:Container(
                      padding: EdgeInsets.only(left:10),
                      child: Text(
                      _city,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: ScreenAdaptUtils.px(28),
                      ),
                    ),
                    ),
                    

                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CarStoreAddress(_newValue, (value) {
                              _newValue = value;
                              Navigator.pop(context);
                            });
                          });
                    }),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("search car page");
                    },
                    child: Container(
                      height: ScreenAdaptUtils.px(60),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius:
                            BorderRadius.circular(ScreenAdaptUtils.px(60)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenAdaptUtils.px(16),
                              right: ScreenAdaptUtils.px(16),
                            ),
                            child: Image.asset(
                              "images/ic_username.png",
                              width: ScreenAdaptUtils.px(40),
                              height: ScreenAdaptUtils.px(40),
                            ),
                          ),
                          Text(
                            "想买什么车？",
                            style: TextStyle(
                              fontSize: ScreenAdaptUtils.px(28),
                              color: Color(0xFF888888),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("点击了拨打电话");
                  },
                  highlightColor: Colors.white,
                  iconSize: ScreenAdaptUtils.px(88),
                  padding: EdgeInsets.all(0),
                  icon: ImageIcon(
                    AssetImage("images/ic_username.png"),
                    size: ScreenAdaptUtils.px(40),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height:
                        _bannerList.length == 0 ? 0 : ScreenAdaptUtils.px(275),
                    child: Swiper(
                      itemCount: _bannerList.length,
                      pagination: SwiperPagination(),
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          _bannerList[index],
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                SliverGrid.count(
                  crossAxisCount: 5,
                  children: _brandList.map((item) => _brandItem(item)).toList(),
                ),
                SliverToBoxAdapter(
                  child: StringUtils.isEmpty(_adPic)
                      ? Container()
                      : Column(
                          children: <Widget>[
                            Container(
                              height: ScreenAdaptUtils.px(20),
                              color: Color(0xFFF5F5F5),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(ScreenAdaptUtils.px(25)),
                              child: GestureDetector(
                                child: Container(
                                  child: Image.network(
                                    "http://via.placeholder.com/350x150",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                _commonTitle(" 精选好车 ", _featuredCarList.length == 0),
                SliverGrid.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  children: _featuredCarList
                      .map((item) => _featuredCarItem(item))
                      .toList(),
                ),
                _commonTitle(" 车主晒单 ", _shareCarList.length == 0),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    Container(
                      color: Colors.white,
                      height: _shareCarList.length == 0
                          ? 0
                          : ScreenAdaptUtils.px(340),
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: ScreenAdaptUtils.px(10),
                            right: ScreenAdaptUtils.px(10),
                            bottom: ScreenAdaptUtils.px(20),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: _shareCarList.length,
                          itemBuilder: (context, index) {
                            return _shareCarItem(_shareCarList[index]);
                          }),
                    ),
                  ]),
                ),
                _commonTitle(" 热门车型 ", _hotCarList.length == 0),
                SliverFixedExtentList(
                  itemExtent: ScreenAdaptUtils.px(340),
                  delegate: SliverChildListDelegate(
                      _hotCarList.map((item) => _hotCarItem(item)).toList()),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    maxHeight: ScreenAdaptUtils.px(100),
                    minHeight: ScreenAdaptUtils.px(100),
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: _controller,
                        tabs: _bottomTextList.map((item) {
                          return Container(
                            alignment: Alignment.center,
                            height: ScreenAdaptUtils.px(100),
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(28),
                                color: Color(0xFF333333),
                              ),
                            ),
                          );
                        }).toList(),
                        indicatorPadding: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(72),
                          right: ScreenAdaptUtils.px(72),
                        ),
                        labelColor: Color(0xFF333333),
                        indicatorColor: Color(0XFF4275F1),
                        onTap: (index) {
                          print("index == $index");
                        },
                      ),
                    ),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: ScreenAdaptUtils.px(276),
                  delegate: SliverChildListDelegate(
                    _bottomCarList
                        .map((item) => _bottomCarItem(context, item))
                        .toList(),
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

Widget _brandItem(BrandEntity item) {
  return GestureDetector(
    onTap: () {
      const jumpPlugin = const MethodChannel('test');
      jumpPlugin.invokeMethod('testActivity').then((result) {
        print(result);
      });
      print("点击了车辆品牌");
    },
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: ScreenAdaptUtils.px(14),
      ),
      child: Column(
        children: <Widget>[
          item.brandId == 0
              ? Image.asset(
                  item.logo,
                  width: ScreenAdaptUtils.px(40),
                  height: ScreenAdaptUtils.px(40),
                )
              : Image.network(
                  item.logo,
                  width: ScreenAdaptUtils.px(40),
                  height: ScreenAdaptUtils.px(40),
                ),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdaptUtils.px(14)),
            child: Text(
              item.brandName,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: ScreenAdaptUtils.px(28),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _commonTitle(String text, bool invisible) {
  return SliverToBoxAdapter(
    child: invisible
        ? Container()
        : Column(
            children: <Widget>[
              Container(
                height: ScreenAdaptUtils.px(20),
                color: Color(0xFFF5F5F5),
              ),
              Container(
                color: Colors.white,
                height: ScreenAdaptUtils.px(120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/ic_home_title_left.png",
                      width: ScreenAdaptUtils.px(50),
                      height: ScreenAdaptUtils.px(15),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: ScreenAdaptUtils.px(32),
                        color: Color(0xFF3333333),
                      ),
                    ),
                    Image.asset(
                      "images/ic_home_title_right.png",
                      width: ScreenAdaptUtils.px(50),
                      height: ScreenAdaptUtils.px(15),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}

Widget _featuredCarItem(String item) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(
      left: ScreenAdaptUtils.px(25),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "福特福睿斯",
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF6666666),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5A78FF), Color(0XFF5AA8FF)],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenAdaptUtils.px(10),
              ),
            ),
          ),
          margin: EdgeInsets.only(
            top: ScreenAdaptUtils.px(10),
            bottom: ScreenAdaptUtils.px(10),
          ),
          padding: EdgeInsets.only(
            left: ScreenAdaptUtils.px(10),
            top: ScreenAdaptUtils.px(5),
            right: ScreenAdaptUtils.px(10),
            bottom: ScreenAdaptUtils.px(5),
          ),
          child: Text(
            "首付0.97万",
            style: TextStyle(
              fontSize: ScreenAdaptUtils.px(28),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "2809元/月",
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF425CEF),
          ),
        ),
        Image.network(
          "http://via.placeholder.com/350x150",
          width: ScreenAdaptUtils.px(150),
          height: ScreenAdaptUtils.px(120),
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}

Widget _hotCarItem(String item) {
  return Column(
    children: <Widget>[
      Container(
        color: Colors.red,
        height: ScreenAdaptUtils.px(250),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.fill,
              width: 360,
            ),
            Positioned(
              left: ScreenAdaptUtils.px(25),
              top: ScreenAdaptUtils.px(25),
              child: Image.network(
                "http://via.placeholder.com/350x150",
                color: Colors.red,
                fit: BoxFit.fill,
                width: ScreenAdaptUtils.px(100),
                height: ScreenAdaptUtils.px(100),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: ScreenAdaptUtils.px(40)),
              width: ScreenAdaptUtils.px(265),
              height: ScreenAdaptUtils.px(90),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenAdaptUtils.px(10)),
                    bottomLeft: Radius.circular(ScreenAdaptUtils.px(10)),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF8059), Color(0xFFFF5E59)],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenAdaptUtils.px(10),
                              bottom: ScreenAdaptUtils.px(10),
                            ),
                            child: Text(
                              "首付",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(22),
                                color: Color(0xFFFDE1D5),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: "0.43",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(28),
                                  color: Color(0xFFFEE4AC),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " 万",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(18),
                                  color: Color(0xFFFEE4AC),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenAdaptUtils.px(10),
                              bottom: ScreenAdaptUtils.px(10),
                            ),
                            child: Text(
                              "月付",
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(22),
                                color: Color(0xFFFDE1D5),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: "1865",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(28),
                                  color: Color(0xFFFEE4AC),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " 元",
                                style: TextStyle(
                                  fontSize: ScreenAdaptUtils.px(18),
                                  color: Color(0xFFFEE4AC),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        height: ScreenAdaptUtils.px(90),
        padding: EdgeInsets.only(left: ScreenAdaptUtils.px(20)),
        child: Text(
          "item",
          style: TextStyle(
            fontSize: ScreenAdaptUtils.px(28),
            color: Color(0xFF333333),
          ),
        ),
      ),
    ],
  );
}

Widget _shareCarItem(ShareEntity item) {
  return Container(
    width: ScreenAdaptUtils.px(250),
    margin: EdgeInsets.only(
      left: ScreenAdaptUtils.px(10),
      right: ScreenAdaptUtils.px(10),
    ),
    child: Card(
      margin: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Image.network(
            item.coverPic,
            height: ScreenAdaptUtils.px(200),
            fit: BoxFit.fill,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenAdaptUtils.px(25),
                left: ScreenAdaptUtils.px(10),
                right: ScreenAdaptUtils.px(10),
              ),
              child: Text(
                item.title,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenAdaptUtils.px(24),
                  color: Color(0xFF333333),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _bottomCarItem(BuildContext context, String item) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CarDetailsPage(tag: item)));
    },
    child: Hero(
      tag: "Hero$item",
      child: Container(
        color: Colors.white,
        height: ScreenAdaptUtils.px(275),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: ScreenAdaptUtils.px(23)),
                  child: Image.network(
                    "http://via.placeholder.com/350x150",
                    width: ScreenAdaptUtils.px(236),
                    height: ScreenAdaptUtils.px(236),
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: ScreenAdaptUtils.px(44),
                          top: ScreenAdaptUtils.px(50),
                        ),
                        width: ScreenAdaptUtils.px(420),
                        child: Text(
                          "2018款 科沃兹 320 自动欣赏天窗版",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenAdaptUtils.px(26),
                            color: Color(0xFF505050),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenAdaptUtils.px(46),
                        bottom: ScreenAdaptUtils.px(50),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              width: ScreenAdaptUtils.px(267),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "首付9000元",
                                    style: TextStyle(
                                      fontSize: ScreenAdaptUtils.px(24),
                                      color: Color(0xFFA7A7A7),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenAdaptUtils.px(8),
                                      top: ScreenAdaptUtils.px(14),
                                    ),
                                    child: Text(
                                      "首付 5679元",
                                      style: TextStyle(
                                        fontSize: ScreenAdaptUtils.px(28),
                                        color: Color(0xFF3A74FF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            width: ScreenAdaptUtils.px(164),
                            height: ScreenAdaptUtils.px(47),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF3A74FF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenAdaptUtils.px(6)),
                              ),
                            ),
                            child: Text(
                              '立即抢购',
                              style: TextStyle(
                                fontSize: ScreenAdaptUtils.px(22),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: ScreenAdaptUtils.px(37),
              top: ScreenAdaptUtils.px(30),
              child: Image.network(
                "http://via.placeholder.com/350x150",
                width: ScreenAdaptUtils.px(100),
                height: ScreenAdaptUtils.px(100),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: Divider(
                height: ScreenAdaptUtils.onePX(),
                color: Color(0xFFE5E5E5),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
