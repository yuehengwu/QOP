//
//  QOPDataBinding.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QOPDataBindContext;

typedef QOPDataBindContext *(^BindContextBlock)(id);
typedef QOPDataBindContext *(^KeyPathContextBlock)(NSString *);
typedef QOPDataBindContext *(^KVOOptionsContextBlock)(NSKeyValueObservingOptions);
typedef void (^UpdateContextBlock)(id observer, id updatedValue);


@protocol QOPDataBinding <NSObject>

- (BindContextBlock)bind;
- (KeyPathContextBlock)keypath;
- (KVOOptionsContextBlock)options;


- (id<QOPDataBinding>)update:(UpdateContextBlock)updateBlock;

@end

@protocol QOPKVOProxyKVOUpdating <NSObject>

- (void)qop_observer:(id)observer keyPath:(NSString *)keyPath oldValue:(id)oldValue updatedValue:(id)updatedValue;

@end


