import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/webView/web_view.dart';

class SubNav extends StatelessWidget {
  final List<SubNavListModel> subNavList;

  const SubNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: _items(context),
        ));
  }

  _items(BuildContext context) {
    if (subNavList == null) {
      return null;
    }

    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });

    int separate = (subNavList.length / 2 + 0.5).toInt();

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, items.length),
          ),
        )
      ],
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: items,
    // );
  }

  Widget _item(BuildContext context, SubNavListModel girdNavModel) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                          url: girdNavModel.url,
                          // statusBarColor: girdNavModel.statusBarColor,
                          hideAppBar: girdNavModel.hideAppBar,
                    )
                )
            );
          },
          child: Column(
            children: <Widget>[
              Image.network(
                girdNavModel.icon,
                width: 32,
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  girdNavModel.title,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ));
  }
}
