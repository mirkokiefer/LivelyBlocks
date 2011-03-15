//
//  CollectionIteratorsTests.m
//  CollectionIteratorsTests
//
//  Created by Mirko on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CollectionIteratorsTests.h"
#import "NSArrayIterators.h"

@implementation CollectionIteratorsTests

- (void)setUp {
  [super setUp];
    
  animals = [[NSArray alloc] initWithObjects: @"Dog", @"Lionfish", @"Cat", @"Shark", nil];
  fishes = [[NSArray alloc] initWithObjects: @"Lionfish", @"Shark", nil];
}

- (void)tearDown {
  [animals release];
  [fishes release];
  [super tearDown];
}

- (void)testForEach {
  NSMutableArray* resultArray = [NSMutableArray array];
  
  [animals forEach:^(id each) {
    [resultArray addObject:each];
  }];
  
  STAssertEquals([animals count], [resultArray count], @"forEach fails");
}

- (void)testForEachIndexed {
  NSMutableArray* resultArray = [NSMutableArray arrayWithObjects: @"a", @"b", @"c", @"d", nil];
  
  [animals forEachIndexed:^(id each, NSInteger index) {
    [resultArray replaceObjectAtIndex:index withObject:each];
  }];
  
  STAssertTrue([resultArray isEqualToArray: animals], @"forEachIndexed fails");
}

- (void)testFilter {
  
  NSArray* filterFishes = [animals filter: ^(id each) {
    return [fishes containsObject:each];
  }];
  
  STAssertTrue([filterFishes isEqualToArray: fishes], @"filter fails");
}

- (void)testCollect {
  NSArray* targetArray = [NSArray arrayWithObjects: @"noFish", @"fish", @"noFish", @"fish", nil];
  
  NSArray* resultArray = [animals collect: ^(id each) {
    if([fishes containsObject:each]) {
      return @"fish";
    } else {
      return @"noFish";
    }
  }];
  
  STAssertTrue([resultArray isEqualToArray: targetArray], @"collect fails");
}

@end
