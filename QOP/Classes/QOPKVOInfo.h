//
//  QOPKVOInfo.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QOPInterface.h"



@interface QOPKVOInfo<__covariant ObjectType> : NSObject

@property (nonatomic, assign) BOOL isUnObserve;

@property (nonatomic, weak) ObjectType observer;

@property (nonatomic, copy) NSString *keyPath;

@property (nonatomic, assign) QOPKVOPolicy policy;

@property (nonatomic, copy) void(^updateBlock)(id observer, id updatedValue);

@property (nonatomic, assign, readonly, getter=parsePolicyToKVOOptions) NSKeyValueObservingOptions options;

@end

