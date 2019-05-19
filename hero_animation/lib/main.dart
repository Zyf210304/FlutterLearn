import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;
import 'dart:core';


void main() => runApp(MaterialApp(home: RadiaExpansionDemo(),));

class  Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const Photo({Key key, this.photo, this.onTap, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: width,
    //   child: Hero(tag: photo,child: Material(
    //     color: Colors.transparent,
    //     child: Material(child: InkWell(
    //       onTap: onTap,
    //       child: Image.network(photo, fit: BoxFit.contain,),
    //     ),)
    //   ),)
    // );

    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(builder: (context, size){
          return Image.network(
            photo,
            fit:BoxFit.contain, );
        },),),
      );
  }

}


class RadiaExpansion extends StatelessWidget {

  const RadiaExpansion({
    Key key, 
    this.maxRadious,
    this.child}) : clipRectSize = 2.0 * (maxRadious / math.sqrt2) , super(key: key);

  final double maxRadious;
  final clipRectSize;
  final Widget child;

  
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,),
        ),
      ),
    );
  }
}


class RadiaExpansionDemo extends StatelessWidget {

  static const double KMinRadious = 32.0;
  static const double KMaxRadious = 128.0;

  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin:begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container (
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: KMaxRadious * 2,
                height:  KMaxRadious * 2,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadiaExpansion(
                    maxRadious: KMaxRadious,
                    child: Photo(
                      photo: imageName,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      height: KMinRadious,
      width: KMinRadious,
      child: Hero(
        tag: imageName,
        createRectTween: _createRectTween,
        child: RadiaExpansion(
          maxRadious: KMaxRadious,
          child: Photo(
            photo: imageName,
            onTap: (){
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),);
                      },
                    );
                  }
                )
              );
            },
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(title: Text('Animation',) 
      ), 
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: FractionalOffset.bottomLeft,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(context, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1087712210,1281863657&fm=27&gp=0.jpg', '路飞'),
            _buildHero(context, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558268012557&di=a4d12d4dd368a4d427e2efd03794add3&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F3db85310423c8a44cdbfebeb0830a93922439209.jpg', '萨博'),
            _buildHero(context, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3227451899,63150053&fm=26&gp=0.jpg', '艾斯'),
          ],
        ),
      )
    );
  }
}




class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(title: Text('Base Hero Animation',) 
      ), body: Center(
        child: Photo(
          photo: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2481069818,245853480&fm=27&gp=0.jpg',
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Scaffold(
                  appBar: AppBar(title: const Text('Flippers Page'),),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: Photo(
                      photo: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2481069818,245853480&fm=27&gp=0.jpg',
                      width: 100,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),),
                ); 
            }));
          },
        ),
        ),
    );
  }
}

