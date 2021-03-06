import 'package:flutter/material.dart';
import 'Sku.dart';
import 'dart:convert';
import 'reply_page.dart';
import '../global_config.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => new _ActivityState();
}

class _ActivityState extends State<Activity> {
  var listData;
  var curPage = 1;

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  getList(bool isLoadMore) {
    String url = Api.ACTIVITY_LIST;
    var query = new Map<String, String>();
    NetUtils.post(url, params: query).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map['code'] == 0) {
          // code=0表示请求成功
          var data = map['data'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var _listData = data['promotionMarketList'];

          setState(() {
            if (!isLoadMore) {
              // 不是加载更多，则直接为变量赋值
              listData = _listData;
            } else {
              // 是加载更多，则需要将取到的news数据追加到原来的数据后面
              List list1 = new List();
              // 添加原来的数据
              list1.addAll(listData);
              // 添加新取到的数据
              list1.addAll(_listData);
              // 给列表数据赋值
              listData = list1;
              // 轮播图数据
            }
          });
        }
      }
    });
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getList(false);
    return null;
  }

  // 定义商品卡片
  Widget wordsCard(Map<String, Object> sku) {
    Widget markWidget = new Container(
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: [
            new Row(
              children: [
                new SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: new Image.network(
                    sku['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
                new Expanded(
                  child: new GestureDetector(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                          height: 50.0,
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            sku['title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            '更新时间：' + sku['modified'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ), ////
      ),
    );
    return new Container(
        color: GlobalConfig.cardBackgroundColor,
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: new FlatButton(
          onPressed: () {
            print("on Pressed");
          },
          child: new Column(
            children: <Widget>[
              new Container(
                  child: markWidget,
                  margin: new EdgeInsets.only(top: 6.0, bottom: 6.0),
                  alignment: Alignment.topLeft),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> skuItemList = new List<Widget>();
    if (listData != null && listData.length > 0) {
      for (int i = 0; i < listData.length; i++) {
        skuItemList.add(wordsCard(listData[i]));
      }
    }
    Widget scrollView = new SingleChildScrollView(
        child: new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Column(
        children: skuItemList,
      ),
    ));

    return new RefreshIndicator(child: scrollView, onRefresh: _pullToRefresh);
  }
}
