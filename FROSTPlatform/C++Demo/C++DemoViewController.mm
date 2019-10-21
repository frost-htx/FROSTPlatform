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
#include "LeetCode/LeetCodeDemo.hpp"
#include "AlgorithmFourth/AlgorithmFourth.hpp"

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

    [self AlgorithmFourth];
    vector<int> a{1,5,8,10,2,3,7,6};
    int target = 10;
    vector<int> result1 = LeetCode::Solution1_TwoSum(a, target);
    vector<int> result2 = LeetCode::Solution1_1TwoSum(a, target);
    vector<int> result3 = LeetCode::Solution1_2TwoSum(a, target);

    LeetCode::Solution2ListNode *tem1 = new LeetCode::Solution2ListNode(5);
    tem1->next = new LeetCode::Solution2ListNode(4);
    
    LeetCode::Solution2ListNode *tem2 = new LeetCode::Solution2ListNode(5);
    tem2->next = new LeetCode::Solution2ListNode(6);
    
    
    LeetCode::Solution2ListNode *temP = LeetCode::Solution2_AddTwoListNode(tem1, tem2);

    
    string solution3String = "12323445223107";
    
    LeetCode::Solution3 temSolution3;
    int solution3Int = temSolution3.Solution3_LongestSubstring(solution3String);
    
    int solution3_1Int = temSolution3.Solution3_1LongestSubstring(solution3String);

    
    string solution5String = "babad";

    LeetCode::Solution5 temSolution5;
    string solution5Str = temSolution5.Solution5_longestPalindrome(solution5String);
    string solution5_1Str = temSolution5.Solution5_1longestPalindrome(solution5String);

    string s1 = "abcefga";
    string s2 = "adbceda";
    string publicSubsequence = temSolution5.Solution5longestPublicSubsequence(s1,s2);

    LeetCode::Solution6 temSolution6;
    string convertZcharacter = temSolution6.Solution6_convertZcharacter("LeetCode", 3);
    
    LeetCode::Solution7 temSolution7;
    int rev = temSolution7.Solution7_reverseInteger(-123456);
    
    LeetCode::Solution8 temSolution8;
    int rev1 = temSolution8.Solution8_character_aoti("-2147483647");

    LeetCode::Solution9 temSolution9;
    int rev2 = temSolution9.Solution9_1PalindromeInteger(121);
    NSLog(@"123123");
    
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
//    PrototypePattern::PrototypePatternAction();
    
}

-(void)AlgorithmFourth
{
    vector<int> a = {7,5,6,3};
    vector<int> b (a.size());

    AlgorithmFourth::Sorting Soring;
//    vector<int> result = Soring.SelectionSort(a);
//    vector<int> result = Soring.InsertSort(a);
//    vector<int> result = Soring.ShellSort(a);
    Soring.MergeSort(a, 0, a.size(), b);
    Soring.show(a);
    Soring.show(b);
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
