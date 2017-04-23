//
//  ChainTableDemo.m
//  FROSTPlatform
//
//  Created by frost on 17/4/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "ChainTableDemo.h"

typedef int NodeData;

typedef struct Node
{
   
    NodeData data;
    struct Node *next;
    
}Node;

typedef struct Node * ChainList;


@implementation ChainTableDemo

-(instancetype)init {
    if (self = [super init]) {
        
        ChainList list = InitChainList();
    }
    return self;
}

ChainList InitChainList ()
{
    ChainList chainList;
    
    chainList  = malloc(sizeof(ChainList));
    
    if (chainList == NULL) {
        NSLog(@"初始化链表失败！");
        exit(-1);
    }
    
    return chainList;
}

void Creat_ChainList(Node *list)
{
    int a = 10;
    
    Node *element;
    
    for (int i = 0; i < a; i ++) {
        element = malloc(sizeof(Node));
        element->data = i;
        element->next = list->next;
        list->next = element;
    }
}









@end
