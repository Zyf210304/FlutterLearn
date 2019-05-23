
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/webView/web_view.dart';

class LocalNav extends StatelessWidget {

  final List<LocalNavListModel> gridNavList;
  const LocalNav({Key key, @required  this.gridNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(padding: EdgeInsets.all(7),
        child: _items(context),
      )
    );
  }

  _items(BuildContext context) {
    // if(gridNavList == null) {
    //   return null;
    // }

    List<Widget> items = [];
    gridNavList.forEach((model){
      items.add(_item(context, model));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }


  Widget _item(BuildContext context, LocalNavListModel girdNavModel) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> 
            WebView(
              url: girdNavModel.url, 
              statusBarColor: girdNavModel.statusBarColor,
              hideAppBar: girdNavModel.hideAppBar,
             )
          )
        );
      },
      child: Column(
        children: <Widget>[
          Image.network(girdNavModel.icon,
          width: 32,
          height: 32,
          ),
          Text(
            girdNavModel.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }



}
