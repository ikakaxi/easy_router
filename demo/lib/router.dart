/// description: Wrap EasyRouter
/// author: liuhc
import 'package:easy_router/easy_router.dart' show EasyRouterAnnotation;
import 'package:flutter/material.dart';

import 'router.g.dart';

@EasyRouterAnnotation()
class Router {
  static Router get instance => _getInstance();
  static Router _instance;

  Router._internal();

  factory Router() => _getInstance();

  static Router _getInstance() {
    if (_instance == null) {
      _instance = Router._internal();
    }
    return _instance;
  }

  Widget getWidget(String url, {Map<String, dynamic> param}) {
    return EasyRouter.instance.getWidget(url, param: param) ?? NotFoundPage();
  }

  void go(BuildContext context, String url, {Map<String, dynamic> param}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return getWidget(url, param: param);
        },
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Page Not Found"),
      ),
    );
  }
}
