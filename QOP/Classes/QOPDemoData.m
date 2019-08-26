//
//  QOPDemoData.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPDemoData.h"

@implementation QOPDemoData

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static QOPDemoData *data = nil;
    dispatch_once(&onceToken, ^{
        if (!data) {
            data = [[QOPDemoData alloc]init];
            data.identifier = @"AAAA";
        }
    });
    return data;
}

@end
