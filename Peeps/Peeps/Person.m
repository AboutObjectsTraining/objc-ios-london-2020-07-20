// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName
                    age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = aFirstName;
    _lastName = aLastName;
    _age = anAge;
    
    // Don't call our own methods until after we've initialized ivars.
    
    return self;
}

+ (id)personWithFirstName:(NSString *)aFirstName
                 lastName:(NSString *)aLastName
                      age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    // TODO: copy the value
    _firstName = newValue;
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = newValue;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@, age: %@", [self fullName], @([self age])];
}

@end