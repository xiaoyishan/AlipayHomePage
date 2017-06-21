//
//  ViewController.h
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZFBScroll.h"
#import "ZFBTable.h"


#define kWidth      [UIScreen mainScreen].bounds.size.width
#define kHeight     [UIScreen mainScreen].bounds.size.height
#define BasicBlue   [UIColor colorWithRed:42/255.0 green:141/255.0 blue:204/255.0 alpha:1]//淡蓝主题色


@interface ViewController : UIViewController<UIScrollViewDelegate>{
    ZFBScroll   *zfbScroll;
    ZFBTable    *Table;
    UIView      *HeardView;
    UIView      *HiddenView;    //被遮挡的View
}



@end

