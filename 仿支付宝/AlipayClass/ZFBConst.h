//
//  ZFBConst.h
//  仿支付宝
//
//  Created by Sundear on 2017/6/21.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#ifndef ZFBConst_h
#define ZFBConst_h


#endif /* ZFBConst_h */

#define RootView_h      239 //104+135
#define HiddenView_h    104


//强弱引用声明
#define kWS(weakSelf)           __weak __typeof(&*self)weakSelf = self;
#define kSS(type)               __strong typeof(type) type = weak##type;
