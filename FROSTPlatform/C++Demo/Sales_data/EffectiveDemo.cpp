//
//  EffectiveDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "EffectiveDemo.hpp"
#include <assert.h>

using namespace std::placeholders;
using namespace terms14;
using namespace terms27;
using namespace terms28;
using namespace terms29;
using namespace terms31;
using namespace terms32;
using namespace terms33;
using namespace terms34;
using namespace terms35;
using namespace terms36;
using namespace terms37;
using namespace terms38;

namespace terms14 {

    void Mutex_lock(Mutex *mutex)
    {
        mutex->mutex.lock();
    }
    void Mutex_unlock(Mutex *mutex)
    {
        mutex->mutex.unlock();
    }
    
    
    void PerformTerms14Action ()
    {
        terms14::Mutex m;
        
    //    Lock1 lock1(&m);
    //    Lock1 lock2(lock1);
    
    
    //    Lock2 lock3(&m);
    //    Lock2 lock4(lock1);
    
        Lock3 lock5(&m);
        Lock3 lock6(lock5);
    }

}


namespace terms29 {
    
    void Mutex_lock(Mutex *mutex)
    {
        mutex->mutex.lock();
    }
    void Mutex_unlock(Mutex *mutex)
    {
        mutex->mutex.unlock();
    }
    
    void PrettyMenu::changeBackground (std::ifstream & imgSrc)
    {
        terms29::Lock lock(&mutex);
        
        std::shared_ptr<PMImpl> newImp (new PMImpl(*pMImpl));
        
        newImp->bgimage.reset(new Image(imgSrc));
        ++newImp->imageChange;
        std::swap(pMImpl, newImp);
        
    }
    
    void PerformTerms29Action ()
    {
        std::string path = "";
        std::ifstream imgSrc1(path,std::ios::in);
        
        PrettyMenu prettyMenu(imgSrc1);
        prettyMenu.changeBackground(imgSrc1);
        
    }
    
}

#include "EffectiveItem1.hpp"

namespace terms31 {
    
    void PerformTerms31Action()
    {
        std::string bookNo = "123";
        
        EffectiveItem1 item(bookNo);
        
        std::shared_ptr<PersonInterface> person(PersonInterface::CreatePerson(item));
        
        std::string book1 = person->GetBookNo();
    }
}

void PerformTerms27Action ()
{
    
    shared_ptr<SquareWindow> squareWindow_ptr(new SquareWindow(100,200));
    shared_ptr<CircularWindow> circularWindow_ptr(new CircularWindow(10,20));
    
    typedef std::vector<shared_ptr<Window>> VPW;
    VPW winPtrs;
    
    winPtrs.push_back(squareWindow_ptr);
    winPtrs.push_back(circularWindow_ptr);
    
    for(VPW::iterator iter = winPtrs.begin(); iter != winPtrs.end(); ++iter) {
        (*iter)->blink();
    }
}

void PerformTerms28Action ()
{
    Point coord1(0,0);
    Point coord2(100,100);
    
    RectangleHandle  rect(coord1, coord2);
    
    GUIObject *pgo = nullptr;
    
    
    const Point  *pupPointer = &(BoundingBox(*pgo).upperLeft());
    
//    const Point  pupperLeft = (BoundingBox(*pgo).upperLeft());
//    pupPointer->Set_x(100);
    
    Point coord3(0,0);
    coord3 = *pupPointer; // dangling pointer
    
//    rect.upperLeft().Set_X(50);

}

const RectangleHandle BoundingBox(const  GUIObject & obj) {
    
    Point coord1(200,200);
    Point coord2(100,100);
    
    RectangleHandle  rect(coord1, coord2);
    
    return rect;
};

#include "PersonIMP.hpp"

namespace terms31 {
    
    Person::Person(const EffectiveItem1 &item1):
    personIMP(new PersonIMP(item1))
    {
        
    };
    
    std::string Person::GetBookNo () {
        return personIMP->GetBookNo();
    }

}

namespace terms32 {
    
    void PerformTerms32Action()
    {
        Square square;
        
        assert(square.width() == square.height());
        makeHeightlengthier(square);
        assert(square.width() == square.height());//错误：因为Square继承RectangleRect，Square只要改变了宽度，高度就会发生改变

        
    }
    
    void makeHeightlengthier(RectangleRect &r)
    {
        int oldHeight = r.height();
        r.SetWidth(r.width() + 10);
        assert(r.height() == oldHeight);
    }

    
}

namespace terms33 {
    
    void PerformTerms33Action()
    {
        int a = 0;
        
        Terms33PublicDerived derived1;
        derived1.CommonFunction(a);
        
        Terms33PrivateDerived derived2;
        derived2.CommonFunction(a);
        
    }
    
    
}

namespace terms34 {
    
    void Terms34Base::CommonFunction()
    {
        std::cout<<"Base::CommonFunction"<<std::endl;
    }
        
        void Terms34Base::VirtualFunction()
    {
        std::cout<<"Base::VirtualFunction"<<std::endl;
    }
        
        void Terms34Base::PureVirtualFunction()
    {
        std::cout<<"Base::PureVirtualFunction"<<std::endl;
    };
    
    void Terms34Derived1::VirtualFunction()
    {
        std::cout<<"Derived1::VirtualFunction"<<std::endl;
    };
    
