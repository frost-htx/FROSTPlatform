//
//  AlgorithmFifth.cpp
//  FROSTPlatform
//
//  Created by frost on 2019/10/25.
//  Copyright © 2019 frost. All rights reserved.
//

#include "AlgorithmFifth.hpp"

namespace AlgorithmFifth {
    
    int SearchClass::BinaryRecursionSearch(vector<int> &array, int starIndex, int endIndex, int find)
    {
        if (array.size() == 0 || starIndex >  endIndex) {
            return -1;
        }
        
        int min = starIndex + (endIndex - starIndex) / 2;
        
        if (array[min] > find) {
            BinaryRecursionSearch(array,starIndex,min,find);
        } else if (array[min] < find) {
            BinaryRecursionSearch(array,min+1,endIndex,find);
        } else {
            return min;
        }
        
        return -1;
    }
    
    int SearchClass:: BinaryNormalSearch(vector<int> &array, int starIndex, int endIndex, int find)
    {
        if (array.size() == 0 || starIndex > endIndex ) {
            return -1;
        }
    
        
        while (endIndex >= starIndex) {
            
            int min = starIndex + (endIndex - starIndex)/2;

            if (array[min] > find) {
                endIndex = min;
            } else if (array[min] < find) {
                starIndex = min + 1;
            } else {
                return min;
            }
        }
        return -1;
    }

    
    BinaryTreesNode *BinarySearchTrees::Insert_key(BinaryTreesNode *node, int &key)
    {
        if (node == NULL) {
            node = new BinaryTreesNode(key);
        } else {
            if (m_rootNode->key > key) {
                node->leftNode = Insert_key(m_rootNode->leftNode, key);
            } else if (m_rootNode->key < key) {
                node->rightNode = Insert_key(m_rootNode->rightNode, key);
            }
        }
        return node;
    }
    
    void BinarySearchTrees::Delete_key(BinaryTreesNode *node, int &key)
    {
        
    }
    
    BinaryTreesNode *BinarySearchTrees::Find_key(BinaryTreesNode *node,int &key)
    {
        return NULL;
    }
    
    BinaryTreesNode *BinarySearchTrees::GetMinNode_key(BinaryTreesNode *node,int &key)
    {
        return NULL;
    }
}
