import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SkuDetailPage extends StatefulWidget {
  String id;

  SkuDetailPage({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new SkuDetailPageState(id: this.id);
}

class SkuDetailPageState extends State<SkuDetailPage> {
  String id;
  bool loaded = false;
  String detailDataStr;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  SkuDetailPageState({Key key, this.id});

  @override
  void initState() {
    super.initState();
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("state: ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          loaded = true;
        });
      }
    });
    flutterWebViewPlugin.onDestroy.listen((state) {
      print("state: onDestroy");
    });
    flutterWebViewPlugin.onHttpError.listen((state) {
      print("state: onHttpError");
    });
    flutterWebViewPlugin.onUrlChanged.listen((state) {
      print("state: onUrlChanged");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      "商品详情",
      style: new TextStyle(color: Colors.black54),
    ));
    if (!loaded) {
      titleContent.add(new CupertinoActivityIndicator());
    }
    titleContent.add(new Container(width: 50.0));
    return new WebviewScaffold(
      url: this.id,
      appBar: new AppBar(
        leading: new IconButton(
          color: Colors.deepOrange,
          tooltip: 'Previous choice',
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
