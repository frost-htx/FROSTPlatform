//
//  EffectiveDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "EffectiveDemo.hpp"

using namespace terms14;
using namespace terms27;
using namespace terms28;
using namespace terms29;


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

