//
//  NSObject+QOP.h
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QOPDataBindContext.h"
#import <extobjc/EXTobjc.h>



#define _QOPObserve(TARGET,KEYPATH, OPTIONS) \
({\
TARGET.qop.bind(TARGET).observe(@keypath(TARGET,KEYPATH)).options(OPTIONS); \
})

#if __clang__ && (__clang_major__ >= 8)
#define QOPObserve(TARGET, KEYPATH) _QOPObserve(TARGET, KEYPATH, (NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld))
#else

#define QOPObserve(TARGET, KEYPATH) \
({ \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wreceiver-is-weak\"") \
_QOPObserve(TARGET, KEYPATH,(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)) \
_Pragma("clang diagnostic pop") \
})
#endif

@interface NSObject (QOP)

- (QOPDataBindContext *)qop;

@end



