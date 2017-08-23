//
//  BinaryHeapSorting.c
//  FROSTPlatform
//
//  Created by frost on 17/8/23.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "BinaryHeapSorting.h"

#include <stdio.h>
#include <stdlib.h>

#define LENGTH(a) ( (sizeof(a)) / (sizeof(a[0])) )

static int m_heap[10];
static int m_total_num = 10;
static int m_current_num = 0;

int get_index(int data)
{
    for (int i = 0; i < m_total_num ; i++) {
        if (data == m_heap[i]) {
            return i;
        }
    }
    
    return -1;
}

void insert_SortingHeap(int index) //插入数据时，二叉堆排序
{
    
    int insert_data = m_heap[index];
    
    int i = index; //插入的节点
    
    int j = (i - 1)/2;   //父节点
    
    while (j > 0) {
        
        if (m_heap[j] <= insert_data) {
            break;
        }
        
        m_heap[i] = m_heap[j];
        
        i = j;
        
        j = (i -1)/2;
        
    }
    
    m_heap[index] = insert_data;
}


int heap_insert(int data)
{
    if (m_current_num == m_total_num) { //堆已经满了
        return -1;
    }
    
    m_heap[m_current_num] = data;
    
    insert_SortingHeap(m_current_num);
    
    m_current_num ++;
    
    return 0;
}

void delete_SortingHeap(int start, int end)//删除数据时，二叉堆排序
{
    int i = start;
    
    int temp = m_heap[i];
    
    int size = end;
    
    int j = 2*i + 1;
    
    while (j <= size) {
        
        if (j+1 < size && m_heap[j+1] < m_heap[j]) { //找出左右节点中最小的
            j++;
        }
        
        if (m_heap[j] >= temp ) {
            break;
        }
        
        m_heap[i] = m_heap[j];
        
        i = j;
        
        j = 2*i +1;
        
        
        
    }
    
    m_heap[i] = temp;
    
}

int heap_delete(int data)
{
    if (m_current_num == 0) { //堆已经空了
        return -1;
    }
    
    int index = get_index(data);
    
    if (index == -1) { //数据不在堆中
        return -1;
    }
    
    m_heap[index] = m_heap[--m_current_num]; //使用堆中最后一位来替换删除的元素
    
    delete_SortingHeap(index, m_current_num - 1);
    
    return 0;
}


void heap_printf()
{
    for (int i = 0; i < m_current_num; i++) {
        printf("%d",m_heap[i]);
    }
}

