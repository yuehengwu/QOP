# QOP

[![CI Status](https://img.shields.io/travis/609223770@qq.com/QOP.svg?style=flat)](https://travis-ci.org/609223770@qq.com/QOP)
[![Version](https://img.shields.io/cocoapods/v/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)
[![License](https://img.shields.io/cocoapods/l/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)
[![Platform](https://img.shields.io/cocoapods/p/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)

中文文档：[中文文档](./README_zh.md)

`QOP` (Queen of pain) is a lightweight data binding solution. The bottom layer is implemented with `KVO`. Chained calls are elegant and simple, and users do not need to worry about circular references and memory release.

## how to use?

- Quote header files

```ruby
#import <QOP.h>
```

- To avoid listening to the same attribute multiple times, you can perform `QOPUNObserve` first, then `QOPObserve`

```objc
__weak typeof(self) ws = self;
QOPUNObserve(object, identifier);
[QOPObserve(object, identifier) ​​update:^(id observer, id updatedValue) {
    ws.title = updatedValue;
}];
```

- Custom observer and  KVO strategy
```objc
// QOPKVOPolicy is KVO policy
[QOPSPObserve(observer, target, keypath, QOPKVOPolicyInitial | QOPKVOPolicyAlways) update:^(id observer, id updatedValue) {
    NSLog(@"first exe and always exe");
}];
```

## Installation

Just add it to Podfile:

```ruby
pod'QOP'
```
