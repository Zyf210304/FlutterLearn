import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hu_bei_e_car/entity/HomePageEntity.dart';
import 'package:hu_bei_e_car/http/Api.dart';
import 'package:hu_bei_e_car/utils/ScreenAdaptUtils.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> {
  final List<String> _list = List();
  final ScrollController _controller = ScrollController();
  Future future;
  int _page = 1;
  bool _loadmore = false;

  Future<List<String>> _getData() async {
    Dio dio = new Dio();
    Response response = await dio.post(Api.HOME_PAGE);
    var map = json.decode(response.data);
    var res = map["response"];
    var status = res["status"];
    print("${status['code']}");
    HomePageEntity homePageEntity = HomePageEntity.fromJson(res["data"]);

    _loadmore = false;

    if (_page == 1) {
      _list.clear();
      print("我是下拉刷新回调的");
    } else {
      print("我是上拉加载回调的");
    }
    _list.addAll(List<String>(10));
    print("集合的长度 == ${_list.length}");
    return _list;
  }

  Widget _futureWidget() {
    return FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return _findPage(context, _list);
        }
        return null;
      },
      future: future,
    );
  }

  Future refresh() async {
    setState(() {
      _page = 1;
      future = _getData();
    });
  }

  Future loadmore() async {
    setState(() {
      _loadmore = true;
      _page++;
      future = _getData();
    });
  }

  @override
  void initState() {
    future = _getData();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑动到了最底部');
        loadmore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _futureWidget();
  }

  _findPage(BuildContext context, List<String> list) {
    return SafeArea(
      top: true,
      child: RefreshIndicator(
        onRefresh: refresh,
        child: new CustomScrollView(
          controller: _controller,
          shrinkWrap: true,
          slivers: <Widget>[
            _headerItem(context),
            SliverFixedExtentList(
              itemExtent: ScreenAdaptUtils.px(210),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _infoItem(list[index]),
                childCount: list.length,
              ),
            ),
            SliverToBoxAdapter(
              child: !_loadmore
                  ? Container()
                  : Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: ScreenAdaptUtils.px(130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenAdaptUtils.px(30),
                            ),
                            child: Text("正在加载..."),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _headerItem(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenAdaptUtils.px(20),
            color: Color(0xFFF1F1F1),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: ScreenAdaptUtils.px(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _list.clear();
                        _list.addAll(List<String>(100));
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          size: ScreenAdaptUtils.px(96),
                        ),
                        Text(
                          "宣传素材${_page}",
                          style: TextStyle(
                            fontSize: ScreenAdaptUtils.px(28),
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: ScreenAdaptUtils.px(96),
                      ),
                      Text(
                        "平台活动",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(28),
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: ScreenAdaptUtils.px(96),
                      ),
                      Text(
                        "宣传素材",
                        style: TextStyle(
                          fontSize: ScreenAdaptUtils.px(28),
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenAdaptUtils.px(20),
            color: Color(0xFFF1F1F1),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenAdaptUtils.px(94),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: ScreenAdaptUtils.px(30),
            ),
            child: Text(
              "最新资讯",
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: ScreenAdaptUtils.px(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _infoItem(String item) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      Container(
        color: Colors.white,
        height: ScreenAdaptUtils.px(210),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenAdaptUtils.px(30),
                ),
                child: Text(
                  "data",
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: ScreenAdaptUtils.px(24),
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenAdaptUtils.px(30),
                right: ScreenAdaptUtils.px(30),
              ),
              child: Image.network(
                "http://via.placeholder.com/350x150",
                width: ScreenAdaptUtils.px(224),
                height: ScreenAdaptUtils.px(140),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      Divider(
        height: ScreenAdaptUtils.onePX(),
        color: Color(0xFFE5E5E5),
      ),
    ],
  );
}
