import 'package:flutter/material.dart';
import 'index/index.dart';

void main() => runApp(new ZhiHu());

class ZhiHu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "芬香社交电商",
      home: new Index(),
    );
  }

}
