//
//  LCBlock.m
//  Wire
//
//  Created by Mirko on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCBlock.h"
#import "CollectionIterators.h"

static LCBool* yes;
static LCBool* no;

@interface LCBool()
@property(assign) BOOL value;
@end

@implementation LCBool
@synthesize value;

+ (void)initialize {
  if(self == [LCBool class]) {
    yes = [[self alloc] initWith:YES];
    no = [[self alloc] initWith:NO];
  }
}

+ (id)yes {
  return yes;
}

+ (id)no {
  return no;
}

+ (id)boolWith:(BOOL)val {
  if(val) {
    return yes;
  } else {
    return no;
  }
}

- (id)initWith:(BOOL)val {
  self = [super init];
  self.value = val;
  return self;
}

- (id)ifYes:(IDBlock)yesBlock ifNo:(IDBlock)noBlock {
  if(self.value) {
    return yesBlock();
  } else {
    return noBlock();
  }
}

- (id)ifYesDo:(VoidBlock)block {
  if (self.value == YES) {
    block();
  }
  return self;
}

- (id)ifNoDo:(VoidBlock)block {
  if (self.value == NO) {
    block();
  }
  return self;
}

@end


@interface LCMatch()
@property(retain) NSMutableDictionary* conditions;
@end

@implementation LCMatch
@synthesize conditions;

+ (id)match {
  return [[self alloc] init];
}

- (id)init {
  self = [super init];
  self.conditions = [NSMutableDictionary dictionary];
  return self;
}

- (void)on:(id)object do:(IDBlock)block {
  [self.conditions setObject:[block copy] forKey:object];
}

- (id)match:(id)object {
  IDBlock block = [self.conditions objectForKey:object];
  return block();
}

@end

const NumberFloatBlock oFloat = ^(CGFloat val) {
  return [NSNumber numberWithFloat:val];
};

const FloatNumberBlock cFloat = ^(NSNumber* val) {
  return (CGFloat)[val floatValue];
};

const NumberIntegerBlock oInt = ^(NSInteger val) {
  return [NSNumber numberWithInteger:val];
};

const IntegerNumberBlock cInt = ^(NSNumber* val) {
  return [val integerValue];
};

const LCBoolBoolBlock oBool = ^(BOOL val) {
  return [LCBool boolWith:val];
};

const BoolLCBoolBlock cBool = ^(LCBool* val) {
  return val.value;
};

const NSValueObject oValFromObj = ^(id val) {
  return [NSValue valueWithNonretainedObject:val];
};
