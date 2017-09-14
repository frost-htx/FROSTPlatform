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
#include <mutex>

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

#pragma mark - /**********条款14：在资源管理类中小心coping行为***********/

namespace terms14{
    
    
    class Uncopyable{
    protected:
        Uncopyable(){}//允许子类对象构造析构
        ~Uncopyable(){}
    private:
        Uncopyable(const Uncopyable&);//阻止
        Uncopyable&operator=(const Uncopyable&);
    };
    
    class Lock1 {
    
    public:
        explicit Lock1(std::mutex* pm):mutexPtr(pm) {
            
            mutexPtr->lock();
        };
        
        ~Lock1() {
            mutexPtr->unlock();
        }
        
    private:
        std::mutex *mutexPtr;
        
    };
    
    class Lock2 :private Uncopyable{
        
    public:
        explicit Lock2(std::mutex* pm):mutexPtr(pm) {
            
            mutexPtr->lock();
        };
        
        ~Lock2() {
            mutexPtr->unlock();
        }
        
    private:
        std::mutex *mutexPtr;
        
    };
    
    
    void mutex_lock() {};
    void mutex_unlock() {};

    
    class Lock3{
    public:
        explicit Lock3(std::mutex* pm):mutexPtr(pm,mutex_unlock) {
            
            mutexPtr.get()->lock();
            
        }
        //不需要析构 mutexPrt的析构函数会在互斥器的引用次数为0时自动调用shared_ptr的删除器 （unlock）
    private:
        shared_ptr<std::mutex>mutexPtr;
    };
    
}

void PerformTerms14Action ();


#pragma mark - /**********条款27：尽量少做转型动作***********/

namespace terms27 {
    
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
    
}

void PerformTerms27Action ();


#pragma mark - /**********条款28：避免返回handles指向对象内部成分***********/

namespace terms28 {
    
    class Point {
        
    public:
        
        
        Point(const Point &point)  { x = point.x; y = point.y; };
        
        Point(int x, int y):x(x),y(y) {};
        
        void Set_X(int x_val) { x = x_val; };
        void Set_Y(int y_val) { y = y_val; };

    private:
        int x;
        int y;
        
    };
    
    class RectangleData {
    
    public:
        
        RectangleData(Point ulhc_val , Point lrhc_val):ulhc(ulhc_val),lrhc(lrhc_val) {};
        
        Point ulhc;
        Point lrhc;
        
    };
    
    
    class RectangleHandle {
        
    public:
        
        RectangleHandle(Point x, Point y):rectangleData(new RectangleData(x,y)) {};
        
       const Point& upperLeft() const { return rectangleData->ulhc; }
       const Point& lowerRight() const { return rectangleData->lrhc; }
        
        ~RectangleHandle() {};
        
    private:
        shared_ptr<RectangleData> rectangleData;
    };
    
    class GUIObject {
        
    };
    
}

void PerformTerms28Action ();

const terms28::RectangleHandle BoundingBox(const  terms28::GUIObject & obj);


#endif /* EffectiveDemo_hpp */
