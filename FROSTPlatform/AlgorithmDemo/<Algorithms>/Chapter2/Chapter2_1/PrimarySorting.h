//
//  PrimarySorting.h
//  FROSTPlatform
//
//  Created by frost on 2018/5/19.
//  Copyright © 2018年 frost. All rights reserved.
//

#ifndef PrimarySorting_h
#define PrimarySorting_h

#include <stdio.h>

typedef int Comparable;

typedef int Index;

/*C language Version*/

int less(Comparable a, Comparable b);

void exch(Comparable s[],Index i, Index j);

void show(int length ,Comparable s[]);

/*Selection Sort*/

void SelectionSort_Action ();

void InsertSort_Action();

#endif /* PrimarySorting_h */


