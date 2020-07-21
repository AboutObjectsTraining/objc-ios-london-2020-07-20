// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testStringClassCluster {
    
    
}

- (void)testWorkingWithArrays {
    Person *p = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:33];
    Dog *d = [[Dog alloc] init];
    NSArray *a1 = [NSArray arrayWithObjects:p, d, @"Foo", nil];
    NSLog(@"%@", a1);
    
    NSArray *a2 = @[p, d, @"Bar", @23];
    NSLog(@"%@", a2);
    
    NSMutableArray *mutableArray = [a2 mutableCopy];
    [mutableArray insertObject:@"Woo!" atIndex:0];
    NSLog(@"%@", mutableArray);
    
    for (int i = 0; i < [mutableArray count]; i++) {
        //        NSLog(@"index: %d, value: %@", i, [mutableArray objectAtIndex:i]);
        NSLog(@"index: %d, value: %@", i, mutableArray[i]);
    }
    
    for (id currObj in [mutableArray reverseObjectEnumerator]) {
        NSLog(@"%@", currObj);
    }
}

@end
