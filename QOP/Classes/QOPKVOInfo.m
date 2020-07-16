//
//  QOPKVOInfo.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPKVOInfo.h"

@implementation QOPKVOInfo

- (instancetype)init {
    if (self = [super init]) {
        _policy = QOPKVOPolicyNew;
        _isUnObserve = NO;
    }
    return self;
}

- (NSKeyValueObservingOptions)parsePolicyToKVOOptions {
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    if ((_policy & QOPKVOPolicyNew) || (_policy & QOPKVOPolicyAlways)) {
        options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    }
    if (_policy & QOPKVOPolicyInitial) {
        options = options | NSKeyValueObservingOptionInitial;
    }
    if (_policy & QOPKVOPolicyPrior) {
        options = options | NSKeyValueObservingOptionPrior;
    }
    return options;
}

- (void)dealloc {
    
}

@end
