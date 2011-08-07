//
//  LCBlockTests.m
//  CollectionIterators
//
//  Created by Mirko on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCBlockTests.h"
#import "LCBlock.h"

@implementation LCBlockTests

- (void)testLCBoolBlockifTrueifFalse {
  __block BOOL trueEvaled = NO;
  LCBoolBlock* boolBlock = [LCBoolBlock boolBlock:^BOOL(void) {
    return YES;
  }];
  [boolBlock ifTrue:^(void) {
    trueEvaled = YES;
  } ifFalse:^(void) {
    trueEvaled = NO;
  }];
  
  STAssertTrue(trueEvaled, @"failed");
}

@end
