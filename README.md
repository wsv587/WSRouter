# WSRouter

[![CI Status](https://img.shields.io/travis/nlgb/WSRouter.svg?style=flat)](https://travis-ci.org/nlgb/WSRouter)
[![Version](https://img.shields.io/cocoapods/v/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)
[![License](https://img.shields.io/cocoapods/l/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)
[![Platform](https://img.shields.io/cocoapods/p/WSRouter.svg?style=flat)](https://cocoapods.org/pods/WSRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### Cocoapods
WSRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WSRouter'
```

### Source code
把WSRouter/Classes文件夹下的所有.h、.m文件拖入工程中。

## Usage
1.引入主头文件`#import <WSRouter/WSRouter.h>`或`#import WSRouter.h`

2.在+(void)load方法中使用`WSRouter的registerRouterWithPrefixURL`系列方法注册URL 

3.使用`transferFromViewController`系列方法实现控制器跳转

## Example
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

nlgb, wanggyanmo@163.com

## License

WSRouter is available under the MIT license. See the LICENSE file for more info.
