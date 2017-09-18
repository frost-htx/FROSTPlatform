//
//  RealPerson.hpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/17.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef RealPerson_hpp
#define RealPerson_hpp

#include <stdio.h>

#include "EffectiveItem1.hpp"

#include "EffectiveDemo.hpp"

class RealPerson:public terms31::PersonInterface {

public:
    RealPerson (const EffectiveItem1 &item):item1(item) {};
    
    virtual ~RealPerson(){};
    
    std::string GetBookNo() const { return item1.GetBookNo(); };
    
private:
    
    EffectiveItem1 item1;
    
};


#endif /* RealPerson_hpp */
