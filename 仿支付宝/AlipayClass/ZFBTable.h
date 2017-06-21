//
//  ZFBTable.h
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
#import "ZFBConst.h"


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height



@interface ZFBTable : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(assign,nonatomic)CGFloat contentOffsetY;
@property (nonatomic ,strong) NSMutableArray *List;

-(void)HeardRefresh:(UIScrollView*)scroller;
-(void)FootRefresh:(UIScrollView*)scroller;

@end

