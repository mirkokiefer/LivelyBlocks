//  Created by Mirko Kiefer (http://www.mirkokiefer.com) on 3/14/11.

#import "CollectionIterators.h"


@implementation NSArray(NSArrayIterators)

- (void)forEach: (void (^)(id each))block {
  for(id each in self) {
    block(each);
  }
}

- (void)forEachIndexed: (void (^)(id each, NSUInteger index))block {
  NSUInteger index = 0;
  for(id each in self) {
    block(each, index);
    index++;
  }
}

- (void)forEachWithOffset:(NSUInteger)offset stepSize:(NSUInteger)stepSize block: (void (^)(id each))block {
  
  for(NSUInteger index=offset; index<[self count]; index=index+stepSize) {
    block([self objectAtIndex:index]);
  }
}

- (NSArray*)filter: (BOOL (^)(id each))block {
  NSMutableArray* newArray = [NSMutableArray array];
  for(id each in self) {
    if(block(each)) {
      [newArray addObject:each];
    }
  }
  return [NSArray arrayWithArray: newArray];
}

- (NSArray*)filterIndexed: (BOOL (^)(id each, NSUInteger index))block {
  NSMutableArray* newArray = [NSMutableArray array];
  NSUInteger index = 0;
  for(id each in self) {
    if(block(each, index)) {
      [newArray addObject:each];
    }
    index++;
  }
  return [NSArray arrayWithArray: newArray];
}

- (NSArray*)collect: (id (^)(id each))block {
  NSMutableArray* newArray = [NSMutableArray array];
  for(id each in self) {
    [newArray addObject:block(each)];
  }
  return [NSArray arrayWithArray: newArray];
}

- (NSArray*)collectIndexed:(id (^)(id, NSUInteger))block {
  NSMutableArray* newArray = [NSMutableArray array];
  NSUInteger index = 0;
  for(id each in self) {
    [newArray addObject:block(each, index)];
    index++;
  }
  return [NSArray arrayWithArray: newArray];
}

- (NSArray *)reversedArray {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];
  for (id element in enumerator) {
    [array addObject:element];
  }
  return array;
}

- (BOOL)any:(BOOL (^)(id))block {
  __block BOOL any = NO;
  [self forEach:^(id each) {
    if(block(each)) {
      any = YES;
    }
  }];
  return any;
}

- (BOOL)all:(BOOL (^)(id))block {
  __block BOOL all = YES;
  [self forEach:^(id each) {
    if(!block(each)) {
      all = NO;
    }
  }];
  return all;
}

@end

@implementation NSDictionary(NSDictionaryIterators)

- (void)keysAndValues: (void (^)(id key, id value))block {
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    block(key, obj);
  }];
}

@end

@implementation NSNumber(NSNumberIterators)

- (void)forEach:(void (^)())block {
  NSInteger value = [self integerValue];
  for(NSInteger i=0; i<value; i++) {
    block();
  }
}

- (void)forEachIndexed:(void (^)(NSInteger each))block {
  NSInteger value = [self integerValue];
  for(NSInteger i=0; i<value; i++) {
    block(i);
  }
}

@end