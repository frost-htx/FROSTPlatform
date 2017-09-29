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
#include <fstream>
#include <sstream>
#include <list>

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
    
    class Mutex {
    
    public:
        
        Mutex() {};
        
        std::mutex mutex;
    };
    
    void Mutex_lock(Mutex *mutex);
    void Mutex_unlock(Mutex *mutex);
    
    
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
        explicit Lock1(Mutex * pm):mutexPtr(pm) {
            
            Mutex_lock(mutexPtr);
        };
        
        ~Lock1() {
            Mutex_unlock(mutexPtr);
        }
        
    private:
        Mutex *mutexPtr;
        
    };
    
    class Lock2 :private Uncopyable{
        
    public:
        explicit Lock2(Mutex * pm):mutexPtr(pm) {
            
            Mutex_lock(mutexPtr);
        };
        
        ~Lock2() {
            Mutex_unlock(mutexPtr);
        }
        
    private:
        Mutex *mutexPtr;
        
    };

    
    class Lock3{
    public:
        explicit Lock3(Mutex * pm):mutexPtr(pm,Mutex_unlock) {
            
            Mutex_lock(mutexPtr.get());
            
        }
        //不需要析构 mutexPrt的析构函数会在互斥器的引用次数为0时自动调用shared_ptr的删除器 （unlock）
    private:
        shared_ptr<Mutex>mutexPtr;
    };
    
    void PerformTerms14Action ();
    
}


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


#pragma mark - /**********条款29：为“异常安全”而努力是值得的**********/

namespace terms29 {
    
    class Mutex {
        
    public:
        
        Mutex() {};
        
        std::mutex mutex;
    };
    
    class Image {
        
    public:
        
        Image (std::ifstream & imgSrc):m_imgSrc(imgSrc) {};
        
        ~Image(){};
        
    private:
        std::ifstream & m_imgSrc;
        
    };
    
    void Mutex_lock(terms29::Mutex *mutex);
    void Mutex_unlock(terms29::Mutex *mutex);
    
    class Lock{
    public:
        
        explicit Lock(terms29::Mutex * pm):mutexPtr(pm,Mutex_unlock) {
            
            Mutex_lock(mutexPtr.get());
            
        }
        
    private:
        shared_ptr<terms29::Mutex>mutexPtr;
    };
    
    struct PMImpl {
        
        std::shared_ptr<Image>  bgimage;
        int imageChange = 0;
        
    };
    
    class PrettyMenu{
        
    public:
        
        PrettyMenu(std::ifstream & imgSrc):pMImpl(new PMImpl()) {};
        
        void changeBackground(std::ifstream & imgSrc);
        
    private:
        terms29::Mutex mutex;
        std::shared_ptr<PMImpl>  pMImpl;
    };
    
    void PerformTerms29Action();
    
}


#pragma mark - /**********条款30：透彻了解inlining的里里外外**********/

/*
 1，对于一个inline函数,你可以调用它们又不蒙受函数调用招致的额外开销。
 
 2，inline造成的代码膨胀亦会导致额外的换页行为,降低指令高速缓存装置的击中率,以及伴随而来的效率损失。
 
 3，inline只是对编译器的一个申请不是强制命令,该申请可以隐喻提出也可明确提出,隐喻提出就是将函数定义于class定义式内,这样的函数通常是成员函数或者是friend函数。
 
 4，inline函数通常一定要被置于头文件内,其在大多数C++程序中是编译器行为。
 
 5，大部分编译器拒绝将太过复杂的函数inlining。
 
 6，将构造函数和析构函数进行inling"是一个很糟糕的想法。
 
 */

#pragma mark - /**********条款31：将文件间的编译依存关系降至最低**********/

class EffectiveItem1;
class PersonIMP;

namespace terms31 {
    
    class Person { //第一种方法：Handler classes化类的成员变量为指针
      
    public:
        
        Person(const EffectiveItem1 &item1);
        
        std::string GetBookNo();
        
    private:
        
        std::shared_ptr<PersonIMP> personIMP;
        
    };
    
    
    class PersonInterface { //第二种方法：Interface classes将细节放在子类中
        
    public:
        
        virtual std::string GetBookNo() const = 0;
        
        static std::shared_ptr<PersonInterface> CreatePerson(const EffectiveItem1 &item1);

        virtual ~PersonInterface() {};
        
    };
    
    void PerformTerms31Action();

}

#pragma mark - /**********条款32：确定你的Public继承塑模出is-a关系**********/

namespace terms32 {
    
    /*** 请记住： **
     “public 继承” 意味 is-a。适用于 base class 身上的每一件事情一定也适用于 derived class 身上，
     因为每一个 derived class 对象也都是一个 base class 对象。
     */
    
