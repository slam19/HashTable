//
//  HashTable.m
//  HashTables
//
//  Created by Simon Lam on 2/21/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HashTable.h"
@implementation HashTable

-(id) initWithSize:(int) s{
    self = [super init];
    if (self){
        self.tableSize = s;
        self.table = (int *)malloc(sizeof (int)*self.tableSize);
        for(int i = 0; i<self.tableSize; i++){
            self.table[i] = -1;
        }
    }
    return self;
}

-(void) fillTableWithRandomInt{
    for(int i = 0; i<self.tableSize/2 +1; i++){
        int d = arc4random_uniform(self.tableSize);
        int index = [self findIndex:d];
        if(index != -1){
            self.table[index] = d;
        }else{
            i--; //ensure n/2 distinct random integers are inserted
        }
    }
}
-(int) findIndex: (int) d{
    int index = [self hash: d];
    while(self.table[index]!=-1){
        if(self.table[index] == d){
            return -1;
        }
        index = (index +1) % self.tableSize;
    }
    return index;
}

-(int) hash:(int) i{ //hashfunction
    return (i% self.tableSize);
}

-(int) searchMiss{
    int collisions = 0;
    int n = self.tableSize + arc4random_uniform(self.tableSize); //searching for integer that is not in the table.
    int index = [self hash: n];
    while(self.table[index] != -1){
        collisions++; //don't even need to check if integer is there. Just need to find next empty space.
        index = (index +1) % self.tableSize;
    }
    return collisions;
}





@end
