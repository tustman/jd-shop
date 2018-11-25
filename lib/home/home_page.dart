import 'package:flutter/material.dart';
import '../global_config.dart';
import 'dakaList.dart';
import 'recommend.dart';
import 'hot.dart';
import 'search_page.dart';
import 'ask_page.dart';
import '../global_config.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Widget barSearch() {
    return new Container(
      height:30.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new FlatButton.icon(
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new SearchPage();
                    }
                  ));
                },
                icon: new Icon(
                  Icons.search,
                  color: GlobalConfig.fontColor,
                  size: 16.0
                ),
                label: new Text(
                  "搜索",
                  style: new TextStyle(color: GlobalConfig.fontColor),
                ),
              )
          ),
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: GlobalConfig.searchBackgroundColor,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new AppBar(
            title: barSearch(),
            bottom: new TabBar(
              indicatorColor:Colors.deepOrange,
              labelColor: GlobalConfig.dark == true ? Colors.deepOrange : Colors.deepOrange,
              unselectedLabelColor: GlobalConfig.dark == true ? Colors.white : Colors.black,
              tabs: [
                new Tab(text: "大咖推荐"),
                new Tab(text: "小妹精选"),
                new Tab(text: "全部商品"),
                new Tab(text: "优惠合集"),
              ],
            ),
          ),
          body: new TabBarView(
              children: [
                new Daka(),
                new Recommend(),
                new Hot(),
                new Hot()
              ]
          ),
        ),
    );
  }

}