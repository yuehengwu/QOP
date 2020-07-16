# QOP

[![CI Status](https://img.shields.io/travis/609223770@qq.com/QOP.svg?style=flat)](https://travis-ci.org/609223770@qq.com/QOP)
[![Version](https://img.shields.io/cocoapods/v/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)
[![License](https://img.shields.io/cocoapods/l/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)
[![Platform](https://img.shields.io/cocoapods/p/QOP.svg?style=flat)](https://cocoapods.org/pods/QOP)

`QOP`（Queen of pain）是一款轻量级的数据绑定方案，底层采用`KVO`实现，链式调用优雅简单，并且使用者不需要关心循环引用及内存释放问题。

## 如何使用？

- 引用头文件

```ruby
#import <QOP.h>
```

- 为避免多次监听同一属性可先进行`QOPUNObserve`，再进行`QOPObserve`

```ruby
__weak typeof(self) ws = self;
QOPUNObserve(object, identifier);
[QOPObserve(object, identifier) update:^(id observer, id updatedValue) {
    ws.title = updatedValue;
}];
```
- 自定义数据绑定的监听者和监听策略

```objc
// QOPKVOPolicy is KVO policy
[QOPSPObserve(observer, target, keypath, QOPKVOPolicyInitial | QOPKVOPolicyAlways) update:^(id observer, id updatedValue) {
    NSLog(@"first exe and always exe");
}];
```

## 安装

`Podfile`中添加即可:

```ruby
pod 'QOP'
```

