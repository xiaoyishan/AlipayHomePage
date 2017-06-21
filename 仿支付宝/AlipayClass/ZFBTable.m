//
//  ZFBTable.m
//  仿支付宝
//
//  Created by Sundear on 2017/6/19.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ZFBTable.h"

@implementation ZFBTable

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = 44;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:nil];
        self.tableFooterView=[UIView new];
    }
    return self;
}


-(void)setContentOffsetY:(CGFloat)contentOffsetY {
    _contentOffsetY = contentOffsetY;
    if ([self.mj_header isRefreshing]) {
        [self setContentOffset:CGPointMake(0, -MJRefreshHeaderHeight) animated:NO];
    }else{
        self.mj_offsetY=_contentOffsetY;
    }
}



-(void)HeardRefresh:(UIScrollView*)scroller{
    _List=[NSMutableArray new];
    [self.mj_header beginRefreshing];
    [self MoreDataFromHTTPGet:scroller Parameter:nil];
}

-(void)FootRefresh:(UIScrollView*)scroller{
    [scroller.mj_footer beginRefreshing];
    [self MoreDataFromHTTPGet:scroller Parameter:nil];
}

-(void)MoreDataFromHTTPGet:(UIScrollView*)scroller Parameter:(NSDictionary*)par{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        for (int k=0; k<10;  k++) {
            [_List addObject:@"arc"];
        }
        
        [self reloadData];

        //位置
        scroller.contentSize=CGSizeMake(0, self.contentSize.height+RootView_h);
        self.mj_h=self.contentSize.height;

        [self.mj_header endRefreshing];
        [scroller.mj_footer endRefreshing];
    });
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _List.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];

    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//  group 样式可选
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
    return 30.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"相关动态";
}
@end
