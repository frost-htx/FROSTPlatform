//
//  AlgorithmFourth.hpp
//  FROSTPlatform
//
//  Created by frost on 2019/10/19.
//  Copyright © 2019 frost. All rights reserved.
//

#ifndef AlgorithmFourth_hpp
#define AlgorithmFourth_hpp

#include <stdio.h>
#include <string>
#include <vector>

using namespace std;

namespace AlgorithmFourth {
    
   class Sorting {

    public:
       vector<int> SelectionSort (vector<int> &array);
       vector<int> InsertSort (vector<int> &array);
       vector<int> ShellSort (vector<int> &array);
       void MergeSort (vector<int> &array,int L ,int R,vector<int> &result);
       void MergeArray(vector<int> &array,int L ,int Mid,int R,vector<int> &result);
       
       bool isless(int &a,int &b);
       void exchange(vector<int> &array,int aIndex,int bIndex);
       void show(vector<int> &array);
    };
}


#endif /* AlgorithmFourth_hpp */
