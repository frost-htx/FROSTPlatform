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
#import <CommonCrypto/CommonDigest.h>


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
    
    NSString *str = [self encryptionStrMethods:nil];
    
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
//    AdapterPattern::AdapterPatternAction();
    PrototypePattern::PrototypePatternAction();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)encryptionStrMethods:(NSDictionary *)dic
{
    
    NSString *SecretKey = @"yAyYstei4XXciWXRRFq0r5POdgFiWeyS";
    
    NSArray *tmpKeys = [dic allKeys];
    
    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
    
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        NSRange range = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions range:range];
    };
    
    NSArray *sortingArray = [tmpKeys sortedArrayUsingComparator:sort];
    
    __block NSString *encryptionStr = @"";
    
    [sortingArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = obj;
        NSString *value = [dic objectForKey:key];
        
        if ([encryptionStr isEqualToString:@""]) {
            encryptionStr = [NSString stringWithFormat:@"%@#%@%@#",encryptionStr,key,value];
        } else {
            encryptionStr = [NSString stringWithFormat:@"%@%@%@#",encryptionStr,key,value];
        }
    }];
    
    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@",SecretKey,encryptionStr,SecretKey];
    
    md5Str = [self MD5HashString:md5Str];
    
    md5Str = [md5Str uppercaseString];
    
    return md5Str;
    
}

- (NSString *)MD5HashString:(NSString *)md5Str {
    const char *str = md5Str.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
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
