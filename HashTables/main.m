//
//  main.m
//  HashTables
//
//  Created by Simon Lam on 2/21/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HashTable.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        HashTable *hashTable = [[HashTable alloc]initWithSize:100000];
        [hashTable fillTableWithRandomInt];
//        for(int i = 0; i<1000; i++){
//            printf("%d, ", hashTable.table[i]);
//        }
        int sumOfCollisions = 0;
        for(int i = 0; i<100000; i++){
            sumOfCollisions += [hashTable searchMiss];
        }
        printf("Collisions: %f", (double) sumOfCollisions/100000);
    }
    return 0;
}

