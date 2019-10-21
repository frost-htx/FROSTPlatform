//
//  LeetCodeDemo.cpp
//  FROSTPlatform
//
//  Created by frost on 2019/9/11.
//  Copyright © 2019 frost. All rights reserved.
//

#include "LeetCodeDemo.hpp"

namespace LeetCode {
    
    vector<int> Solution1_TwoSum(vector<int>& nums, int target)
    {
        for (int i = 0; i < nums.size(); i++) {
            
            for (int j = i + 1; j < nums.size(); j++) {
                int temPa = nums[i];
                int temPb = nums[j];
                if (temPa == target - temPb) {
                    vector<int> result;
                    result.push_back(i);
                    result.push_back(j);
                    return result;
                }
            }
        }
        vector<int> result;
        return result;
    }
    
    vector<int> Solution1_1TwoSum(vector<int>& nums, int target)
    {
        vector<int> result{0,0};
        map<int,int> temMap;

        for (int i = 0; i < nums.size(); i++) {
            temMap.insert(make_pair(nums[i], i));
        }
        
        for (int i = 0; i < nums.size(); i++) {
            int resultA = target - nums[i];
            
//            map<int, int>::iterator it;
//            it = temMap.find(resultA);
//            if (it != temMap.end() && it->second != i) {
//                result[0] = it->second;
//                result[1] = i;
//                return result;
//            }
            if (temMap.find(resultA) != temMap.end() && temMap[resultA] != i) {
                result[0] = temMap[resultA];
                result[1] = i;
                return result;
            }
            
        }
        return result;
    }
    
    vector<int> Solution1_2TwoSum(vector<int>& nums, int target)
    {
        vector<int> result{0,0};
        map<int,int> temMap;
        
        for (int i = 0; i < nums.size(); i++) {
            
            temMap.insert(make_pair(nums[i], i));
            int tempA = target - nums[i];
            
            if (temMap.find(tempA) != temMap.end() && temMap[tempA] != i) {
                result[0] = temMap[tempA];
                result[1] = i;
                return result;
            }
        }
        
        return result;
    }

    Solution2ListNode *Solution2_AddTwoListNode(Solution2ListNode *l1,Solution2ListNode *l2)
    {
        Solution2ListNode *headList = new Solution2ListNode(-1);
        Solution2ListNode *lastList = headList;

        Solution2ListNode *temL1 = l1;
        Solution2ListNode *temL2 = l2;
        int carry = 0;
        while (temL1 || temL2) {
            int a = (temL1 != NULL) ? temL1->val : 0;
            int b = (temL2 != NULL) ? temL2->val : 0;
            
            int sum = carry + a + b;
            carry = sum / 10;
            
            int initVal = sum % 10;
            lastList->next = new Solution2ListNode(initVal);
            
            lastList = lastList->next;
            temL1 = temL1->next;
            temL2 = temL2->next;
        }
        
        if (carry > 0) {
            lastList->next = new Solution2ListNode(carry);
        }
        
        Solution2ListNode *res = headList->next;
        delete headList;
        return res;
    }

    int Solution3::Solution3_LongestSubstring(string s)
    {
        int max = 1;
        if (s == "") {
            max = 0;
        }
        
        for (int a = 0; a < s.size(); a ++) {
            for (int b = a+1; b < s.size(); b ++) {
                bool isContain = Solution3_isContainSubstring(s, a, b);
                if (!isContain) {
                    if (max < b - a + 1) {
                        max = b - a + 1;
                    }
                }
            }
        }
        return max;
    }

    bool Solution3::Solution3_isContainSubstring(string s,int startIndex,int endIndex)
    {
        vector<char> temVector;
        vector<char>::iterator iter;

        for (int i  = startIndex; i <= endIndex; i ++) {
            char temString = s[i];
            iter = find(temVector.begin(), temVector.end(), temString);
            if (iter != temVector.end()) {
                return true;
            }
            temVector.push_back(s[i]);
        }
        return false;
    }
    
    int Solution3::Solution3_1LongestSubstring(string s)
    {
        unsigned long n = s.size();
        int max = 0,i = 0,j = 0;
        vector<char> resultVector;
        vector<char> ::iterator iter;
        
        while (i < n && j < n) {
            iter = find(resultVector.begin(), resultVector.end(), s[j]);
            if (iter == resultVector.end()) {
                resultVector.push_back(s[j]);
                j++;
                max = max < resultVector.size() ? resultVector.size() : max;
            } else {
                resultVector.erase(resultVector.begin());
                i++;
            }
        }
        return max;
    }

    
    string Solution5::Solution5_longestPalindrome(string s)
    {
        const int len = s.size();
        int maxlen = 1;
        int start = 0;
        
        for(int i = 0; i < len; i++)//求长度为奇数的回文串
        {
            int j = i - 1, k = i + 1;
            while(j >= 0 && k < len && s.at(j) == s.at(k))
            {
                if(k - j + 1 > maxlen)
                {
                    maxlen = k - j + 1;
                    start = j;
                }
                
                j--;
                k++;
            }
        }
        
        for(int i = 0; i < len; i++)//求长度为偶数的回文串
        {
            int j = i, k = i + 1;
            while(j >= 0 && k < len && s.at(j) == s.at(k))
            {
                if(k - j + 1 > maxlen)
                {
                    maxlen = k - j + 1;
                    start = j;
                }
                
                j--;
                k++;
            }
        }
        
        return s.substr(start, maxlen);

    }
    