    /*第一种设计：*/
    /*所有的鸟都有飞行能力*/
    class Bird1{
    public:
        
        virtual void fly();
        
    };
    
    class Penguin1:public Bird1 {/*企鹅也是一种鸟，也会飞。（错误的is-a设计）*/
        
    };
    
    
    /*第二种设计：这样的继承体系比第一种更能忠实的反应我们真正的意思*/
    /*定义鸟类*/
    class Bird2{
    public:
        
    };
    
    class FlyBird:public Bird2 {/*会飞的鸟*/
        virtual void fly();
    };

    class Penguin2:public Bird2 {/*企鹅*/
        
    };
    
    /*第三种设计：在运行时起抛出错误，这样的设计不好，好的接口可以防止无效的代码通过编译，
     因此你宁可采取 “在编译期拒绝企鹅飞行”的设计，
     而不是 “只在运行期才能侦测他们” 的设计
     */
    /*定义鸟类*/
    class Bird3{
    public:
        virtual void fly();

    };
    
    class Penguin3:public Bird3 {/*企鹅*/
        virtual void fly() { std::cout <<"error ！，Attempt to make a pengnin fly!" ;} /*调用企鹅飞机方法时，抛出错误*/
    };
    
    /*定义矩形*/
    class RectangleRect {
        
    public:
        
        virtual void SetHeight(int newHeight ) {m_height = newHeight;};
        virtual void SetWidth(int newWidth ) {m_width = newWidth;};
        virtual int height() const {return m_height; };
        virtual int width() const {return m_width; };
        
    private:
        int m_height;
        int m_width;
        
    };
    
    /*正方形继承矩形：这里的继承关系存在问题，原因是：
     某些可能施行于矩形身上的事情，
     却不可施行于正方形身上，
     比如改变矩形的宽时，高度不会发生变化，
     但是正方形的高度会跟着改变
     */
    class Square:public RectangleRect {
        
        
    };
    
    
    void PerformTerms32Action();
    void makeHeightlengthier(RectangleRect &r);
}

#pragma mark - /**********条款33：避免遮掩继承而来的名称**********/

namespace terms33 {

    class Terms33Base {
      
    public:
        
        void CommonFunction() {std::cout<<"Base::CommonFunction"<<std::endl;};
        
        void CommonFunction(int x) {std::cout<<"Base::CommonFunction (x)"<<std::endl;};
        
        void  virtual VirtualFunction() {std::cout<<"Base::VirtualFunction"<<std::endl;};

        void  virtual PureVirtualFunction() = 0;
    };
    
    
    /*子类的方法名称遮掩了父类的名称，
     需要使用using申明来使得父类的函数名可查找。
     */
    
    class Terms33PublicDerived:public Terms33Base {
        
    public:
        
        using Terms33Base::CommonFunction; //申明第一级查找也要包括Base::CommonFunction
        
        void CommonFunction() {std::cout<<"Derived::CommonFunction"<<std::endl;};
        
        void virtual VirtualFunction() {std::cout<<"Derived::VirtualFunction"<<std::endl;};
        
        virtual void PureVirtualFunction() {std::cout<<"Derived::PureVirtualFunction"<<std::endl;}

    };
    
    /*有时候不想继承Base的所有函数，
     那么就不能使用Public继承，因为这违背了is-a关系。
     可以使用private继承，如果想使用父类中的函数，
     可以使用一个简单的转交函数（forwarding function）
     这里也不能使用：using申明，
     因为using申明会把父类的所有同名函数全部暴露给子类，
     这也是我们不希望看到的
     */
    
    class Terms33PrivateDerived:private Terms33Base {
        
    public:
        
        void CommonFunction(int x) {Terms33Base::CommonFunction(x);};
        
        void virtual VirtualFunction() {std::cout<<"Derived::VirtualFunction"<<std::endl;};
        
        virtual void PureVirtualFunction() {std::cout<<"Derived::PureVirtualFunction"<<std::endl;}
        
    };
    
    void PerformTerms33Action();

}

#pragma mark - /**********条款34：区分接口继承和实现继承**********/

namespace terms34 {
    
    /*要点：1，纯虚函数只继承接口。纯虚函数可以有默认的实现。
           2，虚函数既继承接口，也提供一份默认的实现。
           3，普通函数既继承接口，也强制继承实现。
     
     提倡使用纯虚函数代替虚函数，因为虚函数提供了一份默认的实现，
     有时候派生类想要的行为和这个虚函数不一致，而又恰好忘记在派生类中覆盖虚函数，
     就会出现问题。但纯虚函数不会，因为它从语法上限定派生类必须要去实现它，
     否则将无法定义派生类的对象。
     */
    
