import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Toast {

  static const int LENGTH_SHORT = 1;
  static const int LENGTH_LONG = 2;
  static const int BOTTOM = 0;
  static const int CENTER = 1;
  static const int TOP = 2;
  static const int ERROR = -1;
  static const int NORMAL = 0;
  static const int SUCCESS = 1;

  static void show(String msg, BuildContext context,
  {
    int type = NORMAL,
    int duration = 1,
    int gravity = CENTER,
    Color backgroundColor = const Color(0xAA000000),
    Color textColor = Colors.white,
    double backgroundRadius = 5.0

  }){
    
    ToastView.dismiss();
    ToastView.createView(msg, context, type, duration, gravity, backgroundColor, textColor, backgroundRadius);

  }

}

class ToastView {
  static final ToastView _singleton = ToastView._internal();
  ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  static OverlayState overlayState;
  static OverlayEntry overlayEntry;
  static bool _isVisible = false;

  static void createView (
      String msg,
      BuildContext  context,
      int type,
      int duration,
      int gravity,
      Color backgroundColor,
      Color textColor,
      double backgroundRadius
  ) async {
    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry (
      builder: (BuildContext context) => ToastWidget( 
        gravity: gravity,
        widget: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(backgroundRadius)
            ),
            child: _buildContent(type, msg, textColor),
            ),
        ),
      )
    );

    _isVisible = true;
    overlayState.insert(overlayEntry);
    await new Future.delayed(
        Duration(seconds: duration == null ? Toast.LENGTH_SHORT : duration)
    );
    dismiss();
  }

  static dismiss() async {
      if(_isVisible) return;
      _isVisible = false;
      overlayEntry?.remove();
  }

  static Widget _buildContent(int type, String msg, Color textColor) {
    if(type == 0) {
      return Text(msg,
          maxLines: 20,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: textColor,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(type ==1 ?Icons.check_circle:Icons.error,color: Colors.white,),
          Padding(padding: EdgeInsets.only(top: 16.0),),
          Text(msg,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal))
        ],
      );
    }
  }

} 







class ToastWidget extends StatelessWidget {

  final Widget widget;
  final int gravity;

  const ToastWidget({Key key, this.widget, this.gravity}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: gravity == 2 ? 50 : null,
      bottom: gravity == 0 ? 50 : null,
      child: widget,
    );
  }
}