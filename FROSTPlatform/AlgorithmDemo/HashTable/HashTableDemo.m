//
//  HashTableDemo.m
//  FROSTPlatform
//
//  Created by frost on 17/4/4.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "HashTableDemo.h"

#define NO_KEY -32768
typedef struct HashTable    *hashTable;
typedef struct HashtableCell    *Cell;
typedef unsigned int    Index;

static int TableSize = 11;

struct HashTable {
    int TableSize;
    int *lists;
};

struct HashtableCell {
    
};

@implementation HashTableDemo

-(instancetype)init {
    if ([super init]) {
        Main();
    }
    return self;
}

void Main()
{
    int element[11] = {100,101,102,103,104,105,106,107,108,109,110};
    
    struct HashTable *hashTable = initHashTable(TableSize);
    
    for (int i = 0; i<TableSize; i ++) {
        InserHash(hashTable, element[i]);
    }
//
    int addr = SearchHashTable(hashTable, 108);
    
}

//Index Hash(const char *key, int TableSize)
//{
//    unsigned int HashVal = 0;
//    
//    while (*key != '\0') {
//        HashVal = *key++;
//    }
//    
//    return HashVal % TableSize;
//};

Index Hash(int key)
{
    return key % TableSize;
};


struct HashTable *initHashTable(int TableSize) {
    
    struct HashTable *hashTable = malloc(sizeof(hashTable));
    
    hashTable->TableSize =TableSize;
    hashTable->lists = malloc(TableSize * sizeof(int));
    
    for (int i = 0  ; i < TableSize; i++) {
        hashTable->lists[i] = NO_KEY;
    }
    
    return hashTable;
}

void InserHash(struct HashTable *H , int key) {
    
    int address = Hash(key);
    
    while (H->lists[address] != NO_KEY) {
        address = (address + 1) % TableSize;
    }
    
    H->lists[address] = key;
    
}

int SearchHashTable(struct HashTable *H,int key) {
    
    int addr = Hash(key);
    
    while (H->lists[addr] != key) {
        addr = (addr + 1) % TableSize;
        if (H->lists[addr] == NO_KEY || addr == Hash(key)) {
            return -1;
        }
    }
    
    return addr;
}

@end
