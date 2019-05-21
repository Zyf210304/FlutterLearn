import 'package:flutter/material.dart';

void main() => runApp(ListRefresh());

List<String> numberList = ['1', '2', '3', '4',];

class ListRefresh extends StatefulWidget {
  @override
  _ListRefreshState createState() => _ListRefreshState();
}

class _ListRefreshState extends State<ListRefresh> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'list刷新';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: RefreshIndicator(
          
          onRefresh: _handleRefresh,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            children: _bulidList(),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      numberList = ['top'] + ['1', '2', '3', '4',] ;
    });
    return null;
  }

  List<Widget> _bulidList() {
    return numberList.map((number) => _item(number)).toList();
  }

  Widget _item(String number) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        number,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      String last = numberList.last;
      int lastNum = int.parse(last);
      for (int i = lastNum; i < lastNum + 5; i++) {
        numberList.add('$i');
      }
    });
  }
}
