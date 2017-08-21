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
    
    merge_sort(sortArray, arraySize, 0, arraySize-1);
    
    for (int g = 0; g < arraySize; g++) {
        printf("%d ", sortArray[g]);
    }
}

void merge_sort(int a[], int arraySize,int start, int end)
{
    int mid;
    
    if (end > start) {
        mid = (start + end)/2;
        merge_sort(a, arraySize, start, mid);
        merge_sort(a, arraySize, mid+1, end);
        
        merge(a,arraySize,start,mid,end);
        
    }
}

void merge(int a[], int arraySize, int start, int mid, int end)
{
    int n1 = mid - start +1;
    int n2 = end - mid;
    
    int left[n1];  int right[n2];
    
    int i; int j; int k;
    
    for (i = 0; i < n1; i++) {
        left[i] = a[start+i];
    }
    
    for (j = 0; j < n2; j++) {
        right[j] = a[mid+1+j];
    }
    
    i = j = 0;
    k = start;
    while (i < n1 && j < n2) {
        if (left[i] > right[j] ) {
            a[k++] = right[j++];
        } else {
            a[k++] = left[i++];
        }
    }
    
    while (i < n1) {
        a[k++] = left[i++];
    }
    
    while (j < n2) {
        a[k++] = right[j++];
    }
}

void QuickSortingAction()
{
    int sortArray[9] = {5,6,3,4,1,8,7,5,9};
    
    int arraySize = sizeof(sortArray)/sizeof(sortArray[0]);
    
    quick_sort(sortArray, 0, arraySize - 1);
    
    for (int g = 0; g < arraySize; g++) {
        printf("%d ", sortArray[g]);
    }
}

void quick_sort(int s[], int l, int r)
{
    if (l < r) {
        
        int i = l; int j = r;
        int x = s[l];
        
        while (i < j) {
            
            while (i < j && s[j] >= x) {
                j --;
            }
            
            if (i < j) {
                s[i++] = s[j];
            }
            
            while (i<j && s[i] <= x) {
                i++;
            }
            
            if (i < j) {
                s[j--] = s[i];
            }
        }
        
        s[i] = x;
        quick_sort(s, l, i -1);
        quick_sort(s, i + 1, r);
        
    }

}




















//void quick_sort(int s[], int l, int r)
//{
//    if (l < r)
//    {
//        //Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
//        int i = l, j = r, x = s[l];
//        while (i < j)
//        {
//            while(i < j && s[j] >= x) // 从右向左找第一个小于x的数
//                j--;
//            if(i < j)
//                s[i++] = s[j];
//            
//            while(i < j && s[i] < x) // 从左向右找第一个大于等于x的数
//                i++;
//            if(i < j)
//                s[j--] = s[i];
//        }
//        s[i] = x;
//        quick_sort(s, l, i - 1); // 递归调用
//        quick_sort(s, i + 1, r);
//    }
//}

@end
