//
//  QOPDataBinding.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, QOPKVOPolicy) {
    QOPKVOPolicyNew = (1 << 0), // execute only when the value has changed
    QOPKVOPolicyAlways = (1 << 1), // always execute if the value has changed, !!! if set always, QOPKVOPolicyNew will be invalid
    QOPKVOPolicyInitial = (1 << 2), // execute KVO when first observe
    QOPKVOPolicyPrior = (1 << 3), // one change - double execute
};


@class QOPDataBindContext;

typedef QOPDataBindContext *(^BindContextBlock)(id);
typedef QOPDataBindContext *(^KeyPathContextBlock)(NSString *);
typedef QOPDataBindContext *(^KVOPolicyContextBlock)(QOPKVOPolicy);
typedef void (^UpdateContextBlock)(id observer, id updatedValue);


@protocol QOPDataBinding <NSObject>

- (BindContextBlock)bind;

- (BindContextBlock)unbind;

- (KeyPathContextBlock)value;

- (KVOPolicyContextBlock)policy;

- (id<QOPDataBinding>)update:(UpdateContextBlock)updateBlock;


@end

@protocol QOPKVOProxyKVOUpdating <NSObject>

- (void)qop_observer:(id)observer keyPath:(NSString *)keyPath oldValue:(id)oldValue updatedValue:(id)updatedValue;

@end


