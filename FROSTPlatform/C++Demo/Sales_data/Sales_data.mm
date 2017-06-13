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
    
    std::string line;
    while (getline (readStream, line)) {
        std::cout << line << std::endl;

    }
    
    while (!readStream.eof()) {
        readStream.getline(buffer, 100);
        std::cout << buffer << std::endl;
    }
    
    cout<<readStream.tellg()<<endl;
    
    return *buffer;
}

void FileOperationClass::WriteFile(std::string &path)
{
    std::ofstream writeStream(path,ios::app);
    
    if (writeStream.is_open()) {
        writeStream << "This is a line.\n";
        writeStream << "This is another line.\n";
    }
    
}













