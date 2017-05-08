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

typedef struct  DoublyNode
{
    
    NodeData data;
    struct DoublyNode *next;
    struct DoublyNode *pre;
    
}DoublyNode;

typedef struct DoublyChainList
{
    DoublyNode *head;
    DoublyNode *tail;
    int size;
    
}DoublyChainList;

typedef struct Node * ChainList;
typedef struct Node * SingleCycleList;

typedef struct DoublyChainList * Doublylist;


@implementation ChainTableDemo

-(instancetype)init {
    if (self = [super init]) {
        
        
        /**单项列表
         */
//        ChainList list = InitChainList();
//        Creat_ChainList(list);
//        Node *newNode = InitNodeData();
//        ChainListInsertItem(list,newNode,5); //插入元素到链表中
//        ChianListDeleteItem(list,2); //删除链表中的元素；
//        DeleteChainList(list); //删除整个链表;
        
        /**单项循环列表
         */
        
        SingleCycleList list = InitSingleCycleList();
        
        Node *newNode = MakeSingleNode(10);
        
        InsertNodeToList(list, newNode,5);
        
//        /**双向循环列表
//         */
//        
//        Doublylist doublylist= InitDoublyChainList();
//        InsertFirstNode(doublylist, MakeNode(10));
        
    }
    return self;
}

/**********************************************单向链表****************************************************/

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

/**********************************************单向循环链表****************************************************/

SingleCycleList InitSingleCycleList()
{
    SingleCycleList list = malloc(sizeof(SingleCycleList));
    
    if (!list) {
        printf("创建单向循环链表失败");
        exit(1);
    }
    
    list->next = list; //单向循环列表头节点指针指向自己
    
    return list;
}

Node* MakeSingleNode(NodeData data)
{
    Node *node = malloc(sizeof(Node));
    node->data = data;
    return node;
}

void InsertNodeToList(SingleCycleList list,Node *node,int Index)
{
    
    if (Index > GetListLength(list)) {
        exit(1);
    }
    
    
    int j=0;
    
    Node *p = list;
    
    while (Index < j) {
        j++;
        p = p->next;
    }
    
    while (p != list) {
        p = p->next;
    }
    
    list->next = node;
    node->next = list;
}

int GetListLength(SingleCycleList list)
{
    int a = 0;
    
    Node *p = list->next;
    
    if (p != list) {
        p = p->next;
        a++;
    }
    return a;
}

/**********************************************双向链表****************************************************/

Doublylist InitDoublyChainList()
{
    
    Doublylist doublyList = malloc(sizeof(Doublylist));
    
    DoublyNode *head = MakeNode(0);

    
    if (!doublyList) {
        exit(1);
    }
    
    doublyList->head = head;
    doublyList->tail = head;
    doublyList->size = 0;
    
    return doublyList;
    
}

DoublyNode *MakeNode(NodeData data)
{
    DoublyNode *node = malloc(sizeof(DoublyNode));
    if (node) {
        node->data = data;
        node->pre = NULL;
        node->next = NULL;
    }
    return node;
}

DoublyNode *GetHeadNode(Doublylist ChainList)
{
    return ChainList->head;
}

void InsertFirstNode(Doublylist ChainList,DoublyNode *node)
{
    DoublyNode *headNode = GetHeadNode(ChainList);
    
    if (IsEmptyList(ChainList)) {
        ChainList->tail = node;
    }
    
    ChainList->size++;

    
    node->next = headNode->next;
    node->pre = headNode;
    
    if (headNode->next != NULL) {
        headNode->next->pre = node;
    }
    
    headNode->next =node;
    
}

bool IsEmptyList(Doublylist ChainList)
{
    if (ChainList->size == 0 && ChainList->head&& ChainList->tail) {
        return 1;
    } else {
        return 0;
    }
}

@end
