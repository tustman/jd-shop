import 'package:flutter/material.dart';
import '../global_config.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => new _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('会员'),
          ),
          body: new Center(child: new Text('会员页面')),
        ),
        theme: GlobalConfig.themeData);
  }
}