    string Solution5::Solution5_1longestPalindrome(string s)
    {
        string invert = "";
        
        for (int i = s.size() - 1; i >= 0; i --) {
            invert = invert + s[i];
        }
        
        string result = "";
        
        for (int starIndex = 0; starIndex < s.size(); starIndex ++) {
            for (int len = 1; len <= s.size() - starIndex; len ++) {
                string compareA = s.substr(starIndex,len);
                if (invert.find(compareA) != string::npos ) {
                    if (compareA.size() > result.size()) {
                        result = compareA;
                    }
                }
            }
        }
        return result;
    }
    
    string Solution5::Solution5longestPublicSubsequence(string s1,string s2)
    {
        long len1 = s1.size();
        long len2 = s2.size();
        
        vector<vector<int>> a1(len1+1,vector<int>(len2+1));
        
        for (int i = 0 ; i < len1; i ++) {
            a1[i][0] = 0;
        }
        
        for (int j = 0 ; j < len2; j ++) {
            a1[0][j] = 0;
        }
        
        int maxLen = 0;
        string result = "";
        
        
        for (int i = 1; i <= len1; i ++) {
            for (int j = 1; j <= len2; j ++) {
                if (s1[i - 1] == s2[j - 1]) {
                    a1[i][j] = a1[i-1][j-1] + 1;
                    if (a1[i][j] > maxLen) {
                        maxLen = a1[i][j];
                        result = result + s1[i - 1];
                    }
                } else if (a1[i - 1][j] >= a1[i][j - 1]){
                    a1[i][j] = a1[i - 1][j];
                } else {
                    a1[i][j] = a1[i][j - 1];
                }
            }
        }
        
        
        return result;
    }
    
    string Solution6::Solution6_convertZcharacter(string s, uint32_t lineNum)
    {
        
        int rowNum = lineNum - 1;
        vector<string> results(lineNum);
        int currentRow = 0;
        bool isincrease = true;
        for (int i = 0; i < s.length(); i ++) {
            
            if (currentRow == rowNum) {
                isincrease = false;
            } else if (currentRow == 0) {
                isincrease = true;
            }
            
            char tempChar = s[i];
            string &temStr = results[currentRow];
            temStr = temStr + tempChar;
            
            if (isincrease) {
                currentRow ++;
            } else {
                currentRow --;
            }
        }
        
        string resultStr = "";
        
        for (int i = 0; i < results.size(); i++) {
            string temStr = results[i];
            resultStr = resultStr + temStr;
        }
        
        return resultStr;
    }
    
    int Solution7::Solution7_reverseInteger(int x)
    {
        int rev = 0;
        
        while (x != 0) {
            int pop = x % 10;
            x = x / 10;
            if ((rev > INT_MAX /10) || (rev == INT_MAX / 10 && pop > INT_MAX % 10)) {
                return 0;
            }
            if ((rev < INT_MIN / 10) || (rev == INT_MIN / 10 && pop < INT_MIN % 10)) {
                return 0;
            }
            rev = rev * 10 +pop;
        }
        
        return rev;
    }
    
    int Solution8::Solution8_character_aoti(string str)
  {
        bool isPositive = true;
        double aotiInt = 0;
        int starIndex = 0;

      for (int i = 0; i < str.length(); i ++) {
          starIndex = i;
          if (str[i] == ' ') {
              continue;
          }else {
              if (str[i] == '+') {
                  starIndex ++;
                  isPositive = true;
                  break;
              } else if (str[i] == '-') {
                  starIndex ++;
                  isPositive = false;
                  break;
              }
              break;
          }
      }
      
      
        for (int i = starIndex; i < str.length(); i ++) {
            char temChar = str[i];
            if (temChar >= '0' && temChar <= '9') {
                if (isPositive) {
                    int pop = temChar - '0';
                    
                    if ((aotiInt > INT_MAX / 10) || ((aotiInt == INT_MAX / 10) && (pop > INT_MAX % 10))) {
                        return  INT_MAX;
                        break;
                    }
                    aotiInt = aotiInt * 10 + pop;
                } else {
                    int pop = temChar - '0';
                    if ((-aotiInt < INT_MIN / 10) || ((-aotiInt == INT_MIN / 10) && (-pop < INT_MIN % 10))) {
                        return INT_MIN;
                    }
                    aotiInt = aotiInt * 10 + pop;
                }
            } else {
                if (!isPositive) {
                    aotiInt = -aotiInt;
                }
                return aotiInt;
            }
        }
      
      if (!isPositive) {
          aotiInt = -aotiInt;
      }

      return aotiInt;
    }

    bool Solution9::Solution9_PalindromeInteger(int integer)
    {
        if (integer < 0 || (integer > 10 && integer % 10 == 0)) {
            return false;
        }
        
        int palindromeInteger = 0;
        while (palindromeInteger < integer) {
            palindromeInteger = palindromeInteger * 10 + integer % 10;
            integer = integer / 10;
        }
        
        return integer == palindromeInteger || integer == palindromeInteger / 10;
    }
    
    bool Solution9::Solution9_1PalindromeInteger(int integer)
    {
        string integerStr = std::to_string(integer);
        
        bool isPalindrome = true;
        
        unsigned long endIndex = integerStr.length() - 1;
        
        for (int i = 0; i < integerStr.length(); i ++) {
            if (integerStr[i] != integerStr[endIndex]) {
                isPalindrome = false;
                break;
            }
            if (i == endIndex) {
                break;
            }
            endIndex -- ;
        }
        
        return isPalindrome;
    }

}


