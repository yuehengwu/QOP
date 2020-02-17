//
//  QOPKVOProxy.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPKVOProxy.h"
#import <KVOController/KVOController.h>
#import <extobjc/extobjc.h>

@interface QOPKVOProxy ()

@property (nonatomic, weak) id<QOPKVOProxyKVOUpdating> context;

@end

@implementation QOPKVOProxy

- (instancetype)initWithContext:(id<QOPKVOProxyKVOUpdating>)context {
    if (self = [super init]) {
        _context = context;
    }
    return self;
}

#pragma mark - KVO

- (void)bind:(QOPKVOInfo *)info {
    
    @weakify(self);
    [self.KVOControllerNonRetaining observe:info.observer keyPath:info.keyPath options:info.options block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        @strongify(self);
        id oldValue = change[NSKeyValueChangeOldKey];
        id newValue = change[NSKeyValueChangeNewKey];
        
        if (![oldValue isEqual:newValue]){
            newValue = newValue == NSNull.null ? nil : newValue; // fix crash if newValue is NSNull
            if ([self.context respondsToSelector:@selector(qop_observer:keyPath:oldValue:updatedValue:)]) {
                [self.context qop_observer:object keyPath:info.keyPath oldValue:oldValue updatedValue:newValue];
            }
        }
    }];
}

- (void)unbind:(QOPKVOInfo *)info {
    
    if (!info.keyPath.length) {
        [self.KVOControllerNonRetaining unobserve:info.observer];
    }else {
        [self.KVOControllerNonRetaining unobserve:info.observer keyPath:info.keyPath];
    }
}





@end
