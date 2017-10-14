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

#pragma mark - /**********设计模式：工厂模式**********/

/*简单工厂模式:
 缺点：增加新的核类型时，需要修改工厂类。
 违反了开放封闭原则：软件实体（类、模块、函数）可以扩展，但是不可修改。
 */
namespace SimpleFactoryPattern {
    
    
    class AbstractProduct {
        
    public:
        
        virtual void Productction() = 0;
        
    };
    
    class ProductA:public AbstractProduct {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductAction :" << std::endl;
        }
        
    };
    
    class ProductB:public AbstractProduct {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductBction :" << std::endl;
        }
    };
    
    
    typedef  enum {ProductA_Type,ProductB_Type} ProductType;
    
    class Factory {
        
    public:
        
        AbstractProduct *CreatProduct(ProductType type) {
            
            switch (type) {
                    
                    case ProductA_Type:
                    
                        return new ProductA();
                    
                    case ProductB_Type:
                    
                        return new ProductB();
            }
            
        };
        
    };
    
    void SimpleFactoryPatternAction();
}

/*普通工厂模式:
 普通工厂模式解决了简单工厂的缺点，遵循了开放-封闭原则，
 每次添加子产品的时候，只需要添加一个工厂子类就可以了。
 缺点：产品种类不好扩张。
 */
namespace GeneralFactoryPattern {
    
    class AbstractProduct {
        
    public:
        
        virtual void Productction() = 0;
        
    };
    
    class ProductA:public AbstractProduct {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductAction :" << std::endl;
        }
        
    };
    
    class ProductB:public AbstractProduct {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductBction :" << std::endl;
        }
    };
    
    
    class AbstractFactory {
        
    public:
        
        virtual AbstractProduct * CreatProduct() = 0;
        
    };
    
    class FactoryA:public AbstractFactory {
    
    public:
        
        virtual AbstractProduct *CreatProduct() {
            return new ProductA();
        }
        
    };
    
    class FactoryB:public AbstractFactory {
      
    public:
        virtual AbstractProduct *CreatProduct () {
            return new ProductB();
        }
        
    };
    
    void GeneralFactoryPatternAction();
    
}

/*抽象工厂模式:
 抽象工厂模式解决了产品类型单一的问题。可以支持不同类型的产品，使得模式灵活性更强。
 缺点：结构太过臃肿，如果产品类型比较多，或者产品族类比较多，就会非常难于管理，
 每次如果添加一组产品，那么所有的工厂类都必须添加一个方法，这样违背了开放-封闭原则。
 所以一般适用于产品组合产品族变化不大的情况
 */

namespace AbstractFactoryPattern {
    
    class AbstractProductA {
        
    public:
        
        virtual void Productction() = 0;
        
    };
    
    class AbstractProductB {
        
    public:
        
        virtual void Productction() = 0;
        
    };
    
    class ProductA_1:public AbstractProductA {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductA_1 :Productction()" << std::endl;
        }
        
    };
    
    class ProductB_1:public AbstractProductB {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductB_1 :Productction() :" << std::endl;
        }
    };
    
    class ProductA_2:public AbstractProductA {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductA_2 :Productction()" << std::endl;
        }
        
    };
    
    class ProductB_2:public AbstractProductB {
        
    public:
        
        virtual void Productction() {
            std::cout << "ProductB_2 :Productction() :" << std::endl;
        }
    };
    
    class AbstractFactory {
        
    public:
        
        virtual AbstractProductA * CreatProductA() = 0;
        virtual AbstractProductB * CreatProductB() = 0;

    };
    
    class Factory1:public AbstractFactory {
        
    public:
        
        virtual AbstractProductA *CreatProductA() {
            return new ProductA_1();
        }
        virtual AbstractProductB *CreatProductB() {
            return new ProductB_1();
        }
    };
    
    class Factory2:public AbstractFactory {
        
    public:
        
        virtual AbstractProductA *CreatProductA() {
            return new ProductA_2();
        }
        virtual AbstractProductB *CreatProductB() {
            return new ProductB_2();
        }
    };
    
    void AbstractFactoryPatternAction();
}

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

#pragma mark - /**********设计模式：策略模式**********/

namespace StrategyPattern {
    
    class Algorithm {
     
    public:
        
        virtual void AlgorithmAction() = 0;

    };
    
    class LRU_Algorithm:public Algorithm {
        
    public:
        
        virtual void AlgorithmAction() {
            std::cout << "LRU_Algorithm::AlgorithmAction()" << std::endl;
        }
    };
    
    class FIFO_Algorithm:public Algorithm {
        
    public:
        
        virtual void AlgorithmAction() {
            std::cout << "FIFO_Algorithm::AlgorithmAction()" << std::endl;
        }
    };
    
    class Random_Algorithm:public Algorithm {
        
    public:
        
        virtual void AlgorithmAction() {
            std::cout << "Random_Algorithm::AlgorithmAction()" << std::endl;
        }
    };
    
    enum AlgorithmType{FIFO,RANDOM,LRU};
    class Cache {
        
    public:
        Cache (AlgorithmType type) {
            
            switch (type) {
                case FIFO:
                    
                    algorithm = new FIFO_Algorithm();
                    break;
                    
                case RANDOM:
                    
                    algorithm = new Random_Algorithm();
                    break;
                    
                case LRU:
                    
                    algorithm = new LRU_Algorithm();
                    break;

            }
        }
        
        void AlgorithmAction(){
            algorithm -> AlgorithmAction();
        }
        
    private:
        
        Algorithm *algorithm;
        
    };
    
    template <class AlgorithmTemplate>
    class CacheTemplate
    {
    private:
        AlgorithmTemplate m_ra;
    public:
        CacheTemplate() { }
        ~CacheTemplate() { }
        void AlgorithmAction() { m_ra.AlgorithmAction(); }
    };
    
    void StrategyPatternAction();
    
}

#endif /* DesignPatternsDemo_hpp */
