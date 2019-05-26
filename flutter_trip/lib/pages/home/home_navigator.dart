import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/base/dao/home_dao.dart';

import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/base/search_bar.dart';
import 'package:flutter_trip/widget/home/gird_nav.dart';
import 'package:flutter_trip/widget/home/localNav.dart';
import 'package:flutter_trip/widget/home/sub_nav.dart';
import 'package:flutter_trip/widget/home/sales_box.dart';

import 'package:flutter_trip/base/util/navigator_util.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';



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
      // appBar: AppBar(
      //   elevation: 0.5,
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.white,
      // ),
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
              child:_list
          )
        ),
        _appBar,
      ],
    ));
  }


  Widget get _list {
     return ListView(
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
            );
  }


  Widget get _appBar {
    
    return Column(
      
      children: <Widget>[
        Container(
          
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((_AppBarAlfa * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: _AppBarAlfa > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
            height: _AppBarAlfa > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  
  void _onScroll(double offset) {
    print(offset);
    setState(() {
      double alpha = offset/ APPBAR_SCROLL_OFFSET;
      if (alpha < 0) {
        _AppBarAlfa = 0;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else if(alpha > 1) {
        _AppBarAlfa = 1;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      } else {
        _AppBarAlfa = alpha;
      }
    });
    
  }

  _jumpToSearch() {
    // NavigatorUtil.push(
    //     context,
    //     SearchPage(
    //       hint: SEARCH_BAR_DEFAULT_TEXT,
    //     ));
  }

  _jumpToSpeak() {
    // NavigatorUtil.push(context, SpeakPage());
  }

  

}
