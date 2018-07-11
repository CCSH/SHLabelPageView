//
//  SHLabelPageView.h
//  SHLabelPageView
//
//  Created by CSH on 2018/7/10.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//标签页类型
typedef enum : NSUInteger {
    SHLabelPageType_more,   //多页
    SHLabelPageType_one,    //一页
} SHLabelPageType;

/**
 标签页
 */
@interface SHLabelPageView : UIView

//数组
@property (nonatomic, strong) NSArray *pageList;
//当前位置(默认是0)
@property (nonatomic, assign) NSInteger index;
//字体大小(默认是18)
@property (nonatomic, strong) UIFont *fontSize;
//选中颜色(默认是黑色)
@property (nonatomic, strong) UIColor *selectedColor;
//偏移量(设置滑动中的效果)
@property (nonatomic, assign) CGFloat contentOffsetX;
//回调(标签点击回调)
@property (nonatomic, copy) void(^pageViewBlock)(SHLabelPageView *pageView);
//类型
@property (nonatomic, assign) SHLabelPageType type;

//初始化
+ (instancetype)shareSHLabelPageView;

//刷新
- (void)reloadView;

@end
