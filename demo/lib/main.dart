/// description: easy_router demo app
/// author: liuhc
import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(
    MaterialApp(
      title: '简单路由',
      home: MainPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _getButton(context, "pageA", "跳转到页面A", param: {"key": "a"}),
            _getButton(context, "pageB", "跳转到页面B"),
            _getButton(context, "pageC", "跳转到不存在的页面"),
          ],
        ),
      ),
    );
  }

  Widget _getButton(
    BuildContext context,
    String url,
    String text, {
    Map<String, dynamic> param,
  }) {
    return RaisedButton(
      onPressed: () {
        Router.instance.go(context, url, param: param);
      },
      child: Text(text),
    );
  }
}
