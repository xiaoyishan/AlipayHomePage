//
//  ViewController.m
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ViewController.h"

// 头部  64+104+135 = 303

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    titleLabel.text = @"支付宝首页";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor=BasicBlue;
    [self.view addSubview:titleLabel];

    rootView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
    rootView.contentSize = CGSizeMake(0, kHeight);
    rootView.scrollIndicatorInsets = UIEdgeInsetsMake(310, 0, 0, 0);
    rootView.delegate = self;
    [self.view addSubview:rootView];

    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 303)];
    [rootView addSubview:topView];

    




    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 104)];
    imageView.image = [UIImage imageNamed:@"1"];
    [topView addSubview:imageView];

    UIImageView *HeadIMG1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    HeadIMG1.frame=CGRectMake(0, imageView.mj_h, kWidth, 135);
    [topView addSubview:HeadIMG1];


    Table = [[ZFBTable alloc] initWithFrame:CGRectMake(0, 303-64, kWidth, kHeight-303) style:UITableViewStyleGrouped];
    Table.clipsToBounds=YES;
    Table.scrollEnabled=NO;
    [rootView addSubview:Table];

    //根据你的cell情况 自己计算第一次出来时table的高度 (待解决)
    Table.mj_h=44*10-64-104;

    //模拟首次刷新
    [Table startRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [Table endRefreshing];
    });

    //scroller模拟table加载
    rootView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [Table LoadMoreData];
            rootView.contentSize=CGSizeMake(0, Table.contentSize.height+303-64);
            Table.mj_h=Table.contentSize.height;
            [rootView.mj_footer endRefreshing];

            NSLog(@"设置高度:%.0f",Table.contentSize.height);
        });
    }];
    
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![rootView isEqual:scrollView]) return;
    CGFloat y = scrollView.contentOffset.y;

    if (y <= 0) {
        topView.mj_y=y;
        Table.mj_y=y+303-64;
        Table.contentOffsetY = y;//偏移量给到tableview，tableview自己来滑动
        imageView.mj_y=0;//滑动太快有时候不正确，这里是保护imageView 的frame为正确的。

        NSLog(@"Y:%.0f   Table.off_Y:%.0f",y,Table.mj_offsetY);
    } else {
        imageView.mj_y=y/2;//视差处理
    }
}
// 松手时
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat y = scrollView.contentOffset.y;
    if (y < - 54) {
        [Table startRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            rootView.contentSize=CGSizeMake(0, Table.contentSize.height+303-64);
            Table.mj_h=Table.contentSize.height;
            [Table endRefreshing];
        });
    }

    [self ScrollToTopOrResume:scrollView.mj_offsetY];
}
// 结束时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self ScrollToTopOrResume:scrollView.mj_offsetY];
}
-(void)ScrollToTopOrResume:(float)Y{
    if (Y < 0 || Y>104) return;

    if (Y > 104/2)
        [rootView setContentOffset:CGPointMake(0, 104) animated:YES];
    else
        [rootView setContentOffset:CGPointMake(0, 0) animated:YES];

}






@end
