// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Dog.h"

@implementation Dog

- (void)bark {
    printf("Woof! Woof!\n");
}

- (id)copyWithZone:(NSZone *)zone {
    id copyOfDog = [[[self class] allocWithZone:zone] init];
    // copy ivars as necessary...
    return copyOfDog;
}

@end
