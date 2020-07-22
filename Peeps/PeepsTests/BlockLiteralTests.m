// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

void sayHello(void) {
    printf("Hello!\n");
}

void saySomethingNTimes(int count, void (*thingToSay)(void)) {
    for (int i = 0; i < count; i++) {
        thingToSay();
    }
}

void saySomethingWithBlock(int count, void (^block)(void)) {
    for (int i = 0; i < count; i++) {
        block();
    }
}

@interface BlockLiteralTests : XCTestCase
@property (copy, nonatomic) NSString *text;
@end


@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"partly cloudy";
}

- (void)testCapturingSelf {
    typeof(self) __weak weakSelf = self;
    
    saySomethingWithBlock(3, ^{
        printf("The weather is %s!\n", weakSelf.text.UTF8String);
    });
}

- (void)testCapturingLocalState {
    char *weather = "sunny";
        
    saySomethingWithBlock(3, ^{
        printf("The weather is %s!\n", weather);
    });
}

- (void)testBlockLiteral {
    void (^myBlock)(void);
    
    myBlock = ^{
        printf("Woo!\n");
    };
    
    myBlock();
    
    id copyOfMyBlock = [myBlock copy];
    NSLog(@"%@", copyOfMyBlock);
    
    saySomethingWithBlock(3, ^{
        printf("Whee!\n");
    });
}

- (void)testFunctionPointer {
    void (*myPtr)(void);
    
    myPtr = sayHello;
    
    myPtr();
}

- (void)testCallbackWithFunction {
    saySomethingNTimes(2, sayHello);
}


@end
