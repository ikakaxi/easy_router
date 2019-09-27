// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// EasyRouterGenerator
// **************************************************************************

import 'package:easy_router/easy_router.dart';
import 'package:flutter/widgets.dart';
import 'page_a.dart';
import 'page_b.dart';

class EasyRouter {
  static EasyRouter get instance => _getInstance();
  static EasyRouter _instance;

  EasyRouter._internal();

  factory EasyRouter() => _getInstance();

  static EasyRouter _getInstance() {
    if (_instance == null) {
      _instance = EasyRouter._internal();
    }
    return _instance;
  }

  final Map<String, Pair<dynamic, bool>> _routeMap = {
    'pageA': Pair(PageA, true),
    'pageB': Pair(PageB, false)
  };

  Widget getWidget(String url, {Map<String, dynamic> param}) {
    try {
      final Type pageClass = _routeMap[url].clazz;
      if (pageClass == null) {
        return null;
      }
      final bool hasParam = _routeMap[url].hasParam;
      return _createInstance(pageClass, hasParam, param);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  dynamic _createInstance(
      Type clazz, bool hasParam, Map<String, dynamic> param) {
    switch (clazz) {
      case PageA:
        EasyRouteParam easyRouteParam = EasyRouteParam(param);
        return PageA(easyRouteParam);
      case PageB:
        return PageB();
      default:
        return null;
    }
  }
}

class Pair<E, F> {
  E clazz;
  F hasParam;

  Pair(this.clazz, this.hasParam);
}
