//
//  EffectiveDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/9/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "EffectiveDemo.hpp"

void PerformAction () {
    
    AA *ab = new AA(10,20,30);
    ab->show();
    
    A *a = ab;
    a->show();
    
    B *b = ab;
    b->show();
    
    
    std::cout << a << " " << sizeof(*a) << std::endl;
    std::cout << b << " " << sizeof(*b) << std::endl;
    std::cout << ab << " " << sizeof(*ab) << std::endl;
    delete a;
    
}

void PerformWindowsAction ()
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
