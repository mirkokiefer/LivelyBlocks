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

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testForEach
{
  NSArray* anArray = [NSArray arrayWithObjects: @"Dog", @"Cat", @"Shark", nil];
  NSMutableArray* resultArray = [NSMutableArray array];
  
  [anArray forEach:^(id each) {
    [resultArray addObject:each];
  }];
  
  STAssertEquals([anArray count], [resultArray count], @"forEach fails");
}

- (void)testForEachIndexed
{
  NSArray* anArray = [NSArray arrayWithObjects: @"Dog", @"Cat", @"Shark", nil];
  NSMutableArray* resultArray = [NSMutableArray arrayWithObjects: @"a", @"b", @"c", nil];
  
  [anArray forEachIndexed:^(id each, NSInteger index) {
    [resultArray replaceObjectAtIndex:index withObject:each];
  }];
  
  STAssertTrue([resultArray isEqualToArray: anArray], @"forEachIndexed fails");
}

- (void)testFilter
{
  NSArray* animals = [NSArray arrayWithObjects: @"Dog", @"Cat", @"Shark", nil];
  NSArray* fishes = [NSArray arrayWithObjects: @"Shark", nil];
  
  NSArray* filterFishes = [animals filter: ^(id each) {
    return [fishes containsObject:each];
  }];
  
  STAssertTrue([filterFishes isEqualToArray: fishes], @"filter fails");
}

- (void)testCollect
{
  NSArray* animals = [NSArray arrayWithObjects: @"Dog", @"Cat", @"Shark", nil];
  NSArray* fishes = [NSArray arrayWithObjects: @"Shark", nil];
  
  NSArray* targetArray = [NSArray arrayWithObjects: @"noFish", @"noFish", @"fish", nil];
  
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
