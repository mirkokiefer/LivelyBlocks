//  Created by Mirko Kiefer (http://www.mirkokiefer.com) on 3/14/11.

#import <Foundation/Foundation.h>


@interface NSArray(NSArrayIterators)
- (void)forEach: (void (^)(id each))block;
- (void)forEachIndexed: (void (^)(id each, NSInteger index))block;
- (NSArray*)filter: (BOOL (^)(id each))block;
- (NSArray*)collect: (id (^)(id each))block;
@end

@interface NSDictionary(NSDictionaryIterators)
- (void)keysAndValues: (void (^)(id key, id value))block;
@end