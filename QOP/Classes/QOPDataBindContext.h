//
//  QOPDataBindContext.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QOPDataBinding.h"

@interface QOPDataBindContext : NSObject <QOPDataBinding,QOPKVOProxyKVOUpdating>

- (BindContextBlock)bind;

- (KeyPathContextBlock)observe;

- (KVOOptionsContextBlock)options;

- (id<QOPDataBinding>)update:(UpdateContextBlock)updateBlock;

@end
