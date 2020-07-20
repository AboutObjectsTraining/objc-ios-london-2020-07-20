// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@private
    NSString *_firstName;
    NSString *_lastName;
    NSInteger _age;
}

- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName;

- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName
                    age:(NSInteger)anAge;

+ (id)personWithFirstName:(NSString *)aFirstName
                 lastName:(NSString *)aLastName
                      age:(NSInteger)anAge;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSString *)fullName;

- (NSInteger)age;
- (void)setAge:(NSInteger)newValue;

@end
