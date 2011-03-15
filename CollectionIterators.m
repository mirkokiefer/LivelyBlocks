//
//  NSArrayIterators.m
//  CollectionIterators
//
//  Created by Mirko on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CollectionIterators.h"


@implementation NSArray(NSArrayIterators)

- (void)forEach: (void (^)(id each))block {
  for(id each in self) {
    block(each);
  }
}

- (void)forEachIndexed: (void (^)(id each, NSInteger index))block {
  NSInteger index = 0;
  for(id each in self) {
    block(each, index);
    index++;
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

- (NSArray*)collect: (id (^)(id each))block {
  NSMutableArray* newArray = [NSMutableArray array];
  for(id each in self) {
    [newArray addObject:block(each)];
  }
  return [NSArray arrayWithArray: newArray];
}

@end

@implementation NSDictionary(NSDictionaryIterators)

- (void)keysAndValues: (void (^)(id key, id value))block {
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    block(key, obj);
  }];
}

@end