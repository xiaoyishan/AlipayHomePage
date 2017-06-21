//
//  ViewController.m
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    titleLabel.text = @"支付宝首页";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor=BasicBlue;
    [self.view addSubview:titleLabel];

    zfbScroll = [[ZFBScroll alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
    zfbScroll.contentSize = CGSizeMake(0, kHeight);
    zfbScroll.scrollIndicatorInsets = UIEdgeInsetsMake(310, 0, 0, 0);
    [self.view addSubview:zfbScroll];


    //主视图
    HeardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, RootView_h)];
    [zfbScroll addSubview:HeardView];

    //被遮挡层
    HiddenView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, HiddenView_h)];
    [HeardView addSubview:HiddenView];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:HiddenView.bounds];
    imageView.image = [UIImage imageNamed:@"1"];
    [HiddenView addSubview:imageView];

    //下层跟随table的head
    UIImageView *HeadIMG1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    HeadIMG1.frame=CGRectMake(0, HiddenView.mj_h, kWidth, 135);
    [HeardView addSubview:HeadIMG1];


    Table = [[ZFBTable alloc] initWithFrame:CGRectMake(0, RootView_h, kWidth, kHeight-HeardView.mj_h) style:UITableViewStyleGrouped];
    Table.clipsToBounds=YES;
    Table.scrollEnabled=NO;
    [zfbScroll addSubview:Table];




    UIView *myview=HiddenView;

    //把UI传入 ZFBScroll 来交互
    [zfbScroll addReferenceUI:Table RootUI:HeardView HiddenUI:HiddenView RetrunScroll_Y:^(float y) {
    
        float Per = y/HiddenView_h;
        myview.alpha=1-Per;

    }];


}











@end
