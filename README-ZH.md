Language: [English](README.md) | [中文简体](README-ZH.md)

# easy_router

[![Pub](https://img.shields.io/pub/v/easy_router.svg?style=flat)](https://pub.flutter-io.cn/packages/easy_router) ![support](https://img.shields.io/badge/platform-flutter-ff69b4.svg?style=flat)

一个简单的Flutter页面跳转路由器

## 开始

### 1. 添加依赖

```yaml
dependencies:
  easy_router: 0.9.0  #latest version
```


### 2. 如何使用

#### 2.1. 添加 EasyRoutePathAnnotation 注解

```dart
@EasyRoutePathAnnotation("pageA")
class PageA extends StatelessWidget {
    //TODO
}
```



#### 2.2. easy_router会调用页面的构造器并传入EasyRouteParams参数，所以每个page都必须有一个这样的构造器

```dart
@EasyRoutePathAnnotation("pageA")
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
```



#### 2.3. 添加路由器注解

使用@EasyRouterAnnotation()来注解自定义类,然后才能用命令生成相关代码，例如

```dart
@EasyRouterAnnotation()
class Router {
  
}
```



#### 2.4. 生成代码

cd到你的app模块，然后执行命令

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

建议build之前先执行clean清除以前生成的代码

```
flutter packages pub run build_runner clean
```



#### 2.5. 显示页面

```dart
onPressed: () {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
                return Router.instance.getWidget("pageA", {"key": "a"});
            },
        ),
    );
}
```

**推荐封装一下`Router`，参考demo中的`router.dart`**



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
