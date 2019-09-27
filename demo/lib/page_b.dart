/// description: test page B
/// author: liuhc
import 'package:flutter/material.dart';
import 'package:easy_router/easy_router.dart';

@EasyRoutePathAnnotation("pageB")
class PageB extends StatelessWidget {
  final EasyRouteParam param;

  PageB(this.param);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("param:${param["key"]}"),
      ),
    );
  }
}
