//
//  DesignPatternsDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/10/12.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "DesignPatternsDemo.hpp"

namespace ObserverPattern {
    
    void ObserverPatternAction()
    {
        Subject *subject = new ConcreteSubject();
        
        Observer *nbaObserver = new NBAObserver(subject,"xiaoA");
        Observer *fifaObserver = new FIFAObserver(subject,"xiaoB");

        subject->Atttach(nbaObserver);
        subject->Atttach(fifaObserver);
        

        subject->action = "NBA_notification";
        subject->Notify();

        
        subject->action = "FIFA_notification";
        subject->Notify();
    }


}
