/// author:liuhc
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'core.dart';

/// This file is used to save the parameters needed to generate the code.
/// 该文件用来保存生成代码所需的参数
class EasyRoutePathGenerator extends GeneratorForAnnotation<EasyRoutePathAnnotation> {

  static Map<String, dynamic> routeMap = {};
  static List<String> importList = [];
  static String classInstanceContent;

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    routeMap = _parseRouteMap(routeMap, element, annotation);
    importList = _parseImportList(importList, buildStep);
    classInstanceContent = _createInstance(routeMap);
    return null;
  }

  /// 1 Save the url and the corresponding Widget to a collection named routeMap
  /// 1 将url和对应的Widget保存到名为routeMap的集合里
  Map<String, dynamic> _parseRouteMap(Map<String, dynamic> routeMap, Element element, ConstantReader annotation) {
    String clazz = element.displayName;
    print("parse element=$clazz");
    String url = annotation
        .peek('url')
        .stringValue;
    /// May be a bug in mustache4dart, if you don't add ' before and after the url, the generated code is problematic.
    /// 可能是mustache4dart的bug,如果不给url前后添加'的话,生成的代码是有问题的
    String urlKey = "'" + url + "'";
    if (routeMap.containsKey(urlKey)) {
      return routeMap;
    }
    routeMap[urlKey] = clazz;
    return routeMap;
  }

  /// 2 Save the file where the Widget is located to a collection named imports
  /// 2 将Widget所在文件保存到名为imports的集合里
  List<String> _parseImportList(List<String> importList, BuildStep buildStep) {
    String path = buildStep.inputId.path;
    print("parse path=$path");
    if (path.contains("lib/")) {
      path = path.replaceFirst("lib/", "");
    }
    if (!importList.contains(path)) {
      importList.add(path);
    }
    return importList;
  }

  /// Generate a switch statement to get different Widgets through different urls
  /// 生成switch语句,通过不同的url获取不同的Widget
  String _createInstance(Map<String, dynamic> routeMap) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln("switch (clazz) {");
    routeMap.forEach((key, value) {
      stringBuffer.writeln("case $value : return $value(easyRouteParam);");
    });
    stringBuffer.writeln("default: return null;}");
    return stringBuffer.toString();
  }
}
