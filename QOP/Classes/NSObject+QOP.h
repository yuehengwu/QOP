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


#define _QOPObserve(OBJC,TARGET,KEYPATH,POLICY) \
({\
OBJC.qop.bind(TARGET).value(@keypath(TARGET,KEYPATH)).policy(POLICY); \
})

#define _QOPUnObserve(OBJC,TARGET,KEYPATH) \
({ \
OBJC.qop.unbind(TARGET).value(@keypath(TARGET,KEYPATH)); \
})

/// specify target / keypath
#define QOPObserve(TARGET, KEYPATH) _QOPObserve(TARGET,TARGET,KEYPATH,QOPKVOPolicyNew)

/// specify observer / target / keypath
#define QOPSObserve(OBJC,TARGET,KEYPATH) _QOPObserve(OBJC,TARGET,KEYPATH,QOPKVOPolicyNew)

/// specify observer / target / keypath / policy
#define QOPSPObserve(OBJC,TARGET,KEYPATH,QOPKVOPolicy) \
_QOPObserve(OBJC,TARGET,KEYPATH,QOPKVOPolicy)

/// unobserve with target / keypath
#define QOPUNObserve(TARGET, KEYPATH) _QOPUnObserve(TARGET,TARGET,KEYPATH)

/// unobserve with observer / target / keypath
#define QOPSUNObserve(OBJC,TARGET,KEYPATH) \
_QOPUnObserve(OBJC,TARGET,KEYPATH) \


@interface NSObject (QOP)

- (QOPDataBindContext *)qop;

@end



