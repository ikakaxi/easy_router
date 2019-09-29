Language: [English](README.md) | [中文简体](README-ZH.md)

# easy_router

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/LICENSE) [![Pub](https://img.shields.io/pub/v/easy_router.svg?style=flat)](https://pub.flutter-io.cn/packages/easy_router) ![support](https://img.shields.io/badge/platform-flutter-ff69b4.svg?style=flat)

一个简单的Flutter页面跳转路由器

## 开始

### 1. 添加依赖

```yaml
dependencies:
  easy_router: 0.9.4  #latest version
```


### 2. 如何使用

#### 2.1. 添加 EasyRoutePathAnnotation 注解

```dart
//true代表需要参数，必须添加传递EasyRouteParam参数的构造器
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

//false代表不需要参数，不需要添加传递EasyRouteParam参数的构造器
@EasyRoutePathAnnotation("pageB", false)
class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("no param"),
      ),
    );
  }
}
```



#### 2.2. 添加路由器注解

使用@EasyRouterAnnotation()来注解自定义类,然后才能用命令生成相关代码，例如

```dart
@EasyRouterAnnotation()
class Router {
  
}
```



#### 2.3. 生成代码

cd到你的app模块，然后执行命令

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

建议build之前先执行clean清除以前生成的代码

```
flutter packages pub run build_runner clean
```



#### 2.4. 显示页面

```dart
onPressed: () {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
                return EasyRouter.instance.getWidget("pageA", {"key": "a"});
                //or
                //return EasyRouter.instance.getWidget("pageB");
            },
        ),
    );
}
```

**推荐封装一下`EasyRouter`，参考demo中的`router.dart`**



## 想学习如何使用source_gen生成代码,请查看[我的博客](https://juejin.im/post/5d76011be51d453b1e478b52)

**欢迎加入Flutter开发群457664582，点击加入，大家一起学习讨论**

<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=e735bf338a6b7b917fbf256bfd5a56396a07c898a6c021b6bdddaab2ec9e63d1"><img border="0" src="https://mirror-gold-cdn.xitu.io/-temp/15672978711567552d?w=90&h=22&f=png&s=1827" alt="Flutter开发" title="Flutter开发"></a>

## 插件

| Plugins|Status|
| --- | --- |
|[source_gen](https://github.com/dart-lang/source_gen)|[![Pub](https://img.shields.io/pub/v/source_gen.svg?style=flat)](https://pub.flutter-io.cn/packages/source_gen)|
| [build_config](https://github.com/dart-lang/build)        | [![Pub](https://img.shields.io/pub/v/build_config.svg?style=flat)](https://pub.flutter-io.cn/packages/build_config) |
| [mustache4dart](https://github.com/valotas/mustache4dart) | [![Pub](https://img.shields.io/badge/mustache4dart-v3.0.0_dev.1.0-orange.svg?style=flat)](https://pub.flutter-io.cn/packages/mustache4dart/versions/3.0.0-dev.1.0) |

## License

the license is MIT
