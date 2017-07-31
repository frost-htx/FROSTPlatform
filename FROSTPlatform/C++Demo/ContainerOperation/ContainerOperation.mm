//
//  ContainerOperation.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/7/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "ContainerOperation.hpp"

namespace ContainerOperation {
    
    void VectorOperation::OperationVecotActionOne(std::vector<int> &vi) {
        
        auto iter = vi.begin();
        
        while (iter != vi.end()) {
            if (*iter % 2) {
                iter = vi.insert(iter, *iter);
                iter += 2;
            } else {
                iter = vi.erase(iter);
            }
        }
        
    }
    
    void VectorOperation::OperationVecotActionTwo(std::vector<int> &vi) {
        
        auto iter = vi.begin();
        
        while (iter != vi.end()) {
            ++iter;
            iter = vi.insert(iter, 10);
            ++iter;
        }
        
    }

    
}
