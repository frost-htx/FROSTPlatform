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
        Creat_ChainList(list);
        
//        Node *newNode = InitNodeData();
//        ChainListInsertItem(list,newNode,5); //插入元素到链表中
//        ChianListDeleteItem(list,2); //删除链表中的元素；
        DeleteChainList(list); //删除整个链表;
        
    }
    return self;
}

Node* InitNodeData()
{
    Node *nodeData;
    nodeData = malloc(sizeof(Node));
    if (nodeData) {
        nodeData->data = 11;
    }
    return nodeData;
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

void Creat_ChainList(ChainList list)
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


Node* GetChainListItem(ChainList list,int Index)
{
    int j = 0;
    
    Node *item = list;
    
    while (j < Index && item) {
        item = item->next;
        j++;
    }
    
    if (item) {
        return item;
    } else {
        printf("不存在此节点");
        return NULL;
    }
    
}


void ChainListInsertItem(ChainList chainList,Node* newNode,int Index)
{
    Node *item = GetChainListItem(chainList, Index);
    newNode->next = item->next;
    item->next = newNode;
    
}

void ChianListDeleteItem(ChainList chainList,int Index)
{
    Node *preItem = chainList;
    int j = 0;
    
    while (j < Index - 1 && preItem) {
        preItem = preItem->next;
        j++;
    }
    
    if (preItem) {
        Node *currentItem = preItem -> next;
        Node *nextItem = currentItem -> next;

        preItem->next = nextItem;
        free(currentItem);
        currentItem = NULL;
    }
}

void DeleteChainList(ChainList chainList)
{
    ChainList p,q;
    
    p = chainList ->next;
    
    while (p) {
        
        q = p ->next;
        free(p);
        p = q;
        
    }
    
    chainList->next = NULL;
}

@end
