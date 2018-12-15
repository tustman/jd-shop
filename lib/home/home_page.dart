import 'package:flutter/material.dart';
import '../global_config.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var activityList;
  var adList;

  @override
  void initState() {
    print("------------------initState");
    super.initState();
    getList();
  }

  getList() {
    String url = Api.INDEX_LIST;
    var query = new Map<String, String>();
    NetUtils.post(url, params: query).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map['code'] == 0) {
          // code=0表示请求成功
          var data = map['data'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var activityTempList = data['activityList'];
          var adList = data['adList'];
          print(activityTempList);
          print(adList);
          setState(() {
            List list1 = new List();
            // 添加原来的数据
            list1.addAll(activityTempList);
            // 给列表数据赋值
            activityList = list1;
          });
        }
      }
    });
  }
  
  Widget barSearch() {
    return new Container(
        height: 30.0,
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton.icon(
              onPressed: () {
                print("on pressed");
              },
              icon: new Icon(Icons.search,
                  color: GlobalConfig.fontColor, size: 16.0),
              label: new Text(
                "搜索",
                style: new TextStyle(color: GlobalConfig.fontColor),
              ),
            )),
          ],
        ),
        decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: GlobalConfig.searchBackgroundColor,
        ));
  }

  Widget swiperBar(List bannerList) {
    if (bannerList == null) {
      return new Container(
          child: new Center(child: new Text("加载中"),)
      );
    }
    return new Container(
        height: 90.0,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(bannerList[index]['bannerImageUrl'], fit: BoxFit.fitWidth,);
          },
          itemCount: bannerList.length,
          pagination: new SwiperPagination(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: barSearch(),
      ),
      body:  swiperBar(activityList),
    );
  }
}
