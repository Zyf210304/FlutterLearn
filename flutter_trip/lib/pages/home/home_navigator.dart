import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrl = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1162515837,489851842&fm=27&gp=0.jpg',
    'https://www.baidu.com/link?url=UIqkFBi4ro_mH5Rd8fJ2AXt0aDRDjJeo0UU0uk0GPybKL09U0m_sDqy67b5ScF_dj0BRoS90ybJPis6e6ARRuYsYH8S8v__yq9iSNKkh_MJ6PSfemcDbsQsPHLDRiJ9cphTub2VlIKVc79JG-bEiGvyHJdaND5y7SOkwsey2Kdy8a89v0DmEDvcEtgScB20Wfwxp3kFQog1dU7inlizpD1q0GBxTz7QiHNd5YbWtm9995cNN8JVPmsZKwvOBy2LmKK4ND4iZJloAPMHqb_vTLoeLgLjeAe2oCZlDan8T-k6pP8J8BLlKth_jcngEKYFp60EBgp-rVnXplcP4u4yxCQJWciC2cPLoSZorJjKK9wRGvTndReMmCmvUGNS9sZgSMDDM4z1-WhMoRpoM7VKQGpkfdYYzpqJUwF08O7-QKpg07oBzbxXEcC5V6swg3luDR2EgQH4wGTxTBZctc2_DDFcJYl9CDZ9-udC4E144FleO3HbJdxBki0nxTceYxHqCWvwlfb-D_H5tl0UUTE4tRDbTve87gJPYKJuWwPojLaH0gNGxY8pIzHWMk2ZhLBr3_4vutuc5olmBKWb7X08Ngjs8ANHrctFT9koSL1EKp8zzV7rLEkEHoWmJlLyBB9p5Y99odcLrZ5KauZ-Vzi6S3a&timg=https%3A%2F%2Fss0.bdstatic.com%2F94oJfD_bAAcT8t7mm9GUKT-xh_%2Ftimg%3Fimage%26quality%3D100%26size%3Db4000_4000%26sec%3D1558332171%26di%3Df0c0dee3372f9cb08a8b7656c0fefb10%26src%3Dhttp%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F58a3b64a53d1a.jpg&click_t=1558332188335&s_info=1163_664&wd=&eqid=98c98be30005ff75000000045ce2430a',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=221333234,4234408460&fm=27&gp=0.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Swiper(
                itemCount: _imageUrl.length,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
