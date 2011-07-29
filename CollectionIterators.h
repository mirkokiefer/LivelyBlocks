//  Created by Mirko Kiefer (http://www.mirkokiefer.com) on 3/14/11.

#import <Foundation/Foundation.h>


@interface NSArray(NSArrayIterators)
- (void)forEach: (void (^)(id each))block;
- (void)forEachIndexed: (void (^)(id each, NSUInteger index))block;
- (NSArray*)filter: (BOOL (^)(id each))block;
- (NSArray*)filterIndexed: (BOOL (^)(id each, NSUInteger index))block;
- (NSArray*)collect: (id (^)(id each))block;
- (NSArray*)collectIndexed: (id (^)(id each, NSUInteger index))block;
- (NSArray *)reversedArray;
@end

@interface NSDictionary(NSDictionaryIterators)
- (void)keysAndValues: (void (^)(id key, id value))block;
@end