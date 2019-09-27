/// author:liuhc
import 'package:build/build.dart';
import 'package:easy_router/src/generator_router.dart';
import 'package:source_gen/source_gen.dart';

import 'generator_param.dart';

/// Does not generate files here
/// 这里并不生成文件
Builder paramBuilder(BuilderOptions options) =>
    LibraryBuilder(EasyRoutePathGenerator(), generatedExtension: ".empty.dart");

/// 生成".g.dart"结尾的文件
/// Generate a file ending with ".g.dart"
Builder routerBuilder(BuilderOptions options) =>
    LibraryBuilder(EasyRouterGenerator(), generatedExtension: ".g.dart");