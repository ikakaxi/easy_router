/// author:liuhc
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mustache4dart/mustache4dart.dart';
import 'package:source_gen/source_gen.dart';

import 'core.dart';
import 'generate_code_template.dart';
import 'generator_param.dart';

/// This file is used to generate EasyRouter
/// 该文件用来生成EasyRouter
class EasyRouterGenerator extends GeneratorForAnnotation<EasyRouterAnnotation> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    /// 3 Replace placeholders with routemap and imports in the code template
    /// 3 将routeMap和imports替换代码模板里的占位符
    return render(codeTemplate, <String, dynamic>{
      'imports': EasyRoutePathGenerator.importList.map((item) => {'path': item}).toList(),
      'classInstance': EasyRoutePathGenerator.classInstanceContent,
      'routeMap': EasyRoutePathGenerator.routeMap
          .map((String key, Pair<dynamic, bool> value) => MapEntry(key, "Pair(${value.clazz},${value.hasParam})"))
          .toString()
    });
  }
}
