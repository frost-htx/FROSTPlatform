//
//  DesignPatternsDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2017/10/12.
//  Copyright © 2017年 frost. All rights reserved.
//

#include "DesignPatternsDemo.hpp"

namespace SimpleFactoryPattern {
    
    void SimpleFactoryPatternAction ()
    {
        Factory *factory = new Factory();
        AbstractProduct *productA = factory->CreatProduct(ProductA_Type);
        productA->Productction();

        AbstractProduct *productB = factory->CreatProduct(ProductB_Type);
        productB->Productction();
    }
}

namespace GeneralFactoryPattern {
    
    void GeneralFactoryPatternAction ()
    {
        AbstractFactory *factoryA = new FactoryA();
        AbstractProduct *productA = factoryA->CreatProduct();
        
        
        AbstractFactory *factoryB = new FactoryB();
        AbstractProduct *productB = factoryB->CreatProduct();
        
        productA->Productction();
        productB->Productction();


    }
}

namespace AbstractFactoryPattern {
    
    void AbstractFactoryPatternAction ()
    {
        AbstractFactory *factory1 = new Factory1();
        AbstractFactory *factory2 = new Factory2();

        AbstractProductA *productA_1 = factory1->CreatProductA();
        AbstractProductB *productB_1 = factory1->CreatProductB();

        AbstractProductA *productA_2 = factory2->CreatProductA();
        AbstractProductB *productB_2 = factory2->CreatProductB();
        
        productA_1->Productction();
        productB_1->Productction();
        
        productA_2->Productction();
        productB_2->Productction();
        
    }
}

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

namespace StrategyPattern {
    
    void StrategyPatternAction ()
    {
        Cache cache(LRU);
        cache.AlgorithmAction();
        
        CacheTemplate<Random_Algorithm> cacheTemplate;
        cacheTemplate.AlgorithmAction();
    }
    

}
