import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/base/dao/home_dao.dart';

import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/home/gird_nav.dart';
import 'package:flutter_trip/widget/home/localNav.dart';
import 'package:flutter_trip/widget/home/sub_nav.dart';
import 'package:flutter_trip/widget/home/sales_box.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1162515837,489851842&fm=27&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=117558537,4256152717&fm=27&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=221333234,4234408460&fm=27&gp=0.jpg',
  ];
  double _AppBarAlfa = 0;
  List<LocalNavListModel> localNavList = [];
  String resultString = '';
  GridNavModel gridNav;
  List<SubNavListModel> subNavList = [];
  SalesBoxModel salesBoxModel;
  HomeModel homeModel;

  @override
  void initState() {
    super.initState();
    loadData();
  }

loadData() async{
  // HomeDao.fetch().then((result){
    // setState(() {
    //   resultString = json.encode(result);
    // });
  // }).catchError((error){
    // setState(() {
    //   resultString = error.toString();
    // });
  // });
  try {
    homeModel = await HomeDao.homeFetch();
    setState(() {
      resultString = json.encode(homeModel);
      localNavList = homeModel.localNavList;
      gridNav = homeModel.gridNav;
      subNavList = homeModel.subNavList;
      salesBoxModel = homeModel.salesBox;
    });
  } catch(error) {
    setState(() {
      resultString = error.toString();
    });
  }
  


}








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      onTap: (index) {
                        print(index);
                      },
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Padding(
                    child:LocalNav(gridNavList:localNavList),
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                  ),
                  Padding(
                    child:GirdNav(gridNavModel:gridNav),
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                  ),
                  
                  Padding(
                    child:SubNav(subNavList:subNavList),
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                  ),
                  
                  Padding(
                     padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                      child: SalesBox(salesBox: salesBoxModel)
                  ),

                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text(
                        resultString,
                      ),
                    ),
                  )
              ],
            ),
          )
        ),
        Opacity(
          child:Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top:20),
                child: Text('首页'),
              )
            ,),
          ), 
          opacity: _AppBarAlfa,
        ),
      ],
    ));
  }

  void _onScroll(double offset) {
    print(offset);
    setState(() {
      double alpha = offset/ APPBAR_SCROLL_OFFSET;
      if (alpha < 0) {
        _AppBarAlfa = 0;
      } else if(alpha > 1) {
        _AppBarAlfa = 1;
      } else {
        _AppBarAlfa = alpha;
      }
    });
    
  }



}
