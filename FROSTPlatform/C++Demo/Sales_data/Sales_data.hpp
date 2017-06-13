//
//  Sales_data.hpp
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef Sales_data_hpp
#define Sales_data_hpp

#include <stdio.h>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;
class Friend_class;

/******第七章 类******/


namespace Sales {
    
    class Sales_data
    {
        
    public:
        
        Sales_data () = default;
        
        Sales_data (const std::string &s,unsigned n,double p) : bookNo(s),units_sold(n),revenue(p) {}
        Sales_data (const std::string &s ):Sales_data(s,0,0){};
        
        explicit Sales_data (unsigned sold ){ units_sold  = sold; };
        
        void some_mener() const {++ callNum; };
        
        string getIsbn() const { return bookNo;};
        
        Sales_data &combineFunction(Sales_data  const & data);
        
        bool readFunction(string const & name ,Sales_data const & data);
        
        std::ostream &print(std::ostream &,const Sales_data &);
        
    private:
        
        bool isNum = NO;
        unsigned units_sold = 0;
        string bookNo;
        double revenue = 0.0;
        mutable unsigned callNum = 0;
        
    };
    
    class Friend_class {
        
        
    public:
        
    private:
        string name;
        
    };
    
}

class NODefault {
    
public:
    NODefault(const std::string & name) { myName = name; };
    
private:
    std::string myName;
};

class StructA {
    
public:
    StructA ( NODefault & noDefault ):my_mem(noDefault){};
    std::string name;
    NODefault my_mem;
    
};

struct AggregateClass {
    int ival;
    string s;
};

class Debug { //constexpr 需要初始化所有的成员变量
    
public:
    constexpr Debug (bool isFailure ): hw(isFailure),io(isFailure),other(isFailure) {};
    constexpr Debug (bool h,bool io,bool hw ): hw(h),io(io),other(hw) {};


private:
    bool    hw;
    bool    io;
    bool    other;
};

/******第八章 文件操作******/

class PersonInfo {
    
public:
    string name;
    vector<string> phones;
};

class FileOperationClass {
    
public:
    std::string ReadTxTFile(std::string &path);
    long GetFileSize(std::string &path);
    bool WriteFile(std::string &path , std::string &txt);
    vector<PersonInfo> GetPersonInfo(std::string &path);

};

#endif /* Sales_data_hpp */
