// author: liuhc

/// 定义页面路由注解
/// Define page routing annotations
class EasyRoutePathAnnotation {
  final String url;

  const EasyRoutePathAnnotation(this.url);
}

/// 每个页面都必须添加一个接受此参数的构造函数
/// Each widget needs to add a constructor that accepts this parameter.
class EasyRouteParam {
  final Map<String, dynamic> params;

  EasyRouteParam(this.params);

  dynamic operator [](String key) {
    // custom operator[]
    return params[key];
  }
}

/// 定义路由注解
/// Define route parser annotations
class EasyRouterAnnotation {
  const EasyRouterAnnotation();
}
