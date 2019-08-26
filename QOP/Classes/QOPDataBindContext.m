//
//  QOPDataBindContext.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPDataBindContext.h"
#import "QOPKVOInfo.h"
#import "QOPKVOProxy.h"


@interface QOPDataBindContext ()

@property (nonatomic, strong) QOPKVOProxy *kvo;

@property (nonatomic, strong) QOPKVOInfo *tempInfo;

@property (nonatomic, strong) NSHashTable<QOPKVOInfo *> *map;

@end

@implementation QOPDataBindContext

- (void)dealloc {
    
}

- (instancetype)init {
    if (self = [super init]) {
        
        _kvo = [[QOPKVOProxy alloc]initWithContext:self];
        _map = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (BindContextBlock)bind {
    
    _tempInfo = [[QOPKVOInfo alloc]init];
    
    return ^QOPDataBindContext *(id observer){
        
        self.tempInfo.observer = observer;
        return self;
    };
}

- (KeyPathContextBlock)keypath {
    
    NSParameterAssert(_tempInfo.observer);
    
    return ^QOPDataBindContext *(NSString *keypath) {
        
        self.tempInfo.keyPath = keypath;
        
        [self.map addObject:self.tempInfo];
        
        return self;
    };
}

- (id<QOPDataBinding>)update:(UpdateContextBlock)updateBlock {
    
    NSParameterAssert(_tempInfo.keyPath);
    
    _tempInfo.updateBlock = updateBlock;
    _tempInfo.options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
            
    [_kvo bind:_tempInfo];
    
    return self;
}

#pragma mark - Private

- (NSString *)private_getMapKeyWithObserver:(id)observer keypath:(NSString *)keypath {
    
    NSString *key = [NSString stringWithFormat:@"%p_%@",self.tempInfo.observer,self.tempInfo.keyPath];
    return key;
}

#pragma mark - KVO

- (void)qop_observer:(id)observer keyPath:(NSString *)keyPath oldValue:(id)oldValue updatedValue:(id)updatedValue {
    
//    NSString *key = [self private_getMapKeyWithObserver:observer keypath:keyPath];s
    
    for (QOPKVOInfo *obj in _map) {
        if ([obj.observer isEqual:observer] && [obj.keyPath isEqualToString:keyPath]) {
            if (obj.updateBlock) {
                obj.updateBlock(observer, updatedValue);
            }
        }
    }   
}



@end
