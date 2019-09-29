Language: [English](README.md) | [中文简体](README-ZH.md)

# easy_router

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/LICENSE) [![Pub](https://img.shields.io/pub/v/easy_router.svg?style=flat)](https://pub.dartlang.org/packages/easy_router) ![support](https://img.shields.io/badge/platform-flutter-ff69b4.svg?style=flat)

A Simple Flutter Page Jump Router

## Get started

### 1. Add dependency

```yaml
dependencies:
  easy_router: 0.9.4  #latest version
```

### 2. How to use

#### 2.1. Add EasyRoutePathAnnotation annotation

```dart
//True means that the parameter is required, and the constructor that passes the 
//EasyRouteParam parameter must be added.
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

//False means no parameters are required, no need to add a constructor that passes the 
//EasyRouteParam parameter
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



#### 2.2. Add router annotations

Use @EasyRouterAnnotation() to annotate the custom class before you can generate the relevant code with the command, for example

```dart
@EasyRouterAnnotation()
class Router {
  
}
```



#### 2.3. Generate code

cd to your app module and execute the command

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

It is recommended to clean up the previous code before building

```
flutter packages pub run build_runner clean
```



#### 2.4. Display page

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

**Recommend wrapping `EasyRouter`, refer to `router.dart` in demo**



## To learn how to generate code using source_gen, check out [My Blog](https://juejin.im/post/5d76011be51d453b1e478b52)



### Plugins

| Plugins|Status|
| --- | --- |
|[source_gen](https://github.com/dart-lang/source_gen)|[![Pub](https://img.shields.io/pub/v/source_gen.svg?style=flat)](https://pub.flutter-io.cn/packages/source_gen)|
| [build_config](https://github.com/dart-lang/build)        | [![Pub](https://img.shields.io/pub/v/build_config.svg?style=flat)](https://pub.flutter-io.cn/packages/build_config) |
| [mustache4dart](https://github.com/valotas/mustache4dart) | [![Pub](https://img.shields.io/badge/mustache4dart-v3.0.0_dev.1.0-orange.svg?style=flat)](https://pub.flutter-io.cn/packages/mustache4dart/versions/3.0.0-dev.1.0) |

## License

the license is MIT
