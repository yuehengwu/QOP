//
//  QOPKVOProxy.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QOPInterface.h"
#import "QOPKVOInfo.h"

@class QOPDataBindContext;

@interface QOPKVOProxy : NSObject


- (instancetype)initWithContext:(id<QOPKVOProxyKVOUpdating>)context;

- (void)bind:(QOPKVOInfo *)info;
- (void)unbind:(QOPKVOInfo *)info;

@end

