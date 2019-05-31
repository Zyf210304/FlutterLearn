import 'package:dartin/dartin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo/helper/dialog.dart';
import 'package:mvvm_demo/helper/toast.dart';
import 'package:mvvm_demo/helper/widget_utils.dart';
import 'package:mvvm_demo/view/base.dart';
import 'package:mvvm_demo/viewmodel/home_provide.dart';
import 'package:provide/provide.dart';


class HomePage extends PageProvideNode {
  
  final String title;

  HomePage(this.title){
    final provide = inject<HomeProvide>(params: [title]);
    mProviders.provideValue(provide);
  }
  

  @override
  Widget buildContent(BuildContext context) {
    
    return _HomeContentPage();
  }
}

class _HomeContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeContentState();
  }
}

class _HomeContentState extends State<_HomeContentPage> with SingleTickerProviderStateMixin<_HomeContentPage> implements Presenter {

  HomeProvide mProvide;

  AnimationController _controller;
  Animation<double> _animation;

  static const ACTION_LOGIN = 'login';

  final LoadingDialog loadingDialog = LoadingDialog();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 295.0, end: 48.0).animate(_controller)
    ..addListener((){
      mProvide.btnWidth = _animation.value;
    });
  }

  @override
  void dispose() {
    print('-------dispose-------');
    _controller.dispose();
    super.dispose();
  }

  

  @override
  void onClick(String action) {
    // TODO: implement onClick
    if(action == ACTION_LOGIN) {
      login();
    }
  }

  void login() {
    final s = mProvide.login().doOnListen((){
      _controller.forward();
    }).doOnDone((){
      _controller.reverse();
    }).doOnCancel((){
      print("======cancel======");
    }).listen((_){
      Toast.show("login success", context, type: Toast.SUCCESS);
    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    mProvide.addSubscription(s);
  }

  @override
  Widget build(BuildContext context) {
    mProvide = Provide.value<HomeProvide>(context);
    print('--------build--------');
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(mProvide.title),
        ),
        
        body: DefaultTextStyle(
          style: TextStyle(color: Colors.black),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.person),
                  labelText: 'Account',
                ),
                autofocus: false,
                onChanged: (str) => mProvide.username = str,
              ),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autofocus: false,
                onChanged: (str) => mProvide.password = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
              ),

              const Text(
                "Response:",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),

            ],
          ),
        ),
        
      ),
    );
  }

  Provide<HomeProvide> bulidLoginBtnProvide() {
    return Provide<HomeProvide>(
      builder: (BuildContext context, Widget child, HomeProvide value){
        return CupertinoButton(
          onPressed: value.loading ? null :() => onClick(ACTION_LOGIN),
          pressedOpacity: 0.8,
          child: Container(
            alignment: Alignment.center,
            width: value.btnWidth,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              gradient: LinearGradient(colors: [
                            Color(0xFF686CF2),
                            Color(0xFF0E5CFF),
               ]),
              boxShadow: [
                BoxShadow(color: Color(0x4D5E56FF), offset: Offset(0.0, 4.0), blurRadius: 13.0)
              ]   
            ),

          ),
        );
      },
    );
  }

  Widget buildLoginChild(HomeProvide value) {
    if (value.loading) {
      return const CircularProgressIndicator();
    } else {
      return const FittedBox(
        fit: BoxFit.scaleDown,
        child: const Text(
          'Login With Github Account',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
        ),
      );
    }
  }





}



