//
//  macroDefinition.h
//  FROSTPlatform
//
//  Created by frost on 16/7/17.
//  Copyright © 2016年 frost. All rights reserved.
//

#ifndef macroDefinition_h
#define macroDefinition_h

#define WS(weakobj,obj)  __weak __typeof(&*obj)weakobj = obj

#endif /* macroDefinition_h */
