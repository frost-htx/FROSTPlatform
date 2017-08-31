//
//  LeftistHeaps.c
//  FROSTPlatform
//
//  Created by frost on 2017/8/25.
//  Copyright © 2017年 frost. All rights reserved.
//

#include <stdlib.h>

#include "LeftistHeaps.h"

#define LENGTH(a) ( (sizeof(a)) / (sizeof(a[0])) )


typedef struct leftistNode {
    
    int key;
    int npl;
    
    struct leftistNode *left;
    struct leftistNode *right;
    
}LeftistNode,*LeftistHeap;

static void swap_node(LeftistNode *x,LeftistNode *y)
{
    LeftistNode temp = *x;
    *x = *y;
    *y = temp;
}

LeftistNode* merge_leftist(LeftistHeap x, LeftistHeap y)
{
    if (x == NULL) {
        return y;
    }
    
    if (y == NULL) {
        return x;
    }
    
    if (x->key > y->key) {
        swap_node(x, y);
    }
    
    x->right = merge_leftist(x->right, y);
    
    if (x->left == NULL || x->left->npl < x->right->npl) {
        LeftistNode *tmp = x->left;
        x->left = x->right;
        x->right = tmp;
    }
    
    if (x->right == NULL || x->left == NULL)
        x->npl = 0;
    else
        x->npl = (x->left->npl > x->right->npl) ? (x->right->npl + 1) : (x->left->npl + 1);
    
    return x;
}

LeftistNode* insert_leftist(LeftistHeap heap, int key)
{
    LeftistNode *node = (LeftistNode *)malloc(sizeof(LeftistNode));
    
    if ((node = malloc(sizeof(LeftistNode))) == NULL) {
        return heap;
    }
    
    node->key = key;
    node->npl = 0;
    node->left = node->right = NULL;
    
    return merge_leftist(heap, node);
}

void swap(int * a1, int * b1)
{
    int temp = *a1;
    *a1 = *b1;
    *b1 = temp;
}

void LeftistHeaps_main()
{
    
    int a[]= {1,2,10};
    int b[]= {6,7,11};
    
    int len_a = LENGTH(a);
    int len_b = LENGTH(b);

    LeftistHeap heap_a,heap_b;
    
    heap_a = heap_b = NULL;
    
    
    for (int i =0 ; i <len_a; i++) {
        heap_a = insert_leftist(heap_a, a[i]);
    }

    for (int i =0 ; i <len_b; i++) {
        heap_b = insert_leftist(heap_b, b[i]);
    }
    
    heap_a = merge_leftist(heap_a, heap_b);
    
}

