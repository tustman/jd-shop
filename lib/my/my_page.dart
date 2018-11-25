import 'package:flutter/material.dart';
import '../global_config.dart';
import '../home/search_page.dart';
import '../global_config.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Widget barSearch() {
    return new Container(
        child: new FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new SearchPage();
              }));
            },
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Icon(
                    Icons.search,
                    size: 18.0,
                  ),
                  margin: const EdgeInsets.only(right: 26.0),
                ),
                new Expanded(
                    child: new Container(
                  child: new Text("搜索知乎内容"),
                )),
                new Container(
                  child: new FlatButton(
                    onPressed: () {},
                    child: new Icon(Icons.settings_overscan, size: 18.0),
                  ),
                  width: 40.0,
                ),
              ],
            )),
        decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            color: GlobalConfig.searchBackgroundColor));
  }

  Widget myInfoCard() {
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
                color: GlobalConfig.dark == true
                    ? Colors.white10
                    : new Color(0xFFF5F5F5),
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new ListTile(
                    leading: new Container(
                      child: new CircleAvatar(
                          backgroundImage: new NetworkImage(
                              "https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                          radius: 20.0),
                    ),
                    title: new Container(
                      margin: const EdgeInsets.only(bottom: 2.0),
                      child: new Text("learner"),
                    ),
                    subtitle: new Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: new Text("查看或编辑个人主页"),
                    ),
                  ),
                )),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "57",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的创作",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: GlobalConfig.dark == true
                                  ? Colors.white12
                                  : Colors.black12,
                              width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "210",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "关注",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: GlobalConfig.dark == true
                                  ? Colors.white12
                                  : Colors.black12,
                              width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "18",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的收藏",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: GlobalConfig.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: GlobalConfig.dark == true
                                  ? Colors.white12
                                  : Colors.black12,
                              width: 1.0))),
                ),
                new Container(
                    width: (MediaQuery.of(context).size.width - 6.0) / 4,
                    child: new FlatButton(
                        onPressed: () {},
                        child: new Container(
                          height: 50.0,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: new Text(
                                  "33",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: GlobalConfig.fontColor),
                                ),
                              ),
                              new Container(
                                child: new Text(
                                  "最近浏览",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: GlobalConfig.fontColor),
                                ),
                              )
                            ],
                          ),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget settingCard() {
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.invert_colors,
                              color: Colors.white),
                          backgroundColor: new Color(0xFFB88800),
                        ),
                      ),
                      new Container(
                        child: new Text("社区建设",
                            style: new TextStyle(
                                color: GlobalConfig.fontColor, fontSize: 14.0)),
                      )
                    ],
                  ),
                )),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child:
                              new Icon(Icons.golf_course, color: Colors.white),
                          backgroundColor: new Color(0xFF63616D),
                        ),
                      ),
                      new Container(
                        child: new Text("反馈",
                            style: new TextStyle(
                                color: GlobalConfig.fontColor, fontSize: 14.0)),
                      )
                    ],
                  ),
                )),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: () {
                  setState(() {
                    if (GlobalConfig.dark == true) {
                      GlobalConfig.themeData = new ThemeData(
                        primaryColor: Colors.white,
                        scaffoldBackgroundColor: new Color(0xFFEBEBEB),
                      );
                      GlobalConfig.searchBackgroundColor =
                          new Color(0xFFEBEBEB);
                      GlobalConfig.cardBackgroundColor = Colors.white;
                      GlobalConfig.fontColor = Colors.black54;
                      GlobalConfig.dark = false;
                    } else {
                      GlobalConfig.themeData = new ThemeData.dark();
                      GlobalConfig.searchBackgroundColor = Colors.white10;
                      GlobalConfig.cardBackgroundColor = new Color(0xFF222222);
                      GlobalConfig.fontColor = Colors.white30;
                      GlobalConfig.dark = true;
                    }
                  });
                },
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(
                              GlobalConfig.dark == true
                                  ? Icons.wb_sunny
                                  : Icons.brightness_2,
                              color: Colors.white),
                          backgroundColor: new Color(0xFFB86A0D),
                        ),
                      ),
                      new Container(
                        child: new Text(
                            GlobalConfig.dark == true ? "日间模式" : "夜间模式",
                            style: new TextStyle(
                                color: GlobalConfig.fontColor, fontSize: 14.0)),
                      )
                    ],
                  ),
                )),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.perm_data_setting,
                              color: Colors.white),
                          backgroundColor: new Color(0xFF636269),
                        ),
                      ),
                      new Container(
                        child: new Text("设置",
                            style: new TextStyle(
                                color: GlobalConfig.fontColor, fontSize: 14.0)),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('我的'),
          ),
          body: new Center(
            child: new Text("我的页面"),
          ),
        ),
        theme: GlobalConfig.themeData);
  }
}
