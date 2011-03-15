//
//  NSArrayIterators.h
//  CollectionIterators
//
//  Created by Mirko on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray(NSArrayIterators)
- (void)forEach: (void (^)(id each))block;
- (void)forEachIndexed: (void (^)(id each, NSInteger index))block;
- (NSArray*)filter: (BOOL (^)(id each))block;
- (NSArray*)collect: (id (^)(id each))block;
@end
