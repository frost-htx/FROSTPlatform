//
//  macroDefinition.h
//  FROSTPlatform
//
//  Created by frost on 16/7/17.
//  Copyright © 2016年 frost. All rights reserved.
//

#ifndef macroDefinition_h
#define macroDefinition_h

/************************************* Size *******************************************/

#define kSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT	[UIScreen mainScreen].bounds.size.height
#define kSCREEN_HEIGHT_NO_NAV (kSCREEN_HEIGHT - 64)

/************************************* Color *******************************************/
#define kRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define KCOLOR_BACKGROUNG  kRGBACOLOR(245,245,245,1)

/************************************* Other *******************************************/

#define WS(weakobj,obj)  __weak __typeof(&*obj)weakobj = obj
#define TheAppDelegate [[UIApplication sharedApplication] delegate]


#endif /* macroDefinition_h */
