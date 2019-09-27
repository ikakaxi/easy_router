/// description: test page A
/// author: liuhc
import 'package:flutter/material.dart';

import 'package:easy_router/easy_router.dart';

@EasyRoutePathAnnotation("pageA", true)
class PageA extends StatelessWidget {
  final EasyRouteParam param;

  PageA(this.param);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("param:${param["key"]}"),
      ),
    );
  }
}
