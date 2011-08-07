//
//  LCBlock.h
//  Wire
//
//  Created by Mirko on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

typedef BOOL (^BoolBlock)();
typedef void (^VoidBlock)();
typedef id (^IDBlock)();

@interface LCBoolBlock : NSObject
+ (id)boolBlock:(BoolBlock)block;
- (void)ifTrue:(VoidBlock)block ifFalse:(VoidBlock)block;
- (BOOL)eval;
@end

@interface LCVoidBlock : NSObject
+ voidBlock:(VoidBlock)block;
- (void)eval;
@end

@interface LCMatch : NSObject
+ (id)match;
+ (id)matchWith:(NSArray*)conditions;
- (id)on:(id)object eval:(IDBlock)block;
@end