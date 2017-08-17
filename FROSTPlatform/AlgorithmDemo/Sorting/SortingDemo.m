//
//  SortingDemo.m
//  FROSTPlatform
//
//  Created by frost on 17/8/13.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "SortingDemo.h"

@implementation SortingDemo

void selectionSortingAction()
{
    
    int sortArray[10] = {3,4,1,8,2,9,10,7,1,5};
    
    int arraySize = sizeof(sortArray)/sizeof(sortArray[0]);
    
    int tmpIndx ;
    
    int temObjec;
    
    int j; int i;
    
    for (i = 0; i < arraySize - 1; i++) {
        
        tmpIndx = i;
        
        for (j = i+1; j < arraySize; j++) {
            
            if (sortArray[tmpIndx] > sortArray[j]) {
                
                tmpIndx = j;
                
            }
            
        }
        
        if (tmpIndx != i) {
            temObjec = sortArray[i];
            sortArray[i] = sortArray[tmpIndx];
            sortArray[tmpIndx] = temObjec;
        }
    

        
    }
    
    
}


void InsertionSortingAction() {
    
    int sortArray[4] = {4,3,1,8};

    int arraySize = sizeof(sortArray)/sizeof(sortArray[0]);
    
    int i; int j;
    
    int temObjec;
    
    for (i = 1; i < arraySize; i++) {

        temObjec = sortArray[i];

        j = i-1;
        
        while (( j >= 0 ) && ( temObjec < sortArray[j])){
            sortArray[j+1]=sortArray[j];
            j--; // 顺序比较和移动,依次将元素后移动一个位置
        }
        
        sortArray[j+1]=temObjec;//元素后移后要插入的位置就空出了，找到该位置插入
    }
    
}

void ShellSortingAction() {

    int i, j, gap ,temObjec;
    
    int sortArray[9] = {9,8,7,6,5,4,3,2,1};
    
    int arraySize = sizeof(sortArray)/sizeof(sortArray[0]);
    
    gap = arraySize/2;
    
    while (gap > 0 ) {
        
        for (i = gap; i < arraySize; i++) {
            
            for (j = i; j - gap>=0; j=j-gap) {
                
                if (sortArray[j] < sortArray[j - gap]) {
                    temObjec = sortArray[j];
                    sortArray[j] = sortArray[j - gap];
                    sortArray[j - gap] = temObjec;
                }
                
            }
            
        }
        
        gap = gap/2;
        
    }
    
}

void MergeSortingAction()
{
    int sortArray[9] = {9,8,7,6,5,4,3,2,1};
    
    int arraySize = sizeof(sortArray)/sizeof(sortArray[0]);
    
    merge_sort(sortArray, 0, arraySize-1);
}

void merge_sort(int a[], int start, int end)
{
    int mid;
    
    if (start < end)
    {
         mid = (start + end) / 2;
         merge_sort(a, start, mid);
         merge_sort(a, mid+1, end);
        
         merge(a, start, mid, end);
    }
    
}

void merge(int a[], int start, int mid, int end)
{
    int n1 = mid - start + 1;
    int n2 = end - mid;
    int left[n1], right[n2];
    int i, j, k;
    
    for (i = 0; i < n1; i++) /* left holds a[start..mid] */
        left[i] = a[start+i];
    for (j = 0; j < n2; j++) /* right holds a[mid+1..end] */
        right[j] = a[mid+1+j];
    
    i = j = 0;
    k = start;
    while (i < n1 && j < n2)
    if (left[i] < right[j])
            a[k++] = left[i++];
    else
        a[k++] = right[j++];
    
    while (i < n1) /* left[] is not exhausted */
        a[k++] = left[i++];
    while (j < n2) /* right[] is not exhausted */
        a[k++] = right[j++];
}

@end
