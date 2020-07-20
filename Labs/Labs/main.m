// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Basics.h"
#import <stdlib.h>

void FoolAroundWithStrings(void) {
    printf("In %s\n", __func__);
    
    char name[] = "Fred Smith";
    char *charRef = name;
//    char *foo = "Fred Smith";
    
    // Prints: address is 0x7fff5fbff7dd, value is F
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", name, *name);
    // Prints: address is 0x7fff5fbff7de, value is r
    printf("address is %p, value is %c\n", &charRef[1], charRef[1]);
    printf("address is %p, value is %c\n", name + 1, *(name + 1));
    
//    name += 5;
    charRef += 5; // Moves the pointer past the substring “Fred “ // Prints: address is 0x7fff5fbff7e2, value is Smith
    printf("address is %p, value is %s\n", charRef, charRef);
}

void Capitalize(char *word) {
    const char delta = 'a' - 'A';
    word[0] -= delta;
}


int main(int argc, const char * argv[]) {
//    Capitalize("hello");
//    free("hello");
    FoolAroundWithStrings();
    return 0;
}
