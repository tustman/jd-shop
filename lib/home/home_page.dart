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
  var iconList = [
    {
      'id': 1,
      'tags': 2,
      'name': '9块9专区',
      'imageUrl': 'images/index-category/003.png'
    },
    {
      'id': 2,
      'tags': 3,
      'name': '京仓京配',
      'imageUrl': 'images/index-category/004.png'
    },
    {
      'id': 3,
      'tags': 4,
      'name': '品牌专区',
      'imageUrl': 'images/index-category/008.png'
    },
    {
      'id': 4,
      'tags': -1,
      'name': '优惠券',
      'imageUrl': 'images/index-category/010.png'
    },
    {
      'id': 5,
      'activeTab': 4,
      'name': '家居日用',
      'imageUrl': 'images/index-category/001.png'
    },
    {
      'id': 6,
      'activeTab': '1',
      'name': '水果生鲜',
      'imageUrl': 'images/index-category/011.png'
    },
    {
      'id': 7,
      'activeTab': '2',
      'name': '食品饮料',
      'imageUrl': 'images/index-category/012.png'
    },
    {
      'id': 8,
      'activeTab': '3',
      'name': '文学图书',
      'imageUrl': 'images/index-category/013.png'
    },
    {
      'id': 9,
      'activeTab': '5',
      'name': '个人护理',
      'imageUrl': 'images/index-category/005.png'
    },
    {
      'id': 10,
      'activeTab': '0',
      'name': '商品分类',
      'imageUrl': 'images/index-category/009.png'
    }
  ];
  var topList;

  getIndexList() {
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
          var adTempList = data['adList'];
          print(activityTempList);
          print(adTempList);
          setState(() {
            activityList = activityTempList;
            adList = adTempList;
          });
        }
      }
    });
  }

  getTopList() {
    String url = Api.XIAOMEI_LIST;
    var query = new Map<String, String>();
    query['pageIndex'] = '1';
    query['pageSize'] = '15';
    query['top'] = "1";
    NetUtils.post(url, params: query).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map['code'] == 0) {
          // code=0表示请求成功
          var data = map['data'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var skuTempList = data['skuList'];
          setState(() {
            topList = skuTempList;
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

  Widget bannerBar(List bannerList) {
    if (bannerList == null) {
      return new Container(
          child: new Center(
        child: new Text("加载中"),
      ));
    }
    return new Container(
        height: 90.0,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              bannerList[index]['bannerImageUrl'],
              fit: BoxFit.fitWidth,
            );
          },
          itemCount: bannerList.length,
          pagination: new SwiperPagination(),
        ));
  }

  Widget iconBar(List iconList) {
    return new Container(
        height: 150.0,
        color: Colors.white,
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, //每行2个
              mainAxisSpacing: 10.0, //主轴(竖直)方向间距
              crossAxisSpacing: 10.0, //纵轴(水平)方向间距
              childAspectRatio: 1.0 //纵轴缩放比例
              ),
          itemCount: iconList.length,
          itemBuilder: (BuildContext context, int index) {
            return IconItemWidget(iconList[index]);
          },
        ));
  }

  Widget adBar(List adList) {
    if (adList == null) {
      return new Container(
          child: new Center(
        child: new Text("加载中"),
      ));
    }
    return new Container(
        height: 170.0,
        color: Colors.white,
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //每行2个
              mainAxisSpacing: 10.0, //主轴(竖直)方向间距
              crossAxisSpacing: 5.0, //纵轴(水平)方向间距
              childAspectRatio: 490.0 / 210.0 //纵轴缩放比例
              ),
          itemCount: adList.length,
          itemBuilder: (BuildContext context, int index) {
            return AdItemWidget(adList[index]);
          },
        ));
  }

  Widget topBar(topList) {
    if (topList == null) {
      return new Container(
          child: new Center(
        child: new Text("加载中"),
      ));
    }
    return new Container(
      height: 160.0,
      child: new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return TopItemWidget(topList[index]);
        },
      ),
    );
  }

  Future<Null> _pullToRefresh() async {
    return null;
  }

  @override
  void initState() {
    super.initState();
    getIndexList();
    getTopList();
  }

  @override
  Widget build(BuildContext context) {
    Widget scrollView = new SingleChildScrollView(
        child: new Container(
      child: new Column(
        children: <Widget>[
          bannerBar(activityList),
          iconBar(iconList),
          adBar(adList),
          topBar(topList)
        ],
      ),
    ));
    Widget indexView =
        new RefreshIndicator(child: scrollView, onRefresh: _pullToRefresh);
    return new Scaffold(
      appBar: new AppBar(
        title: barSearch(),
      ),
      body: indexView,
    );
  }
}

class IconItemWidget extends StatelessWidget {
  final Map listItem;

  IconItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              height: 35.0,
              width: 35.0,
              child: new Image.asset(listItem['imageUrl']),
            ),
            new Padding(
              child: new Text(
                listItem['name'],
                style: TextStyle(color: Colors.black54),
              ),
              padding: const EdgeInsets.all(3.0),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class TopItemWidget extends StatelessWidget {
  final Map listItem;

  TopItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: new EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              height: 100.0,
              width: 100.0,
              child: new Image.network(listItem['imageUrl']),
            ),
            new Padding(
              child: new Text(
                "京东价："+listItem['jdPrice'],
                style: TextStyle(color: Colors.black54),
              ),
              padding: const EdgeInsets.all(1.0),
            ),
            new Padding(
              child: new Text(
                "券后价："+listItem['couponPrice'],
                style: TextStyle(color: Colors.black54),
              ),
              padding: const EdgeInsets.all(1.0),
            ),
            new Padding(
              child: new Text(
                "预估佣金："+listItem['commission'],
                style: TextStyle(color: Colors.black54),
              ),
              padding: const EdgeInsets.all(1.0),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class AdItemWidget extends StatelessWidget {
  final Map listItem;

  AdItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
              image: NetworkImage(
                listItem['imageUrl'],
              ),
            ),
          ),
        ),
        onTap: () {});
  }
}
