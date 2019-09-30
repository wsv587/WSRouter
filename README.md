# WSRouter

## Introduction
WSRouter is a lib that can help your iOS project to implement viewController transition easily. WSRouter is based custom URL, if your iOS project's transition is base URL, The WSRouter maybe is a good choice. In addition, WSRouter is light-weight which just contains four .m file and five .h file. so, WSRouter never affect your project size and compile speed.

[![CI Status](https://img.shields.io/travis/nlgb/WSRouter.svg?style=flat)](https://travis-ci.org/nlgb/WSRouter)
[![Version](https://img.shields.io/cocoapods/v/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)
[![License](https://img.shields.io/cocoapods/l/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)
[![Platform](https://img.shields.io/cocoapods/p/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### Cocoapods
WSRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WSRouter'
```

### Source code
Add all .h、.m files of the directory `WSRouter/Classes` to your project.

## Usage
Step 1:
If you use Cocoapods to manage your project:
`#import <WSRouter/WSRouter.h>`

If you import WSRouter source code to your project:
`#import WSRouter.h`

Step 2:
Register url in class method `+(void)load` by call WSRouter class method. Such as `WSRouter的registerRouterWithPrefixURL:handler:`

Step 3:
Transfer your viewController to next viewController by using `transferFromViewController:toURL:`

## Example

### 1.import
`#import <WSRouter/WSRouter.h>`

### 2.register url
```ruby

+ (void)load {
    NSURL *url = [NSURL URLWithString:@"WS://www.ws.com/first"];
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        UIViewController *destViewController = [[WSPushedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPush];
        return destViewController;
    }];
}

```

### 3.transfer
```ruby
[WSRouter transferFromViewController:self toURL:[NSURL URLWithString:@"WS://www.ws.com/first?uid=666"]];

```

## 中文介绍
WSRouter是一款基于URL实现控制器转场的框架。如果您的iOS项目正在考虑使用URL实现页面的转场，那么我推荐您使用WSRouter。此外，WSRouter功能完整且非常轻。内部仅包含4个.m文件和5个.h文件，并不会影响您的项目大小或编译速度。

## 运行example
clone代码到本地，然后再Example文件夹下运行命名`pod install`即可。

## 安装

### Cocoapods方式
WSRouter支持以Cocoapods的方式安装到您的工程中，只需要在podfile文件中添加以下代码即可，Cocoapods将会安装最新版本的WSRouter：
```ruby
pod 'WSRouter'
```

### 源码方式
把`WSRouter/Classes`文件夹下的所有.h、.m文件拖入工程中。

## 使用
1.引入主头文件`#import <WSRouter/WSRouter.h>`或`#import WSRouter.h`

2.在+(void)load方法中使用`WSRouter的registerRouterWithPrefixURL`系列方法注册URL 

3.使用`transferFromViewController`系列方法实现控制器跳转

## 例子
### 1.注册
```ruby

+ (void)load {
    NSURL *url = [NSURL URLWithString:@"WS://www.ws.com/first"];
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        UIViewController *destViewController = [[WSPushedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPush];
        return destViewController;
    }];
}

```

### 2.跳转
```ruby
[WSRouter transferFromViewController:self toURL:[NSURL URLWithString:@"WS://www.ws.com/first?uid=666"]];

```

## Author

ws, wanggyanmo@163.com

## License

WSRouter is available under the MIT license. See the LICENSE file for more info.
