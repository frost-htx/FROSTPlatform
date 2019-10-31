//
//  AlgorithmFifth.hpp
//  FROSTPlatform
//
//  Created by frost on 2019/10/25.
//  Copyright © 2019 frost. All rights reserved.
//

#ifndef AlgorithmFifth_hpp
#define AlgorithmFifth_hpp

#include <stdio.h>
#include <string>
#include <vector>

using namespace std;

namespace AlgorithmFifth {
    
    class SearchClass {
        
    public:
        int BinaryRecursionSearch(vector<int> &array, int starIndex, int endIndex, int find);
        int BinaryNormalSearch(vector<int> &array, int starIndex, int endIndex, int find);
    };
    
    struct BinaryTreesNode {
        
        int key;
        BinaryTreesNode *leftNode;
        BinaryTreesNode *rightNode;
        
        BinaryTreesNode(int &key):key(key),leftNode(NULL),rightNode(NULL) {};
    };
    
    class BinarySearchTrees {
        
    public:
        
        BinarySearchTrees():m_rootNode(NULL){};
        
        void Insert(int &key) {
            m_rootNode = Insert_key(m_rootNode,key);
        }
        
        void Delete(int &key) {
            Delete_key(m_rootNode, key);
        }
        
        BinaryTreesNode *Find(int &key) {
            return Find_key(m_rootNode, key);
        };
        
        BinaryTreesNode *GetMinNode(int &key) {
            return GetMinNode_key(m_rootNode, key);
        }
        
    private:
        BinaryTreesNode *m_rootNode;
        BinaryTreesNode * Insert_key(BinaryTreesNode *node,int &key);
        void Delete_key(BinaryTreesNode *node,int &key);
        BinaryTreesNode *Find_key(BinaryTreesNode *node,int &key);
        BinaryTreesNode *GetMinNode_key(BinaryTreesNode *node,int &key);
    };
}

#endif /* AlgorithmFifth_hpp */
