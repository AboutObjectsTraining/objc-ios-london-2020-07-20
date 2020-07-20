// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PeepsTests : XCTestCase
@end

@implementation PeepsTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    XCTAssertNotNil(fred);
}

- (void)testPopulatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:33];
    
    NSString *name = [fred firstName];
    
    NSLog(@"Name is %@", name);
    NSLog(@"%@", fred);
}

- (void)testInitializePerson {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"
                                                 age:33];
//    [fred setAge:33];
    NSLog(@"%@", fred);
}

- (void)testFactoryMethod {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"
                                           age:33];
    NSLog(@"%@", fred);
}

@end
