//
//  QOPKVOInfo.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QOPKVOInfo : NSObject 

@property (nonatomic, weak) id observer;

@property (nonatomic, copy) NSString *keyPath;

@property (nonatomic, assign) NSKeyValueObservingOptions options;

@property (nonatomic, copy) void(^updateBlock)(id observer, id updatedValue);

@end

