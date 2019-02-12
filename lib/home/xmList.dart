import 'package:flutter/material.dart';
import 'package:zhihu/home/sku_detail.dart';

import 'dart:convert';
import '../global_config.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';

class XiaoMei extends StatefulWidget {
  @override
  _XiaoMeiState createState() => new _XiaoMeiState();
}

class _XiaoMeiState extends State<XiaoMei> {
  var listData;
  var curPage = 1;

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  getList(bool isLoadMore) {
    String url = Api.XIAOMEI_LIST;
    var query = new Map<String, String>();
    query['pageIndex'] = '1';
    query['pageSize'] = '10';
    query['tags'] = '2';
    query['top'] = '0';
    query['showInPage'] = '1';
    NetUtils.post(url, params: query).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map['code'] == 0) {
          // code=0表示请求成功
          var data = map['data'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var _listData = data['skuList'];

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
              print("===========>"+listData.length.toString());
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

  @override
  Widget build(BuildContext context) {
    List<Widget> skuItemList = new List<Widget>();
    if (listData != null && listData.length > 0) {
      for (int i = 0; i < listData.length; i++) {
        skuItemList.add(new CardWidget(listData[i]));
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
class CardWidget extends StatelessWidget {
  final Map sku;

  CardWidget(this.sku);

  @override
  Widget build(BuildContext context) {
    var info = '券后价：￥' + sku['couponPrice']  ;
    if(sku['commission']!=null){
      info+='  推广赚：￥' + sku['commission'];
    }
    Widget markWidget = new Container(
      child: new Padding(
        padding: new EdgeInsets.all(5.0),
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
                            sku['skuName'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: new TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            "优惠券：￥" + sku['couponDiscount'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            "京东价：￥" + sku['jdPrice'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            info,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(
                              fontSize: 12,
                              color: Colors.red[600],
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
        margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: new FlatButton(
          onPressed: () {
            var url = "http://item.jd.com/" + sku['skuId'].toString() + ".html";
            print("on Pressed==>" + url);
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (ctx) => new SkuDetailPage(id: url)));
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
}