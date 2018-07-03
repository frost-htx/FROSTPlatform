//
//  PrimarySorting.m
//  FROSTPlatform
//
//  Created by frost on 2018/5/19.
//  Copyright © 2018年 frost. All rights reserved.
//


#include <stdio.h>
#include <stdlib.h>

#include "PrimarySorting.h"


int less(int a, int b)
{
    if (a > b) {
        return 1;
    } else {
        return 0;
    }
}

void exch(Comparable s[],int i, int j)
{
    Comparable t = s[i];
    s[i] = s[j];
    s[j] = t;
}

void show(int length ,Comparable s[])
{

    for (int i = 0; i < length; i++) {
        printf("%d ",s[i]);
    }
}

void SelectionSort_Action ()
{
    int sortArray[15] = {8,4,2,5,6,9,0,1,3,7,11,10,12,7,4};
    
    int length = sizeof(sortArray)/sizeof(sortArray[0]);
    
    for (int i = 0; i < length; i++) {
        
        int max = i;
        
        for (int j = i + 1; j < length; j++) {
            if (less(sortArray[j], sortArray[max])) {
                max = j;
            }
        }
        exch(sortArray, i, max);
    }
    
    show(length,sortArray);
    
}

void InsertSort_Action()
{
    int sortArray[15] = {8,4,2,5,6,9,0,1,3,7,11,10,12,7,4};
    
    int length = sizeof(sortArray)/sizeof(sortArray[0]);
    
    for (int i = 1; i < length; i ++) {
        
        for (int j = i; j > 0 && less(sortArray[j], sortArray[j-1]); j --) {
            
            exch(sortArray, j, j-1);
            
        }
    }
    
    show(length, sortArray);
}
