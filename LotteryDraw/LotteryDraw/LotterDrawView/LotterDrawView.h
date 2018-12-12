//
//  LotterDrawView.h
//  LotteryDraw
//
//  Created by NextStep on 2018/12/12.
//  Copyright © 2018年 Ermao. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 中间按钮类型

 - CenterButtonTypeBegin: 开始抽奖
 - CenterButtonTypeExchange: 立即兑换
 - CenterButtonTypeFalse: 积分不足
 */
typedef NS_ENUM(NSUInteger, CenterButtonType) {
    CenterButtonTypeBegin = 1,
    CenterButtonTypeExchange,
    CenterButtonTypeFalse,
};

@interface LotterDrawView : UIView

/**
 转动时间，默认 5s
 */
@property (nonatomic, assign) int drawTime;

/**
 循环时间，默认 5s
 */
@property (assign, nonatomic) CGFloat time;

/**
 循环的上个按钮
 */
@property (assign,nonatomic)UIButton *temp;

/**
 停止的index,默认 0
 */
@property (assign, nonatomic) int stopCount;

/**
 按钮的宽高，默认80*80
 */
@property (nonatomic, assign) CGSize buttonSize;

/**
 左右间距，默认 8.f
 */
@property (nonatomic, assign) CGFloat magin_X;

/**
 上下间距，默认 8.f
 */
@property (nonatomic, assign) CGFloat magin_Y;

/**
 商品图片数组
 */
@property (nonatomic, strong) NSArray *shopImageArray;

/**
 按钮背景图片，默认白色
 */
@property (nonatomic, strong) UIImage *buttonBackImage;

/**
 按钮选中图片，默认红色
 */
@property (nonatomic, strong) UIImage *buttonSelecBackImage;

/**
 中间按钮图片
 */
@property (nonatomic, strong) UIImage *centerButtonImage;

/**
 中间按钮文字颜色
 */
@property (nonatomic, strong) UIColor *centerButtonTitleColor;

/**
 中间按钮文字大小
 */
@property (nonatomic, assign) CGFloat centerButtonTitleFont;

/**
 中间按钮类型
 */
@property (nonatomic, assign) CenterButtonType buttonType;

/**
 可抽奖次数
 */
@property (nonatomic, assign) CGFloat lotterDrawCount;

/**
 可兑换次数
 */
@property (nonatomic, assign) CGFloat exchangeCount;


@end
