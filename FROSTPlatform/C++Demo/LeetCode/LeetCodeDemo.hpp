//
//  LeetCodeDemo.hpp
//  FROSTPlatform
//
//  Created by frost on 2019/9/11.
//  Copyright © 2019 frost. All rights reserved.
//

#ifndef LeetCodeDemo_hpp
#define LeetCodeDemo_hpp

#include <stdio.h>
#include <vector>
#include <map>
#include <string>

using namespace std;

namespace LeetCode {

   /*Solution 1   */
   vector<int> Solution1_TwoSum(vector<int>& nums, int target);
   vector<int> Solution1_1TwoSum(vector<int>& nums, int target);
   vector<int> Solution1_2TwoSum(vector<int>& nums, int target);

   /*Solution 2   */
   class Solution2ListNode {
       
   public:
        int val;
        Solution2ListNode *next;
        Solution2ListNode (int x):val(x),next(NULL) {};
    };
    
    Solution2ListNode *Solution2_AddTwoListNode(Solution2ListNode *l1,Solution2ListNode *l2);
    
    /*Solution 3   */
    class Solution3 {
    public:
        int Solution3_LongestSubstring(string s);
        bool Solution3_isContainSubstring(string s,int startIndex,int endIndex);
        
        int Solution3_1LongestSubstring(string s);
    };
    
    /*Solution 4   */
    class Solution4 {
    public:

    };
    
    /*Solution 5   */
    class Solution5 {
    public:
        string Solution5_longestPalindrome(string s);
        string Solution5_1longestPalindrome(string s);
        /**扩展：公共子序列**/
        string Solution5longestPublicSubsequence(string s1,string s2);

    };
    
    /*Solution 6   */
    class Solution6 {
    public:
        string Solution6_convertZcharacter(string s,uint32_t lineNum);
    };
    
    /*Solution 7   */
    class Solution7 {
    public:
        int Solution7_reverseInteger(int x);
    };
    
    /*Solution 8   */
    class Solution8 {
    public:
        int Solution8_character_aoti(string str);
    };
    
    /*Solution 9   */
    class Solution9 {
    public:
        bool Solution9_PalindromeInteger(int integer);
        bool Solution9_1PalindromeInteger(int integer);

    };

}

#endif /* LeetCodeDemo_hpp */
