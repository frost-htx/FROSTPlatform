//
//  RealPerson.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/17.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "RealPerson.hpp"

using namespace terms31;

 std::shared_ptr<PersonInterface> PersonInterface::CreatePerson(const EffectiveItem1 &item1)
{
    return std::shared_ptr<PersonInterface> (new RealPerson(item1));
}

//std::string RealPerson::GetBookNo() const
//{
//    return item1.GetBookNo();
//}
