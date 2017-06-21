//
//  ZFBScroll.m
//  仿支付宝
//
//  Created by Sundear on 2017/6/21.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ZFBScroll.h"

@implementation ZFBScroll

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [Table HeardRefresh:self];//模拟首次下拉刷新

            //scroller模拟table加载
            self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                [Table FootRefresh:self];//上拉加载
            }];
        });
    }
    return self;
}

-(void)addReferenceUI:(ZFBTable*)table RootUI:(UIView*)rootview HiddenUI:(UIView*)hiddenview RetrunScroll_Y:(ScrollYBlock)callback{
    Table=table;
    HeadView=rootview;
    HiddenView=hiddenview;
    _ScrollYBlockCopy=callback;
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat y = scrollView.mj_offsetY;

    if(_ScrollYBlockCopy && y<HiddenView_h)_ScrollYBlockCopy(y);//传递回Y值来做动画交互等

    if (y <= 0) {
        HeadView.mj_y=y;
        Table.mj_y=y+RootView_h;
        Table.contentOffsetY = y;//偏移量给到tableview，tableview自己来滑动
        HiddenView.mj_y=0;//滑动太快有时候不正确，这里是保护imageView 的frame为正确的

    } else {
        HiddenView.mj_y=y/2;//视差处理
    }
}

// 松手时
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat y = scrollView.mj_offsetY;
    if (y < - MJRefreshHeaderHeight) {
        [Table HeardRefresh:self];//下拉刷新
    }
    [self ScrollToTopOrResume:y];
}

// 结束时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat y = scrollView.mj_offsetY;
    [self ScrollToTopOrResume:y];
}

-(void)ScrollToTopOrResume:(float)Y{
    if (Y < 0 || Y>HiddenView_h) return;

    if (Y > HiddenView_h/2)
        [self setContentOffset:CGPointMake(0, HiddenView_h) animated:YES];
    else
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    
}


@end
