//
//  Sales_data.cpp
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "Sales_data.hpp"
#include <stdio.h>
#include <algorithm>

namespace Sales {

Sales_data &Sales_data::combineFunction(const Sales::Sales_data &data)
{
    units_sold += data.units_sold;
    revenue += data.revenue;
    return *this;
}
    
Sales_data &Sales_data::operator=(Sales::Sales_data data) {
    
//    Sales_data::swap(data);
    std::swap(*this, data);

    return *this;
}
    
void Sales_data::swap(Sales_data & data) {
    
    std::swap(*this, data);
    
}

    
}

std::string FileOperationClass::ReadTxTFile(std::string &path)
{
    char buffer[256];
    
    std::string total = "";
    
    std::ifstream readStream(path,ios::in);
    
    if (!readStream.is_open()) {
        std::cout << "Error opening file";
        exit(1);
    }
    
    while (!readStream.eof()) {
        readStream.getline(buffer, 100);
        total = total+buffer;
    }    
    return total;
}

long FileOperationClass::GetFileSize(std::string &path)
{
    std::ifstream readStream(path,ios::in);
    
    if (!readStream.is_open()) {
        std::cout<< "Open file Error";
    }
    
    readStream.seekg(0,ios::end);
    long fileSize = readStream.tellg();
    
    return fileSize;
    
}


bool FileOperationClass::WriteFile(std::string &path,std::string &txt)
{
    std::ofstream writeStream(path,ios::out);
    
    if (writeStream.is_open()) {
        writeStream << txt;
        return true;
        
    } else {
        std::cout << "Open file Error";
        return false;
    }
    
}

vector<PersonInfo> FileOperationClass::GetPersonInfo(std::string &path)
{
    vector<PersonInfo> personVec;
    
    std::ifstream readStream(path,ios::in);
    
    if (!readStream.is_open()) {
        std::cout << "Error opening file";
        exit(1);
    }
    
    std::string line , word;
    
    while (getline(readStream, line)) {
        
        PersonInfo info;
        istringstream record(line);
        record >> info.name;
        while (record >> word) {
            info.phones.push_back(word);
        }
        personVec.push_back(info);
    }

    return personVec;
}












