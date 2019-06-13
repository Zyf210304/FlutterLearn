import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trip/base/dao/search_dao.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:flutter_trip/widget/base/search_bar.dart';
import 'package:flutter_trip/widget/webView/web_view.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String seacrhUrl;
  final String keyword;
  final String hint;

  const SearchPage(
      {Key key, this.hideLeft, this.seacrhUrl, this.keyword, this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String showText = '';
  String keywrod;
  SearchModel searchModel;

  @override
  void initState(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea()
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
              context: context,
              child: Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: searchModel?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return _item(position);
                  },
                ),
              ))
        ],
      ),
    );
  }

  _appBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //AppBar渐变遮罩背景
          colors: [Color(0x66000000), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: SearchBar(
          hideLeft: true,
          defaultText: widget.keyword,
          hint: widget.hint,
          leftButtonClick: () {
            Navigator.pop(context);
          },
          rightButtonClick: () {},
          onChanged: _onTextChange,
        ),
      ),
    );
  }

  _onTextChange(text) {
    keywrod = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }

    String url = URL + text;
    SearchDao.searchfetch(url, text).then((SearchModel model) {
      if (model.keyword == keywrod) {
        setState(() {
          searchModel = model;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  _item(int postion) {
    if (searchModel == null || searchModel.data == null) return null;

    SearchItem item = searchModel.data[postion];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: item.url,
                      title: '详情',
                    )));
      },
      // child: Text(
      // item.word,
      // style: TextStyle(color: Colors.blue, fontSize: 20),
      // )
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Icon(
                Icons.hotel,
                size: 20,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    child:_title(item),
                  ),
                  Container(
                    width: 300,
                    child: _subTitle(item),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _title(SearchItem item) {
    if (item == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));
    spans.add(TextSpan(
        text: ' ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: item.price ?? '',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        ),
        TextSpan(
          text: ' ' + (item.star ?? ''),
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ]),
    );
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if ((i + 1) % 2 == 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + 1), style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
