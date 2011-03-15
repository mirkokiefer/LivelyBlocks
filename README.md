Objective-C Pretty Iterators
=====

Ever been annoyed by having to use C for-loops to do something simple like filtering or collecting objects from NSArray?
This library will give you some relief:

    [someArray forEach:^(id each) {
      // do something with each element
    }];

    NSArray* filteredArray = [someArray filter:^(id each) {
      return [each isEqual: aCoolObject];
    }];

    NSArray* collectedArray = [someArray collect: ^(id each) {
      if([each isEqual: aCoolObject]) {
        return @"cool";
      } else {
        return @"not cool";
      }
    }];

    [someDictionary keysAndValues: ^(id key, id value) {
      //do something with the current key and value
    }];