    class Terms34Base {
        
    public:
        
        void CommonFunction();
        
        void  virtual VirtualFunction();
        
        void  virtual PureVirtualFunction() = 0;
    };
    
    class Terms34Derived1:public Terms34Base {
        
    public:

        void  virtual VirtualFunction();
        
        void  virtual PureVirtualFunction();

    };
    
    class Terms34Derived2:public Terms34Base {
        
    public:

        void  virtual PureVirtualFunction();
        
    };
    
    void PerformTerms34Action();

}


#pragma mark - /**********条款35：考虑虚函数以外的其他选择**********/

namespace terms35 {

    //1.模版方法模式。在类中确定派生类要做的事情的顺序，然后让派生类自己实现它们。
    
    /*在基类中，限定了先做什么，后做什么。
     但是具体怎样做，把权力移交给了派生类。
     这种思路，称为模板方法模式，它的定义为：定义一个方法的骨架，
     而将一些方法实现延迟到子类。
     模板方法使得子类可以不改变一个方法的结构即可以重定义该方法的某些特定步骤
     */
    class GameCharacter1 {
        
    public:
        
        int healthValue()
        {
            int val = getInitialVal(); //先初始化人物的初始血线。
            val = calcVal(val);        //再调用计算血量的方法。
            return val;
        }
        
    private:
        
        virtual int getInitialVal() = 0;
        virtual int calcVal(int ) = 0;
        
    };
    
    class Soldier1:public GameCharacter1 {
        
    private:
        
       virtual int getInitialVal()
        {
            return 50;
        }
        
        virtual int calcVal(int val)
        {
            return val/2;
        };
        
    };
    
    class Patient1:public GameCharacter1 {
        
    private:
        
        virtual int getInitialVal()
        {
            return 20;
        }
        
        virtual int calcVal(int val)
        {
            return val*2;
        };
        
    };
    
    //2.使用函数指针。将虚函数移到类的外部，但是它不能访问类的private成分。

    /*假如希望同一个类型的不同对象有不同的计算生命值的方法，上述的方式就不合适了。
     人物健康指数的计算，其实，不一定与人物的特定类型有关，
     对于同一个类型，也可以有不同的计算方法。
     */
    
    class GameCharacter2;
    
    int defaultHealthCalc_2(const GameCharacter2&);
    int loseHealthQuickly_2(const GameCharacter2&);

    class GameCharacter2 {
        
    public:
        
        typedef int (*HealthCalcFn)(const GameCharacter2&);
        explicit GameCharacter2(HealthCalcFn hcf = defaultHealthCalc_2 ):healthFn(hcf){}
        
        virtual int getInitialVal() const = 0;
        int getHealthValue()
        {
            int val = healthFn(*this);
            return val;
        }
        
    private:
        
        HealthCalcFn healthFn;
        
    };
    
    
    
    class Soldier2:public GameCharacter2 {
        
    public:

        explicit Soldier2(HealthCalcFn hcf = defaultHealthCalc_2 ):GameCharacter2(hcf){}

        virtual int getInitialVal() const
        {
            return 50;
        }
    };
    
    //3.使用tr1::function指定“泛型”函数指针，是得我们可以通过函数、函数对象、成员函数来替代虚函数。
    
    class GameCharacter3;
    
    int defaultHealthCalc_3(const GameCharacter3&);
    int loseHealthQuickly_3(const GameCharacter3&);
    
    class GameCharacter3 {
        
    public:
        
        typedef std::function<int (const GameCharacter3&)> HealthCalcFn;
        explicit GameCharacter3(HealthCalcFn hcf = defaultHealthCalc_3 ):healthFn(hcf){}
        
        virtual int getInitialVal() const = 0;
        int getHealthValue()
        {
            int val = healthFn(*this);
            return val;
        }
        
    private:
        
        HealthCalcFn healthFn;
        
    };
    
    class Soldier3:public GameCharacter3 {
        
    public:
        
        explicit Soldier3(HealthCalcFn hcf = defaultHealthCalc_3 ):GameCharacter3(hcf){}
        
        virtual int getInitialVal() const
        {
            return 50;
        }
    };
    
    
    struct AddHealth
    {
        int operator()(const GameCharacter3& gc)const
        {
            int health = gc.getInitialVal();
            health = health + 10;
            std::cout<<"生命值加10"<<std::endl;
            return health;
        }  
    };
    
    class GameLevel
    {
    public:
        float hard(const GameCharacter3&)const;
        float easy(const GameCharacter3&)const;
    };
    
    //4.使用策略模式，将虚函数所要完成的事情封装成类，以便于扩展。
    
    class GameCharacter4;
    
