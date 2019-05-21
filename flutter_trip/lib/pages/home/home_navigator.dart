import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text(
                        '哈哈',
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
