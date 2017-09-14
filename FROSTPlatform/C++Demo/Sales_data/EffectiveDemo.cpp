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


void PerformTerms14Action ()
{
    std::mutex m;
        
    Lock1 lock1(&m);
    Lock1 lock2(lock1);

    
//    Lock2 lock3(&m);
//    Lock2 lock4(lock1);
    
    

    
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

