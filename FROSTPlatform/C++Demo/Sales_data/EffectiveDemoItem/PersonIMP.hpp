//
//  PersonIMP.hpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/17.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef PersonIMP_hpp
#define PersonIMP_hpp

#include <stdio.h>

#include "EffectiveItem1.hpp"

class PersonIMP {
    
public:
    
    PersonIMP(const EffectiveItem1 &item) {item1 = item ;}
    
    std::string GetBookNo() { return item1.GetBookNo(); }
    
private:
    
    EffectiveItem1 item1;
    
};


#endif /* PersonIMP_hpp */
