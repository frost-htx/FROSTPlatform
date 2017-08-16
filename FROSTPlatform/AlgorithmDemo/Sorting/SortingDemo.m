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
    
    for(gap = arraySize/2; gap>0 ; gap/=2 ){
        //从第gap个元素，逐个对其所在组进行直接插入排序操作
        for( i = gap; i < arraySize ; i++){
            
            j = i;
            
            while(j-gap>=0 && sortArray[j]<sortArray[j-gap]){
                
                temObjec = sortArray[j];
                sortArray[i] = sortArray[j-gap];
                sortArray[j-gap] = temObjec;
                
                j-=gap;
                }
            }
    }
}

bool lessAction(int obj1,int obj2) {
    
    if (obj1 < obj2) {
        return true;
    } else {
        return false;
    }
    
}

@end
