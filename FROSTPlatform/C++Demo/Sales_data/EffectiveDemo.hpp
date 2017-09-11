//
//  EffectiveDemo.hpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef EffectiveDemo_hpp
#define EffectiveDemo_hpp

#include <stdio.h>
#include <iostream>

class WidgetImpl
{
public:
    
    WidgetImpl() {};
    
    WidgetImpl(int i) {_i = i;}
    
    int GetImplValue() {return _i;}
    
private:
    
    int _i;
    
};

class Widge
{
    
public:
    
    Widge(int i):pimpl(new WidgetImpl(i)) {}
    
//    Widge (Widge &other);
    
//    ~Widge();
    
    Widge &operator = (const Widge &rhs)
    {
        *pimpl = *(rhs.pimpl);
        
        return *this;
    }
    
    int GetVaule()
    {
        return pimpl->GetImplValue();
    }
    
    void swap(Widge &other)
    {
        using std::swap;
        swap(pimpl,other.pimpl);
    }
    
private:

    WidgetImpl *pimpl;
    
};

namespace std {
    template<>
    void swap <Widge>(Widge& a,Widge& b)
    {
        a.swap(b);
    }
}

namespace CopyStructure {
    class Rect
    {
    public:
        Rect(int a)
        {
            _a = a;
            
            p = new int(100);
        }
        
        Rect(Rect &r)
        {
            _a = r._a;
            
            p = new int;
            
            *p = *(r.p);
        }
        
        
        ~Rect()
        {
            if (p) {
                delete p;
            }
            std::cout << "delete: "<<_a<<std::endl;
        }
        
        
    private:
        
        int _a;
        
        int *p;
        
    };
}

class A{
    
public:
    A(int a) :a(a) {
        
    }
    
    virtual void show() {
        std::cout << "A 的show（）-------" << a << std::endl;
    }
    
    virtual ~A() {
        std::cout << "A 的虚构函数-------"<< std::endl;
    }
    
private:
    int a;
    
};

class AA :public A {
    
};

#endif /* EffectiveDemo_hpp */
