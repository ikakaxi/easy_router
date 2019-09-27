// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// EasyRouterGenerator
// **************************************************************************

import 'package:easy_router/easy_router.dart';
import 'package:flutter/widgets.dart';
import 'page_b.dart';
import 'page_a.dart';

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

  final Map<String, dynamic> _routeMap = {'pageB': PageB, 'pageA': PageA};

  Widget router(String url, Map<String, dynamic> params) {
    try {
      EasyRouteParam easyRouteParam = EasyRouteParam(params);
      final Type pageClass = _routeMap[url];
      if (pageClass == null) {
        return null;
      }
      final dynamic widget = _createInstance(pageClass, easyRouteParam);
      return widget;
    } catch (e) {
      return null;
    }
  }

  dynamic _createInstance(Type clazz, EasyRouteParam easyRouteParam) {
    switch (clazz) {
      case PageB:
        return PageB(easyRouteParam);
      case PageA:
        return PageA(easyRouteParam);
      default:
        return null;
    }
  }
}
