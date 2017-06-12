//
//  Sales_data.cpp
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "Sales_data.hpp"

namespace Sales {

Sales_data &Sales_data::combineFunction(const Sales::Sales_data &data)
{
    units_sold += data.units_sold;
    revenue += data.revenue;
    return *this;
}
    
}

char FileOperationClass::ReadFile(std::string &path)
{
    char buffer[256];
    
    std::ifstream readStream(path,ios::in);
    
    if (!readStream.is_open()) {
        std::cout << "Error opening file";
        exit(1);
    }
    
    while (!readStream.eof()) {
        readStream.getline(buffer, 100);
        std::cout << buffer << std::endl;
    }
    
    return *buffer;
}
