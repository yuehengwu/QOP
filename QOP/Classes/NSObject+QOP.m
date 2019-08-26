//
//  NSObject+QOP.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "NSObject+QOP.h"
#import <objc/runtime.h>

static void * QOPDataBindContextKey = &QOPDataBindContextKey;

@implementation NSObject (QOP)

- (QOPDataBindContext *)qop {
    id qop = objc_getAssociatedObject(self, QOPDataBindContextKey);
    if (!qop) {
        qop = [[QOPDataBindContext alloc]init];
        objc_setAssociatedObject(self, QOPDataBindContextKey, qop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return qop;
}



@end
