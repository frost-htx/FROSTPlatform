//
//  C++DemoViewController.m
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "C++DemoViewController.h"

#include "Sales_data.hpp"
#include "ContainerOperation.hpp"
#import "EffectiveDemo.hpp"
#import "DesignPatternsDemo.hpp"

@interface MonthArray ()


@end

@implementation MonthArray

static MonthArray *sharedMonthArray = nil;
static NSString *months[] = { @"January", @"February", @"March",
    @"April", @"May", @"June", @"July", @"August", @"September",
    @"October", @"November", @"December" };

+(id) monthArray
{
    if (!sharedMonthArray) {
        sharedMonthArray = [[MonthArray alloc] init];
    }
    return sharedMonthArray;
}

- (unsigned)count
{
    return 12;
}

-(id) objectAtIndex:(unsigned)index
{
    if (index >= [self count]) {
        NSLog(@"Error");
        return nil;
    }
    else
        return months[index];
}

@end;

@interface C__DemoViewController ()

@end

@implementation C__DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MonthArray *monthArray = [MonthArray monthArray];
    NSLog(@"%@",[monthArray objectAtIndex:2]);
    NSLog(@"%@",monthArray.firstObject);
    NSLog(@"%@",monthArray.lastObject);

//    PerformAction();
//    terms14::PerformTerms14Action();
//    terms29::PerformTerms29Action();
//    terms31::PerformTerms31Action();
//    terms32::PerformTerms32Action();
//    terms33::PerformTerms33Action();
//    terms34::PerformTerms34Action();
//    terms35::PerformTerms35Action();
//    terms36::PerformTerms36Action();
//    terms37::PerformTerms37Action();
//    terms38::PerformTerms38Action();
//    terms40::PerformTerms40Action();
//    PerformTerms27Action();
//    PerformTerms28Action();
    
    
//    ObserverPattern::ObserverPatternAction();
//    SimpleFactoryPattern::SimpleFactoryPatternAction();
//    GeneralFactoryPattern::GeneralFactoryPatternAction();
//    AbstractFactoryPattern::AbstractFactoryPatternAction();
//    StrategyPattern::StrategyPatternAction();
    AdapterPattern::AdapterPatternAction();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
