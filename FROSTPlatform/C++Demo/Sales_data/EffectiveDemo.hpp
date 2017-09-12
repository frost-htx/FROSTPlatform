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
#include <memory>
#include <vector>

using std::shared_ptr;


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


/**********条款27：尽量少做转型动作***********/
class A{
    
public:
    A(int a) :a(a) {
        std::cout << "A 的构造函数-------" << this << std::endl;

    }
    
    void show() {
        std::cout << "A 的show（）-------" << this << std::endl;
    }
    
    virtual ~A() {
        std::cout << "A 的虚析构函数-------"<< this<<std::endl;
    }
    
private:
    int a;
    
};


class B {
    
public:
    B(int b) :b(b) {
        std::cout << "B 的构造函数-------" << this << std::endl;
        
    }
    
    virtual void show() {
        std::cout << "B 的show（）-------" << this << std::endl;
    }
    
    virtual ~B() {
        std::cout << "B 的虚析构函数-------"<< this<<std::endl;
    }
private:
    int b;
};

class AA :public A , public B{
    
public:
    AA(int a, int b,int c):A(a),B(b),c(c){
        std::cout << "AA的构造函数-------" << this <<std::endl;

    }
    
    void show() {
//        static_cast<A>(*this).show();
        A::show();
        B::show();
        std::cout << "AA的show函数-------" << this <<std::endl;
    }
    
    ~AA () {
        std::cout << "AA的析构函数-------" << this <<std::endl;
    }
    
private:
    int c;
};

class Window {
public:
    Window(int a):a(a){};
    
    virtual void blink() {
        std::cout << "Window的blink函数-------" << this <<std::endl;
    }
    
private:
    int a;
};

class SquareWindow : public Window {
public:
    SquareWindow(int a,int b):Window(a),b(b){};
    virtual void blink() {
        std::cout << "SquareWindow的blink函数-------" << this <<std::endl;
    };
    
private:
    int b;
};

class CircularWindow : public Window {
public:
    CircularWindow(int a,int c):Window(a),c(c){};

    virtual void blink() {
        std::cout << "CircularWindow的blink函数-------" << this <<std::endl;
    };
    
private:
    int c;
};


void PerformAction ();

void PerformWindowsAction ();

#endif /* EffectiveDemo_hpp */
