//
//  LotterDrawView.m
//  LotteryDraw
//
//  Created by NextStep on 2018/12/12.
//  Copyright © 2018年 Ermao. All rights reserved.
//

#define IMAGE_NAME(x) [UIImage imageNamed:x]

#import "LotterDrawView.h"

@interface LotterDrawView()
@property (nonatomic, strong) UIButton *startBtn;//开始抽奖按钮
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

/**
 startTimer 定时器 - 控制转动
 currentTime 当前时间
 stopTime   停止时间
 */
@implementation LotterDrawView{
    NSTimer *startTimer;
    int currentTime;
    int stopTime;
    UIButton *btn0;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    UIButton *btn6;
    UIButton *btn7;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        //初始化循环按钮
        [self initializeCycleButton];
    }
    return self;
}

- (void)initializeCycleButton {
    CGFloat maginX = _magin_X ?:8;
    CGFloat maginY = _magin_Y ?:8;;
    CGFloat btnH = _buttonSize.width||_buttonSize.height?:80;
    //这里的9是因为创建按钮的时候要创建9个，最中间按钮不放商品
    for (int i = 0; i < 9; i++) {
        int row = i / 3;
        int col = i % 3;
        CGFloat x = maginX + (btnH + maginX) * col;
        CGFloat y = maginX + (btnH + maginY) * row;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, btnH, btnH);
        button.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [button setBackgroundImage:_buttonBackImage forState:UIControlStateNormal];
        [button setBackgroundImage:_buttonSelecBackImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClickedForTag:) forControlEvents:UIControlEventTouchUpInside];
        button.adjustsImageWhenHighlighted = NO;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 10, 10, 10);
        [self addSubview:button];
        button.tag = i;
        
        if (i == 4) {
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.frame = CGRectMake(x-10, y-10, btnH+20, btnH+20);
            [button setBackgroundImage:_centerButtonImage forState:UIControlStateNormal];
            [button setTitleColor:_centerButtonTitleColor forState:UIControlStateNormal];
            if (CenterButtonTypeBegin && floor(_lotterDrawCount)>0) {
                [button setTitle:[NSString stringWithFormat:@"开始抽奖\n共:%.f次",_lotterDrawCount] forState:UIControlStateNormal];
            }else {
                if (floor(_exchangeCount)>0) {
                    [button setTitle:[NSString stringWithFormat:@"立即兑换\n可换:%.f次",floor(_exchangeCount)] forState:UIControlStateNormal];
                }else{
                    [button setTitle:@"积分不足\n可换0次" forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    [button setBackgroundImage:IMAGE_NAME(@"integration-bkx") forState:UIControlStateNormal];
                }
            }
            button.titleLabel.font = [UIFont systemFontOfSize:_centerButtonTitleFont weight:UIFontWeightBold];
            button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            button.tag = 10;
            _startBtn = button;
            NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
            [attributeStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]} range:NSMakeRange(4, button.titleLabel.text.length-4)];
            button.titleLabel.attributedText = attributeStr;
            continue;
        }
        if (i != 4) {
//            if (integrationBoxModel.prize.count) {
//                if (i>4) {
//                    SQIntegrationPriceModel *model = integrationBoxModel.prize[i-1];
//                    [button sd_setImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal placeholderImage:IMAGE_NAME(@"gbbtn")];
//                }else{
//                    SQIntegrationPriceModel *model = integrationBoxModel.prize[i];
//                    [button sd_setImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal placeholderImage:IMAGE_NAME(@"gbbtn")];
//                }
//            }
            continue;
        }
        switch (i) {
            case 0:
                btn0 = button;
                break;
            case 1:
                btn1 = button;
                break;
            case 2:
                btn2 = button;
                break;
            case 3:
                btn3 = button;
                break;
            case 5:
                btn4 = button;
                break;
            case 6:
                btn5 = button;
                break;
            case 7:
                btn6= button;
                break;
            case 8:
                btn7 = button;
                break;
                
            default:
                
                break;
        }
        [self.buttonArray addObject:button];
    }
    //交换按钮的位置，以符合顺时针选择按钮
    [self TradePlacesWithBtn1:btn3 btn2:btn4];
    [self TradePlacesWithBtn1:btn4 btn2:btn7];
    [self TradePlacesWithBtn1:btn5 btn2:btn6];
}

//交换位置
- (void)TradePlacesWithBtn1:(UIButton *)firstBtn btn2:(UIButton *)secondBtn {
    CGRect frame = firstBtn.frame;
    firstBtn.frame = secondBtn.frame;
    secondBtn.frame = frame;
}

@end
