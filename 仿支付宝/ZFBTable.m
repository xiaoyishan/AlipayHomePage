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
        [self setContentOffset:CGPointMake(0, -54) animated:NO];
    }else{
        self.mj_offsetY=_contentOffsetY;
    }
}

-(void)startRefreshing {
    [self.mj_header beginRefreshing];
    _List=[NSMutableArray new];
    [self LoadMoreData];
}
-(void)endRefreshing {
    [self reloadData];
    [self.mj_header endRefreshing];
}
-(void)LoadMoreData{
    for (int k=0; k<10;  k++) {
        [_List addObject:@"arc"];
    }[self reloadData];
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
