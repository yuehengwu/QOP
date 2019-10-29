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

@implementation NSHashTable (qopSafe)

- (void)qop_safeAdd:(id)object {
    if (![self containsObject:object]) {
        [self addObject:object];
    }
}

@end

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
        
        if (!observer) {
            NSAssert(NO, @"Plz don't input a null observer.");
        }
        
        self.tempInfo.observer = observer;
        return self;
    };
}

- (BindContextBlock)unbind {
    
    _tempInfo = [[QOPKVOInfo alloc]init];
    
    return ^QOPDataBindContext *(id observer){
        
        if (!observer) {
            NSAssert(NO, @"Plz don't input a null observer.");
        }
        
        self.tempInfo.observer = observer;
        self.tempInfo.isUnObserve = YES;
        return self;
    };
}

- (KeyPathContextBlock)value {
    
    NSParameterAssert(_tempInfo.observer);
    
    return ^QOPDataBindContext *(NSString *keypath) {
        
        if (!keypath) {
            NSAssert(NO, @"Plz don't input a null keypath.");
        }
        
        self.tempInfo.keyPath = keypath; // Fix bug that tempInfo doesn't contain keypath when unbind first. Fixed on 2019-10-29
        
        // If unobserve
        if (self.tempInfo.isUnObserve) {
            [self.kvo unbind:self.tempInfo];
            return self;
        }
        
        // If observe
        [self.map qop_safeAdd:self.tempInfo];
        
        return self;
    };
}

- (KVOOptionsContextBlock)options {
    
    NSParameterAssert(_tempInfo.observer);
    
    return ^QOPDataBindContext *(NSKeyValueObservingOptions options) {
      
        self.tempInfo.options = options;
        
        [self.map qop_safeAdd:self.tempInfo];
        
        return self;
    };
}

- (id<QOPDataBinding>)update:(UpdateContextBlock)updateBlock {
    
    if (_tempInfo.isUnObserve) {
        NSAssert(NO, @"unobserve doesn't need to perform this fuction !");
        return self;
    }
    
    NSParameterAssert(_tempInfo.keyPath);
    
    _tempInfo.updateBlock = updateBlock;
    
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
    
    for (QOPKVOInfo *obj in _map) {
        if ([obj.observer isEqual:observer] && [obj.keyPath isEqualToString:keyPath]) {
            if (obj.updateBlock) {
                obj.updateBlock(observer, updatedValue);
            }
        }
    }   
}



@end
