//
//  ViewController.h
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFBTable.h"

#define kWidth      [UIScreen mainScreen].bounds.size.width
#define kHeight     [UIScreen mainScreen].bounds.size.height
#define BasicBlue   [UIColor colorWithRed:42/255.0 green:141/255.0 blue:204/255.0 alpha:1]//淡蓝主题色

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    ZFBTable *Table;
    UIView *topView;
    UIScrollView *rootView;
    UIImageView * imageView;
}



@end

