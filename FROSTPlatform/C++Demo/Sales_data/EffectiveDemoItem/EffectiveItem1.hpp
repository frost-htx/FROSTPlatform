//
//  EffectiveItem1.hpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/16.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef EffectiveItem1_hpp
#define EffectiveItem1_hpp

#include <stdio.h>
#include <string>


class EffectiveItem1 {
    
public:
    
    EffectiveItem1 () {};
    
    EffectiveItem1 (std::string &bookNo):bookNo(bookNo) {};
    
    std::string GetBookNo() const { return bookNo;}
    
private:
    std::string bookNo = "";
    
};
    



#endif /* EffectiveItem1_hpp */
