import 'package:flutter/material.dart';
import 'package:flutter_trip/base/dao/travel_tab_dao.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:flutter_trip/pages/travel/travel_tab_page.dart';
import 'package:underline_indicator/underline_indicator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>  with SingleTickerProviderStateMixin{

  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

   @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then((TravelTabModel model) {
      _controller = TabController(
          length: model.tabs.length, vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              indicator: UnderlineIndicator(
                strokeCap:StrokeCap.round,
                 borderSide: BorderSide(
                    color: Color(0xff2fcfbb),
                    width: 3,
                ),
                insets: EdgeInsets.fromLTRB(10, 5, 10, 2)
              ),
              tabs: tabs.map<Tab>((TravelTab tab) {
                return Tab(
                  text: tab.labelName,
                );
              }).toList(),
            ),
          ),
          Flexible(
            child: TabBarView(
                controller: _controller,
                children: tabs.map((TravelTab tab) {
                  return TravelTabPage(
                    travelUrl: travelTabModel.url,
                    params: travelTabModel.params,
                    groupChannelCode: tab.groupChannelCode,
                  );
                }).toList()))
        ],
      )
    );
  }






}
