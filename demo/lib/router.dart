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

  Widget getWidget(String url, Map<String, dynamic> params) {
    Widget widget = EasyRouter.instance.router(url, params);
    return widget ?? NotFoundPage();
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
