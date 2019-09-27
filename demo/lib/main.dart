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
            _getButton(context, "pageA", {"key": "a"}, "跳转到页面A"),
            _getButton(context, "pageB", {"key": "b"}, "跳转到页面B"),
            _getButton(context, "pageC", {"key": "c"}, "跳转到页面C"),
          ],
        ),
      ),
    );
  }

  Widget _getButton(
    BuildContext context,
    String url,
    Map<String, dynamic> param,
    String text,
  ) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Router.instance.getWidget(url, param);
            },
          ),
        );
      },
      child: Text(text),
    );
  }
}
