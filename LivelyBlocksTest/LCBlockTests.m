//
//  LCBlockTests.m
//  LivelyBlocks
//
//  Created by Mirko on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCBlockTests.h"
#import "LCBlock.h"

@implementation LCBlockTests

- (void)testLCBoolBlockifTrueifFalse {
  IDBlock boolBlock = ^() {
    return LCYes;
  };
  LCBool* trueEvaled = [boolBlock() ifYes:^(void) {
    return LCYes;
  } ifNo:^(void) {
    return LCNo;
  }];
  
  STAssertTrue(trueEvaled.value, @"failed");
}

- (void)testLCMatch {
  LCMatch* match = [LCMatch match];
  [match on:@"a" do:^id(void) {
    return @"matched";
  }];
  [match on:@"b" do:^id(void) {
    return @"not matched";
  }];
  STAssertEquals([match match:@"a"], @"matched", @"fails");
}

@end
