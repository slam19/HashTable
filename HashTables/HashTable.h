//
//  HashTable.h
//  HashTables
//
//  Created by Simon Lam on 2/21/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef HashTable_h
#define HashTable_h
@interface HashTable: NSObject
@property int *table;
@property int tableSize;

-(id) initWithSize:(int) s;
-(int) hash: (int) i;
-(void) fillTableWithRandomInt;
-(int) findIndex: (int) i;
-(int) searchMiss;

@end


#endif /* HashTable_h */
