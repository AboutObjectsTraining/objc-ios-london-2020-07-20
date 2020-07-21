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
    
}

@end
