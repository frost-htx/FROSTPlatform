//
//  DesignPatternsDemo.hpp
//  FROSTPlatform
//
//  Created by frost on 2017/10/12.
//  Copyright © 2017年 frost. All rights reserved.
//

#ifndef DesignPatternsDemo_hpp
#define DesignPatternsDemo_hpp

#include <stdio.h>
#include <list>
#include <iostream>

#pragma mark - /**********设计模式：观察者模式**********/

namespace ObserverPattern {
    
    class Subject;
    class Observer {
        
    public:
        
        Observer (Subject *subject,std::string name) {
            m_subject = subject;
            m_name = name;
        }
        
        virtual void Update() = 0;
        
        Subject *m_subject;
        std::string m_name;
        
    };
    
    class Subject {
        
    public:
        
        std::string action;
        
        std::list<Observer *> list;
        
        virtual void Atttach(Observer *) = 0;
        virtual void Detach(Observer *) = 0;
        virtual void Notify() = 0;
        
    };
    
    class NBAObserver:public Observer {
        
    public:
        
        NBAObserver(Subject *sub,std::string name ):Observer(sub,name) {
        
        }
        
        virtual void Update() {
            
            if (m_subject->action == "NBA_notification" ) {
                std::cout<< "NBAObserver ：Update " <<std::endl;

            }
        }
        
    };
    
    class FIFAObserver:public Observer {
        
    public:
        
        FIFAObserver(Subject *sub,std::string name ):Observer(sub,name) {
            
        }
        
        virtual void Update() {
            if (m_subject->action == "FIFA_notification" ) {
                std::cout<< "FIFAObserver ：Update " <<std::endl;
                
            }
        }
        
    };
    
    class ConcreteSubject:public Subject {
        
    public:
        virtual void Atttach(Observer *observer) {
            list.push_back(observer);
        }
        
        virtual void Detach(Observer *observer) {
            std::list<Observer *>::iterator iter = list.begin();
            
            while (iter != list.end()) {
                if ((*iter) == observer) {
                    list.erase(iter);
                }
                iter++;
            }
            
        }
        
        virtual void Notify() {
            
            std::list<Observer *>::iterator iter = list.begin();
            while (iter != list.end())
            {
                (*iter)->Update();
                ++iter;
            }
            
        }
    };
    
    void ObserverPatternAction();
}

#endif /* DesignPatternsDemo_hpp */
