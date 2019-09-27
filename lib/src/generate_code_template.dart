/// author:liuhc
const String codeTemplate = """
import 'package:easy_router/easy_router.dart';
import 'package:flutter/widgets.dart';
{{#imports}}
import '{{{path}}}';
{{/imports}}

class EasyRouter {
  
  static EasyRouter get instance => _getInstance();
  static EasyRouter _instance;

  EasyRouter._internal();

  factory EasyRouter()=> _getInstance();

  static EasyRouter _getInstance() {
    if (_instance == null) {
      _instance = EasyRouter._internal();
    }
    return _instance;
  }

  final Map<String, Pair<dynamic, bool>> _routeMap = {{{routeMap}}};

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

  dynamic _createInstance(Type clazz, bool hasParam, Map<String, dynamic> param) {
    {{{classInstance}}}
  }
}

class Pair<E, F> {
  E clazz;
  F hasParam;

  Pair(this.clazz, this.hasParam);
}
""";