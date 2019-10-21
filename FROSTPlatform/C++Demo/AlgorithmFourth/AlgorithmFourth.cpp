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
        int i = L, j = Mid + 1;
        int k;
        for (k = L; k <= R; ++k)
            result[k] = array[k];
        
        /* 将a[first, mid]和a[mid + 1, last]有序地合并起来，放回去到a[first, last] */
        k = L;
        while (i <= Mid && j <= R) {
            if (result[i] < result[j])
                array[k++] = result[i++];
            else
                array[k++] = result[j++];
        }
        
        /* 将剩余的数据取尽 */
        while (i <= Mid)
            array[k++] = result[i++];
        while (j <= R)
            array[k++] = result[j++];
        
        printf("123");
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

    
}