    void Terms34Derived1::PureVirtualFunction()
    {
        Terms34Base::PureVirtualFunction();
    };
    
    void Terms34Derived2::PureVirtualFunction()
    {
        std::cout<<"Derived2::PureVirtualFunction"<<std::endl;
    };
    
    void PerformTerms34Action()
    {
        Terms34Derived1  derived1;
        derived1.VirtualFunction();
        derived1.PureVirtualFunction();

        Terms34Derived2  derived2;
        derived2.VirtualFunction();
        derived2.PureVirtualFunction();
    }

}


namespace terms35 {
    
    void PerformTerms35Action()
    {
        Soldier1  soldier1;
        int val1 = soldier1.healthValue();
        std::cout << "Soldier1 healthValue: "<< val1 << std::endl;
        
        Patient1  patient1;
        int val2 = patient1.healthValue();
        std::cout << "Patient1 healthValue: "<< val2 << std::endl;

        Soldier2  soldier2;
        int val3 = soldier2.getHealthValue();
        std::cout << "Soldier2 healthValue: "<< val3 << std::endl;
        
        Soldier2  soldier2_1(loseHealthQuickly_2);
        int val4 = soldier2_1.getHealthValue();
        std::cout << "Soldier2 healthValue: "<< val4 << std::endl;
        
        
        Soldier3  soldier3_1;
        int val5 = soldier3_1.getHealthValue();
        std::cout << "soldier3_1 healthValue: "<< val5 << std::endl;

        AddHealth addHealth;
        Soldier3  soldier3_2(addHealth);
        int val6 = soldier3_2.getHealthValue();
        std::cout << "soldier3_1 healthValue: "<< val6 << std::endl;
        
        GameLevel level;
        Soldier3  soldier3_3(std::bind(&GameLevel::easy,level,_1));
        int val7 = soldier3_3.getHealthValue();
        std::cout << "soldier3_1 healthValue: "<< val7 << std::endl;
        
        
        AddCalcHealth addCalcHealth;
        GameCharacter4 gc1(&addCalcHealth);
        gc1.getHealthVaule();
        
        DoubleCalcHealth doubleCalcHealth;
        GameCharacter4 gc2(&doubleCalcHealth);
        gc2.getHealthVaule();
    }

    
    int defaultHealthCalc_2(const GameCharacter2& gc)
    {
        int health = gc.getInitialVal();
        health = health / 2;
        return health;
    }
    
    int loseHealthQuickly_2(const GameCharacter2& gc)
    {
        int health = gc.getInitialVal();
        health = health / 4;
        return health;
    }
    
    
    int defaultHealthCalc_3(const GameCharacter3& gc)
    {
        int health = gc.getInitialVal();
        health = health / 2;
        return health;
    }
    
    int loseHealthQuickly_3(const GameCharacter3& gc)
    {
        int health = gc.getInitialVal();
        health = health / 4;
        return health;
    }
    
    float GameLevel::hard(const GameCharacter3& gc)const
    {
        float health = gc.getInitialVal();
        std::cout<<"困难模式，生命值为初始值的四分之一"<<std::endl;
        return health / 4;
    }
    
    float  GameLevel::easy(const GameCharacter3& gc)const
    {
        float health = gc.getInitialVal();
        std::cout<<"简单模式，生命值为初始值的四倍"<<std::endl;
        return health * 4;  
    }
    
    
    int HealthCalcClass::calc(const GameCharacter4& gc)const
    {
        int a = gc.getInitialVal();
        return a;
    }
    
    int AddCalcHealth::calc(const terms35::GameCharacter4 &gc) const
    {
        int a = gc.getInitialVal();
        return a + 10;
    }
    
    int DoubleCalcHealth::calc(const GameCharacter4 &gc) const
    {
        int a = gc.getInitialVal();
        return a * 2;
    };
    
    int GameCharacter4::getHealthVaule () const
    {
        return healthClass->calc(*this);
    };
    
}

namespace terms36 {
    
    void PerformTerms36Action()
    {
        DerivedClass derivedClass;
        
        BaseClass *baseClassPtr = &derivedClass;
        DerivedClass *derivedClassPtr = &derivedClass;

        baseClassPtr->NonVirtualFunction();
        derivedClassPtr->NonVirtualFunction();
        
    }

}

namespace terms37 {
    
    void PerformTerms37Action()
    {
        Rectangle1 rectangle;
        Circle1 circle;
        
        Shape1 *ptrC = &circle;
        ptrC->draw();
        
        Shape1 *ptrR = &rectangle;
        ptrR->draw();
        
        Rectangle2 rectangle2;
        Shape2  *ptrR2  = &rectangle2;
        ptrR2->doDraw();
        ptrR2->doDraw(Shape2::Blue);

    }
}

namespace terms38 {
    
    void PerformTerms38Action()
    {
        terms38Set<std::string> set;
        
        std::string s1 = "1";
        set.insert(s1);
        
        std::string s2 = "2";
        set.insert(s2);
        
        bool a = set.member(s1);
        set.remove(s1);
        
        set.print();
        
    }
    
}

namespace terms39 {
    
    void PerformTerms40Action()
    {
    
    }

}


namespace terms40 {
    
    void PerformTerms40Action()
    {
        
        Cperson c_person("Aaron");
        std::string name =  c_person.name();
        std::cout << name <<std::endl;
    }

    
}
