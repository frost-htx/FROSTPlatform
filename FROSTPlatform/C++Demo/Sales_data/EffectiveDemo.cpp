//
//  EffectiveDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "EffectiveDemo.hpp"
#include <assert.h>

using namespace terms14;
using namespace terms27;
using namespace terms28;
using namespace terms29;
using namespace terms31;
using namespace terms32;
using namespace terms33;


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

