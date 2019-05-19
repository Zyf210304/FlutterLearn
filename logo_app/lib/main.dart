import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


void main() => runApp(LogoApp());


class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
  
}


class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition  extends StatelessWidget {
  GrowTransition({this.animation, this.child});
  final Widget child;
  final Animation<double> animation;

  
  @override
  Widget build(BuildContext context) =>Center(
     child: AnimatedBuilder(
       animation: animation,
       builder: (context, chilid) => Container(
         width: animation.value,
         height: animation.value,
         child: chilid,
       ),
       child: child,
     ),
    );
  }







// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

// class AnimatedLogo extends AnimatedWidget {
  
//   AnimatedLogo({Key, key, Animation<double> animation})
//     :super(key: key, listenable:animation);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     final Animation<double> animation = listenable;
//     return Center (child: Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       height: animation.value,
//       width: animation.value,
//       child: FlutterLogo(),
//     ),);
//   }

// }










class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  // AnimationStatus animationStatus;
  // double animationValue;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  //   ..addListener((){
  //     setState(() {
  //       animationValue = animation.value; 
  //     });
      
  //   })
  //   ..addStatusListener((AnimationStatus state){
  //     setState(() {
  //       animationStatus = state;
  //     });
  //   });
  }


  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    // TODO: implement build

    return GrowTransition(animation: animation,child: LogoWidget(),);
    // return Container(
    //   margin: EdgeInsets.only(top: 20),
    //   color: Colors.white,
    //   child: Column(
    //     children: <Widget>[
    //       GestureDetector(
    //         onTap: (){
    //           controller.reset();
    //           controller.forward();
    //         },
    //         child: Text('Start', textDirection: TextDirection.ltr,style: TextStyle(color: Colors.orange)),
    //       ),
    //       Text('state:' + animationStatus.toString(), textDirection: TextDirection.ltr, style: TextStyle(color: Colors.red),),
    //       Text('value:' + animationValue.toString(), textDirection: TextDirection.ltr,style: TextStyle(color: Colors.blue)),
    //       Container(
    //         height: animation.value,
    //         width: animation.value,
    //         child: FlutterLogo(),
    //       )
    //     ],
    //   ),
    // );
  }

}