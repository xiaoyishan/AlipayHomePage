//
//  ZFBScroll.h
//  仿支付宝
//
//  Created by Sundear on 2017/6/21.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFBTable.h"

@interface ZFBScroll : UIScrollView<UIScrollViewDelegate>{
    ZFBTable    *Table;
    UIView      *HeadView;
    UIView      *HiddenView;    //被遮挡的View
}


typedef void(^ScrollYBlock)(float y);
@property (nonatomic, copy) ScrollYBlock ScrollYBlockCopy;


-(void)addReferenceUI:(ZFBTable*)table RootUI:(UIView*)rootview HiddenUI:(UIView*)hiddenview RetrunScroll_Y:(ScrollYBlock)callback;




@end
