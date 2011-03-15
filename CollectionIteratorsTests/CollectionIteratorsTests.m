//  Created by Mirko Kiefer (http://www.mirkokiefer.com) on 3/14/11.

#import "CollectionIteratorsTests.h"
#import "CollectionIterators.h"

@implementation CollectionIteratorsTests

- (void)setUp {
  [super setUp];
    
  animals = [[NSArray alloc] initWithObjects: @"Dog", @"Lionfish", @"Cat", @"Shark", nil];
  fishes = [[NSArray alloc] initWithObjects: @"Lionfish", @"Shark", nil];
  animalsCategorized = [NSArray arrayWithObjects: @"noFish", @"fish", @"noFish", @"fish", nil];
}

- (void)tearDown {
  [animals release];
  [fishes release];
  [super tearDown];
}

- (void)testNSArrayForEach {
  NSMutableArray* resultArray = [NSMutableArray array];
  
  [animals forEach:^(id each) {
    [resultArray addObject:each];
  }];
  
  STAssertEquals([animals count], [resultArray count], @"NSArray forEach: fails");
}

- (void)testNSArrayForEachIndexed {
  NSMutableArray* resultArray = [NSMutableArray arrayWithObjects: @"a", @"b", @"c", @"d", nil];
  
  [animals forEachIndexed:^(id each, NSInteger index) {
    [resultArray replaceObjectAtIndex:index withObject:each];
  }];
  
  STAssertTrue([resultArray isEqualToArray: animals], @"NSArray forEachIndexed: fails");
}

- (void)testNSArrayFilter {
  
  NSArray* filterFishes = [animals filter: ^(id each) {
    return [fishes containsObject:each];
  }];
  
  STAssertTrue([filterFishes isEqualToArray: fishes], @"NSArray filter: fails");
}

- (void)testNSArrayCollect {  
  NSArray* resultArray = [animals collect: ^(id each) {
    if([fishes containsObject:each]) {
      return @"fish";
    } else {
      return @"noFish";
    }
  }];
  
  STAssertTrue([resultArray isEqualToArray: animalsCategorized], @"NSArray collect: fails");
}

- (void)testNSDictionaryKeysAndValues {
  NSDictionary* dictionary = [NSDictionary dictionaryWithObjects:animalsCategorized forKeys: animals];
  
  NSMutableArray* resultArray = [NSMutableArray array];
  [dictionary keysAndValues: ^(id key, id value) {
    if([value isEqual:@"fish"]) {
      [resultArray addObject:key];
    }
  }];
  STAssertTrue([resultArray isEqualToArray: fishes], @"NSDictionary keysAndValues: fails");
}

@end