    int defaultHealthCalc_4(const GameCharacter4&);
    int loseHealthQuickly_4(const GameCharacter4&);
    
    class HealthCalcClass
    {
    public:
        virtual int calc(const GameCharacter4& gc)const;
        
    };
    
    class AddCalcHealth:public HealthCalcClass
    {
    public:
        int calc( const GameCharacter4& gc) const ;
    };
    
    class DoubleCalcHealth:public HealthCalcClass
    {
    public:
        int calc(const GameCharacter4& gc)const;
    };
    
    class GameCharacter4 {
        
    public:
        
        GameCharacter4( HealthCalcClass* phcf):healthClass(phcf){}
        
        int getInitialVal() const { return 10; };
        int getHealthVaule() const;

    private:
        
        HealthCalcClass *healthClass;
        
    };
    
    
    void PerformTerms35Action();

}

#pragma mark - /**********条款36：绝不重新定义继承而来的non-virtual函数**********/

namespace terms36 {
    
    class BaseClass {
        
    public:
        
         void NonVirtualFunction()
        {
            std::cout << "BaseClass::NonVirtualFunction" << std::endl;
         }
        
    };
    
    class DerivedClass :public BaseClass {
        
        public:
        
        void NonVirtualFunction()
        {
            std::cout << "DerivedClass::NonVirtualFunction" << std::endl;
        }
        
    };
    
    void PerformTerms36Action();

}


#pragma mark - /**********条款37：绝不重新定义继承而来的缺省参数值**********/

namespace terms37 {

    class Shape1 {
        
    public:
        
        enum ShapeColor {Red,Green,Blue};
        
        virtual void draw(ShapeColor color = Red) const = 0;
        
    };
    
    class Rectangle1:public Shape1 {
    
    public:
        virtual void draw(ShapeColor color = Green) const //virtual函数是动态绑定，而缺省参数值却是静态绑定
        {
            std::cout << "Rectangle::draw" << std::endl;
        };
    
    };
    
    class Circle1: public Shape1 {
        
    public:
        virtual void draw(ShapeColor color) const
        {
            std::cout << "Circle::draw" << std::endl;
        };
    };
    
    
    class Shape2 {
        
    public:
        
        enum ShapeColor {Red,Green,Blue};
        
        void doDraw(ShapeColor color = Red)
        {
            draw(color);
        }
        
    private:
        
        virtual void draw(ShapeColor color) const = 0;
        
    };
    
    class Rectangle2:public Shape2{
        
    private:
        
        virtual void draw(ShapeColor color) const
        {
            std::cout << "Rectangle2::draw" << std::endl;
        }

    };
    
    void PerformTerms37Action();

}


#pragma mark - /**********条款38：通过复合塑模出has-a或“根据某物实现出”**********/

namespace terms38 {
    
    /*Person不应该去public继承Address，
     虽然这样做也能让一个人有地址，但是它却违背了public表示is-a的关系。
     人又不是一个特化了的“地址”。所以，这里使用复合会更恰当一些*/
    
    class Address {
    
    public:
        std::string country;
        std::string city;
        std::string street_name;
    };
    
    class Person {
        
    public:
        
        Address address;
        std::string name;
        
    };
    
    /*虽然list和Set有很多相同的地方，但是list和Set也有不同的地方，
     比如list能容纳相同的元素，而Set不行，
     所以使用复合的形式来实现Set容器，而不是使用Public继承*/
    
    template<typename T>
    class terms38Set
    {
        
    public:
        
        bool member(const T & item) const
        {
            return find(rep.begin(),rep.end(),item) != rep.end();
        }
        
        void insert(const T & item)
        {
            if (!member(item)) {
                rep.push_back(item);
            }
        }
        
        void remove(const T & item)
        {
            typename std::list<T>::iterator it = find(rep.begin(),rep.end(),item);
            if  ( it != rep.end()) {
                rep.erase(it);
            }
        }
        
        void print()
        {
            typename std::list<T>::iterator it = rep.begin();
            for(;it != rep.end();++it)
                std::cout<<*it<<"\t"<<std::endl;
        }
        
    private:
        std::list<T> rep;
        
    };
    
    void PerformTerms38Action();

    
}

#pragma mark - /**********条款 39：明智而审慎地使用 private 继承**********/

namespace terms38 {

    /*利用复合的方式来代替private继承*/
    
    class Timer {
    public:
        explicit Timer(int tickFrequency);
        virtual void onTick() const;
    };
    
    class Widget {
        
    private:
        
        class WidgetTimer :public Timer {
        public:
            virtual void onTick() const;
        };
        
    public:
        
        WidgetTimer widgetTimer;
        
    };
    
    void PerformTerms39Action();

    
}

#endif /* EffectiveDemo_hpp */
