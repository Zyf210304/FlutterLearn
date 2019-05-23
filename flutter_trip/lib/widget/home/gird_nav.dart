
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/widget/webView/web_view.dart';

class GirdNav extends StatelessWidget {

  final GridNavModel gridNavModel;

  const GirdNav({Key key, @required  this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel (
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
      children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];

    if(gridNavModel == null) return items;

    if(gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel,true));
    }

    if(gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.flight,false));
    }

    if(gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel,false));
    }

    return items;

  }


  _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2, true));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4, false));

    List<Widget> exandItems =[];
    items.forEach((item) {
      exandItems.add(Expanded(
        flex: 1,
        child:item,
      ));
    });

    Color startColor = Color(int.parse('0xff' + gridNavItem.startColor));
    Color endColor = Color(int.parse('0xff' + gridNavItem.endColor));
    return Container (
      height: 88,
      margin: first ? null :EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        //先行渐变
        gradient: LinearGradient(colors: [startColor, endColor])
      ),
      child: Row(
        children: exandItems,
      ),
    );

  }

  _mainItem(BuildContext context, MainItemModel  model) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> 
            WebView(
              url: model.url, 
              title: model.title,
              statusBarColor: model.statusBarColor,
             )
          )
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Image.network(model.icon,
          fit:BoxFit.contain,
          height: 88,
          width: 121,
          alignment: AlignmentDirectional.bottomEnd,
          ),
          Container(
            margin: EdgeInsets.only(top:5),
            child: Text(model.title, style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
          
        ],
      ),
    );
  }

  _doubleItem(BuildContext context, ItemModel topmodel, ItemModel bottomModel, bool isCenter) {
    
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topmodel, true, isCenter),
        ),
        Expanded(
          child: _item(context, bottomModel, false, isCenter),
        )
      ],
    );
    


  }

  _item(BuildContext context, ItemModel item, bool isfirst, bool isCenterItem){
    BorderSide borderSide =  BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox (
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: borderSide,
            bottom: isfirst ? borderSide : BorderSide.none,
            ),
        ),
        child: _wapGesture(context, Center(
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ), item),
      ),
    );
  }

  _wapGesture(BuildContext context, Widget widget, ItemModel model) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> 
            WebView(
              url: model.url, 
              title: model.title,
              statusBarColor: model.statusBarColor,
             )
          )
        );
      },
      child: widget,
    );
  } 

}
