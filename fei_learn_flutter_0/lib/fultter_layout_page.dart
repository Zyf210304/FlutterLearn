import 'package:flutter/material.dart';

///
/// 如何进行flutter布局开发
class FullterLayout extends StatefulWidget {
  @override
  _FullterLayoutState createState() => _FullterLayoutState();
}

class _FullterLayoutState extends State<FullterLayout> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '如何进行flutter布局开发',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(title: 'StatelessWidget与基础组件'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('stateFullWidget与基础组件'),
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.blue),
                  title: Text('列表'))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('点我'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            // Text(
                            // 'I am Text',
                            // style:  textStyle,),
                            // Icon(Icons.phone_iphone, size: 20, color: ColorUtil.color('ff0000'),
                            // ),
                            // CloseButton(),
                            // BackButton(),
                            // Chip(
                            //   avatar: Icon(Icons.people),
                            //   label: Text('那个谁'),
                            //   ),
                            // Divider(
                            //   height: 20,
                            //   indent: 20,
                            //   color: Colors.purple,
                            // ),
                            // Card(
                            //     color: Colors.red,
                            //     elevation:5 ,
                            //     margin: EdgeInsets.all(5),
                            //     child: Container(
                            //       padding: EdgeInsets.all(10),
                            //       child: Text('I am Card', style: textStyle,),
                            //     ),
                            // ),
                            // AlertDialog(
                            //   title: Text('is alert'),
                            //   content: Text('learn'),

                            // )

                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                        'https://pics6.baidu.com/feed/9a504fc2d5628535cd71f378e701a2c2a5ef63cc.jpeg?token=98a2d0a4409bddf85f53de4e36207261&s=C382FE079DAB8EC816058CAD0300E007'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: ClipRRect(
                                    //圆角
                                    borderRadius :  BorderRadius.all(Radius.circular(40)),
                                    child: Opacity(
                                        opacity: 0.6,
                                        child: Image.network(
                                          'https://pics6.baidu.com/feed/9a504fc2d5628535cd71f378e701a2c2a5ef63cc.jpeg?token=98a2d0a4409bddf85f53de4e36207261&s=C382FE079DAB8EC816058CAD0300E007',
                                          width: 100,
                                          height: 100,
                                        )),
                                  ),
                                ),
                              ],
                            ),

                            // Image.network('https://pics6.baidu.com/feed/9a504fc2d5628535cd71f378e701a2c2a5ef63cc.jpeg?token=98a2d0a4409bddf85f53de4e36207261&s=C382FE079DAB8EC816058CAD0300E007',
                            // width: 100,
                            // height: 100,),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            //     hintText: '请输出',
                            //     hintStyle: TextStyle(fontSize: 14)
                            //   ),
                            // ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              // decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                clipBehavior: Clip.antiAlias,
                                child: PageView(
                                  children: <Widget>[
                                    _item('_page1', Colors.orange),
                                    _item('_page3', Colors.green),
                                    _item('_page2', Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                // Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.green,

                                // ),
                                // child: Text('sssss'),
                                // )

                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: Text(
                                      'sssss',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Image.network(
                            'https://pics6.baidu.com/feed/9a504fc2d5628535cd71f378e701a2c2a5ef63cc.jpeg?token=98a2d0a4409bddf85f53de4e36207261&s=C382FE079DAB8EC816058CAD0300E007',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.network(
                                'https://pics6.baidu.com/feed/9a504fc2d5628535cd71f378e701a2c2a5ef63cc.jpeg?token=98a2d0a4409bddf85f53de4e36207261&s=C382FE079DAB8EC816058CAD0300E007',
                                width: 30,
                                height: 50,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: <Widget>[
                          _chip('Flutter'),
                          _chip('阿萨德'),
                          _chip('任天野'),
                          _chip('额外若若'),
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )
              :  Column(
                children: <Widget>[
                  Text('sfadadsa'),
                  Expanded(
                    child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text('拉伸填满高度'),
                  ),
                  )
                ],
              ),
        ));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    print('ssasssss');
    return null;
  }

  _item(String name, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(label: Text(label),
    avatar: CircleAvatar(
      backgroundColor: Colors.red.shade900,
      child: Text(
        label.substring(0,1),
        style: TextStyle(fontSize: 10,),
      ),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
