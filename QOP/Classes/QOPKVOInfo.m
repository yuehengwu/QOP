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
        _options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    }
    return self;
}

- (void)dealloc {
    
}

@end
