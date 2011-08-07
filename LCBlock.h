//
//  LCBlock.h
//  Wire
//
//  Created by Mirko on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^BoolBlock)();
typedef void (^VoidBlock)();
typedef id (^IDBlock)();

#define LCYes [LCBool yes]
#define LCNo [LCBool no]


@interface LCMatch : NSObject
+ (id)match;
- (void)on:(id)object do:(IDBlock)block;
- (id)match:(id)object;
@end

@interface LCBool : NSObject
@property(readonly) BOOL value;
+ (id)yes;
+ (id)no;
+ (id)boolWith:(BOOL)val;
- (id)initWith:(BOOL)val;
- (id)ifYes:(IDBlock)yesBlock ifNo:(IDBlock)noBlock;
@end

typedef NSNumber* (^NumberFloatBlock)(CGFloat val);
typedef CGFloat (^FloatNumberBlock)(NSNumber* val);

extern const NumberFloatBlock oFloat;
extern const FloatNumberBlock cFloat;