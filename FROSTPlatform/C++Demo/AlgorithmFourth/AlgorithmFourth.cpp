//
//  AlgorithmFourth.cpp
//  FROSTPlatform
//
//  Created by frost on 2019/10/19.
//  Copyright © 2019 frost. All rights reserved.
//

#include "AlgorithmFourth.hpp"

namespace AlgorithmFourth {
    
    vector<int> Sorting::SelectionSort(vector<int> &array)
    {
        for (int i = 0 ; i < array.size(); i ++) {
            int minIndex = i;
            for (int j = i + 1; j <array.size(); j ++) {
                if (isless(array[j], array[minIndex])) {
                    minIndex = j;
                }
            }
            exchange(array, i, minIndex);
        }
        return array;
    }
    
    vector<int> Sorting::InsertSort (vector<int> &array)
    {
        for (int i = 1; i < array.size(); i ++) {
            
            for (int j = i ; j > 0; j --) {
                if (isless(array[j], array[j - 1])) {
                    exchange(array, j, j - 1);
                }
            }
            
        }
        
        return array;
    }

    vector<int> Sorting::ShellSort (vector<int> &array)
    {
        unsigned long n = array.size() / 3;
        
        while (n >= 1) {
            for (int i = n; i < array.size(); i ++) {
                
                for (int j = i; j >= n; j = j - n) {
                    
                    if (isless(array[j],array[j - n])) {
                        exchange(array, j, j - n);
                    }
                }
            }
            n = n / 3;
        }
        return array;
    }
    
    void Sorting::MergeSort (vector<int> &array,int L ,int R,vector<int> &result)
    {
        if (L >= R) {
            return;
        } else {
            
            int min = (L + R) / 2;
            MergeSort(array, L, min,result);
            MergeSort(array, min + 1, R,result);
            MergeArray(array,L,min,R,result);

        }
        
    }

    void Sorting::MergeArray(vector<int> &array,int L ,int Mid ,int R,vector<int> &result)
    {
        
        for (int copyIndx = L; copyIndx <= R; copyIndx ++) {
            result[copyIndx] = array[copyIndx];
        }
        
        int i = L, j = Mid + 1;
        
        for (int k = L; k <= R; k ++) {
            if (i <= Mid && j <= R) {
                if (result[j] < result[i]) {
                    array[k] = result[j];
                    j ++;
                } else {
                    array[k] = result[i];
                    i ++;
                }
            } else if (i <= Mid) {
                array[k] = result[i];
                i ++;
            } else if (j <= R) {
                array[k] = result[j];
                j ++;
            }
        }
    }

    void Sorting::QuickSort(vector<int> &array,int starIndex,int endIndex)
    {
        if (starIndex < endIndex) {
            int i = QuickArray(array,starIndex,endIndex);
            QuickSort(array, starIndex, i);
            QuickSort(array, i + 1, endIndex);
        }
    }
    
    int Sorting::QuickArray(vector<int> &array,int starIndex,int endIndex)
    {
        int i = starIndex,j = endIndex;
        
        int x = array[starIndex];
        
        while (i < j) {
            
            while (i < j && array[j] >= x) {
                j --;
            }
            
            if (i < j && array[j] < x) {
                array[i] = array[j];
                i ++;
            }
            
            while (i < j && array[i] <= x) {
                i ++;
            }
            
            if (i < j && array[i] > x) {
                array[j] = array[i];
                j --;
            }
            
        }
        
        array[i] = x;
        return i;
    }

    
    bool Sorting::isless(int &a,int &b)
    {
        if (a < b) {
            return true;
        }
        return false;
    }

    void Sorting::exchange(vector<int> &array,int aIndex,int bIndex)
    {
        int temp = array[aIndex];
        array[aIndex] = array[bIndex];
        array[bIndex] = temp;
    }
    
    void Sorting::show(vector<int> &array)
    {
        for (int i = 0 ; i < array.size() ; i ++) {
            printf("%d ",array[i]);
        }
    }

    void BinaryHeap::CreatMaxHeap(vector<int> &array,int size)
    {
        for (int parentNode = size /2 - 1; parentNode >= 0; parentNode --) {
            MaxHeapAdjust(array, size, parentNode);
        }
        maxHeap = array;
    }

    void BinaryHeap::AscendingOrder(vector<int> &array,int size)
    {
        for (int parentNode = size /2 - 1; parentNode >= 0; parentNode --) {
            MaxHeapAdjust(array, size, parentNode);
        }
        
        for (int i = array.size(); i >= 1; i --) {
            exchange(array, 0, i - 1);
            MaxHeapAdjust(array, i - 1, 0);
        }
    }

    
    void BinaryHeap::MaxHeapAdjust(vector<int> &array,int size,int parentNode)
    {
        int maxNode = parentNode;
        
        int childLeftNode = parentNode * 2 + 1;
        int childRightNode = parentNode * 2 + 2;
        
        if (childLeftNode < size && array[childLeftNode] > array[maxNode]) {
            maxNode = childLeftNode;
        }
        
        if (childRightNode < size && array[childRightNode] > array[maxNode]) {
            maxNode = childRightNode;
        }
        
        if (maxNode != parentNode) {
            exchange(array, parentNode, maxNode);
            MaxHeapAdjust(array, size, maxNode);
        }
    }

    
    void BinaryHeap::exchange(vector<int> &array,int aIndex,int bIndex)
    {
        int temp = array[aIndex];
        array[aIndex] = array[bIndex];
        array[bIndex] = temp;
    }
    
    vector<int> BinaryHeap::HeapSort()
    {
        vector<int> temp;
        return temp;
    }
    
    void BinaryHeap::InsertObject(int x)
    {
        
    }
    int BinaryHeap::GetMaxObject()
    {
        return 0;
    }
    int BinaryHeap::GetMinObject()
    {
        return 0;
    }

}
